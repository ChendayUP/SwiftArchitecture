//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
//                  http://www.icocos.cn                       //
//                 https://icocos.github.io                    //
//                https://al1020119.github.io                  //
// **************************************************************
//  ************  😂🤔 曹理鹏(梦工厂@iCocos) 🤔😂  ************  //
// **************************************************************
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
//
//  Single_App
//  TiledScrollView
//
//  Created by iCocos on 2018/12/24.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class TiledScrollView.swift
// @abstract 碎片整体ScrollView
// @discussion 用于显示整体碎片ScrollView
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

let kTiledScrollViewAnimationTime = TimeInterval(0.1)

@objc protocol TiledScrollViewDelegate: NSObjectProtocol {
    
    func tiledScrollView(_ scrollView: TiledScrollView, viewForAnnotation annotation: TiledAnnotation) -> TiledAnnotationView

    @objc optional func tiledScrollViewDidZoom(_ scrollView: TiledScrollView)

    @objc optional func tiledScrollViewDidScroll(_ scrollView: TiledScrollView)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, annotationWillDisappear annotation: TiledAnnotation)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, annotationDidDisappear annotation: TiledAnnotation)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, annotationWillAppear annotation: TiledAnnotation)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, annotationDidAppear annotation: TiledAnnotation)

    /**
     Whether the annotation view be selected. If not implemented, defaults to `true`

     - Parameters:
     - scrollView: The tiled scroll view
     - view: The annotation view

     - Returns: Whether the annotation view be selected
     */
    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, shouldSelectAnnotationView view: TiledAnnotationView) -> Bool

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, didSelectAnnotationView view: TiledAnnotationView)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, didDeselectAnnotationView view: TiledAnnotationView)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, didReceiveSingleTap gestureRecognizer: UIGestureRecognizer)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, didReceiveDoubleTap gestureRecognizer: UIGestureRecognizer)

    @objc optional func tiledScrollView(_ scrollView: TiledScrollView, didReceiveTwoFingerTap gestureRecognizer: UIGestureRecognizer)
}

@objc protocol TileSource: NSObjectProtocol {
    
    func tiledScrollView(_ scrollView: TiledScrollView, imageForRow row: Int, column: Int, scale: Int) -> UIImage
}

@objc class TiledScrollView: UIView {
    
    //Delegates
    weak var tiledScrollViewDelegate: TiledScrollViewDelegate?
    weak var dataSource: TileSource?

    //internals
    var tiledView: TiledView!
    var scrollView: UIScrollView!
    var canvasView: UIView!
    
    var annotation: TiledAnnotation!

    //Default gesture behvaiour
    var centerSingleTap: Bool = true
    var zoomsInOnDoubleTap: Bool = true
    var zoomsToTouchLocation: Bool = false
    var zoomsOutOnTwoFingerTap: Bool = true

    var _levelsOfZoom: UInt!
    var _levelsOfDetail: UInt!
    var _muteAnnotationUpdates: Bool = false

    var levelsOfZoom: UInt
    {
        set
        {
            _levelsOfZoom = newValue

            self.scrollView.maximumZoomScale = pow(2.0, max(0.0, CGFloat(levelsOfZoom)))
        }
        get
        {
            return _levelsOfZoom
        }
    }
    var levelsOfDetail: UInt
    {
        set
        {
            _levelsOfDetail = newValue

            if levelsOfDetail == 1 {
                print("Note: Setting levelsOfDetail to 1 causes strange behaviour")
            }
            self.tiledView.numberOfZoomLevels = size_t(levelsOfDetail)
        }
        get
        {
            return _levelsOfDetail
        }
    }
    var zoomScale: CGFloat
    {
        set
        {
            self.setZoomScale(newValue, animated: false)
        }
        get
        {
            return scrollView.zoomScale
        }
    }
    /*private*/
    var muteAnnotationUpdates: Bool
    {
        set
        {

            // FIXME: Jesse C - I don't like overloading this here, but the logic is in one place
            _muteAnnotationUpdates = newValue

            self.isUserInteractionEnabled = !self.muteAnnotationUpdates
            if !self.muteAnnotationUpdates {
                self.correctScreenPositionOfAnnotations()
            }
        }
        get
        {
            return _muteAnnotationUpdates
        }
    }

    /*private*/
    var annotations: Set<TiledAnnotation> = Set()
    /*private*/
    var recycledAnnotationViews: Set<TiledAnnotationView> = Set()
    /*private*/
    var visibleAnnotations: Set<TiledVisibleAnnotationTuple> = Set()
    /*private*/
    var previousSelectedAnnotationTuple: TiledVisibleAnnotationTuple?
    /*private*/
    var currentSelectedAnnotationTuple: TiledVisibleAnnotationTuple?

    /*private*/
    var singleTapGestureRecognizer: UITapGestureRecognizer!
    /*private*/
    var doubleTapGestureRecognizer: UITapGestureRecognizer!
    /*private*/
    var twoFingerTapGestureRecognizer: UITapGestureRecognizer!

    // MARK: -

    // MARK: Init method and main methods
    init(frame: CGRect, contentSize: CGSize)
    {
        super.init(frame: frame)

        autoresizingMask = [.flexibleHeight, .flexibleWidth]

        scrollView = UIScrollView(frame: self.bounds)
        scrollView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.white
        scrollView.contentSize = contentSize
        scrollView.bouncesZoom = true
        scrollView.bounces = true
        scrollView.minimumZoomScale = 1.0

        levelsOfZoom = 2

        let canvasFrame = CGRect(origin: CGPoint.zero, size: scrollView.contentSize)
        canvasView = UIView(frame: canvasFrame)
        canvasView.isUserInteractionEnabled = false

        let tiledLayerClass = type(of: self).tiledLayerClass() as! UIView.Type
        tiledView = tiledLayerClass.init(frame: canvasFrame) as? TiledView
        tiledView.delegate = self

        scrollView.addSubview(tiledView)

        addSubview(scrollView)
        addSubview(canvasView)

        singleTapGestureRecognizer = TiledAnnotationTapGesture(
            target: self,
            action: #selector(singleTapReceived(_:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.delegate = self
        tiledView.addGestureRecognizer(singleTapGestureRecognizer)

        doubleTapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(doubleTapReceived(_:)))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        tiledView.addGestureRecognizer(doubleTapGestureRecognizer)

        singleTapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)

        twoFingerTapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(twoFingerTapReceived(_:)))
        twoFingerTapGestureRecognizer.numberOfTouchesRequired = 2
        twoFingerTapGestureRecognizer.numberOfTapsRequired = 1
        tiledView.addGestureRecognizer(twoFingerTapGestureRecognizer)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    class func tiledLayerClass() -> AnyClass
    {
        return TiledView.self
    }

    // MARK: Position
    /*private*/
    func correctScreenPositionOfAnnotations()
    {

        CATransaction.begin()
        CATransaction.setAnimationDuration(0.0)

        if (scrollView.isZoomBouncing || muteAnnotationUpdates) && !scrollView.isZooming {
            for t in visibleAnnotations {
                t.view.position = screenPositionForAnnotation(t.annotation)
            }
        }
        else {
            for annotation in annotations {
                let screenPosition = screenPositionForAnnotation(annotation)
                var t = visibleAnnotations.visibleAnnotationTupleForAnnotation(annotation)

                if screenPosition.tiled_isWithinBounds(bounds) {
                    if let t = t {
                        if t == currentSelectedAnnotationTuple {
                            canvasView.addSubview(t.view)
                        }
                        t.view.position = screenPosition
                    }
                    else {
                        // t is nil
                        let view = tiledScrollViewDelegate?.tiledScrollView(self, viewForAnnotation: annotation)

                        if let view = view {
                            view.position = screenPosition

                            t = TiledVisibleAnnotationTuple(annotation: annotation, view: view)

                            if let t = t {
                                tiledScrollViewDelegate?.tiledScrollView?(self, annotationWillAppear: t.annotation)

                                visibleAnnotations.insert(t)
                                canvasView.addSubview(t.view)

                                CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
                                let animation = CABasicAnimation(keyPath: "opacity")
                                animation.duration = 0.3
                                animation.repeatCount = 1
                                animation.fromValue = 0.0
                                animation.toValue = 1.0
                                t.view.layer.add(animation, forKey: "animateOpacity")

                                tiledScrollViewDelegate?.tiledScrollView?(self, annotationDidAppear: t.annotation)
                            }

                        }
                        else {
                            // view is nil
                            continue
                        }
                    }
                }
                else {
                    if let t = t {
                        tiledScrollViewDelegate?.tiledScrollView?(self, annotationWillAppear: t.annotation)

                        if t != currentSelectedAnnotationTuple {
                            t.view.removeFromSuperview()
                            recycledAnnotationViews.insert(t.view)
                            visibleAnnotations.remove(t)
                        }
                        else {
                            // FIXME: Anthony D - I don't like let the view in visible annotations array, but the logic is in one place
                            t.view.removeFromSuperview()
                        }

                        tiledScrollViewDelegate?.tiledScrollView?(self, annotationDidDisappear: t.annotation)
                    }
                } // if screenPosition.tiled_isWithinBounds(bounds)
            } // for obj in annotations
        }// if (scrollView.zoomBouncing || muteAnnotationUpdates) && !scrollView.zooming

        CATransaction.commit()
    }

    /*private*/
    func screenPositionForAnnotation(_ annotation: TiledAnnotation) -> CGPoint
    {
        var position = CGPoint.zero
        position.x = (annotation.contentPosition.x * self.zoomScale) - scrollView.contentOffset.x
        position.y = (annotation.contentPosition.y * self.zoomScale) - scrollView.contentOffset.y
        return position
    }

    // MARK: Mute Annotation Updates
    func makeMuteAnnotationUpdatesTrueFor(_ time: TimeInterval)
    {

        self.muteAnnotationUpdates = true

        let popTime = DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime, execute: {
            self.muteAnnotationUpdates = false
        })
    }

    // MARK: TiledScrollView
    func setZoomScale(_ zoomScale: CGFloat, animated: Bool)
    {
        scrollView.setZoomScale(zoomScale, animated: animated)
    }

    func setContentCenter(_ center: CGPoint, animated: Bool)
    {
        scrollView.tiled_setContentCenter(center, animated: animated)
    }

    // MARK: Annotation Recycling

    func dequeueReusableAnnotationViewWithReuseIdentifier(_ reuseIdentifier: String) -> TiledAnnotationView?
    {
        var viewToReturn: TiledAnnotationView? = nil

        for v in self.recycledAnnotationViews {
            if v.reuseIdentifier == reuseIdentifier {
                viewToReturn = v
                break
            }
        }

        if viewToReturn != nil {
            self.recycledAnnotationViews.remove(viewToReturn!)

        }

        return viewToReturn
    }

    // MARK: Annotations

    func refreshAnnotations()
    {
        self.correctScreenPositionOfAnnotations()

        for annotation in self.annotations {
            let t = self.visibleAnnotations.visibleAnnotationTupleForAnnotation(annotation)

            t?.view.setNeedsLayout()
            t?.view.setNeedsDisplay()
        }
    }

    func addAnnotation(_ annotation: TiledAnnotation) {
        
        self.annotations.insert(annotation)

        let screenPosition = self.screenPositionForAnnotation(annotation)

        if screenPosition.tiled_isWithinBounds(bounds) {

            if let view = self.tiledScrollViewDelegate?.tiledScrollView(self, viewForAnnotation: annotation) {
                
                view.position = screenPosition
                
                let t = TiledVisibleAnnotationTuple(annotation: annotation, view: view)
                self.visibleAnnotations.insert(t)
                
                self.canvasView.addSubview(view)
            }
        }
    }

    func addMainAnnotation(_ annotation: TiledAnnotation) {
        
        self.annotations.insert(annotation)
        
        let screenPosition = self.screenPositionForAnnotation(annotation)
        
        if screenPosition.tiled_isWithinBounds(bounds) {
            
            if let view = self.tiledScrollViewDelegate?.tiledScrollView(self, viewForAnnotation: annotation) {
                view.position = screenPosition
                let t = TiledVisibleAnnotationTuple(annotation: annotation, view: view)
                self.visibleAnnotations.insert(t)
                self.canvasView.addSubview(view)
                self.annotation = annotation;
            }
        }
    }
    
    func addAnnotations(_ annotations: [TiledAnnotation])
    {
        for annotation in annotations {
            self.addAnnotation(annotation)
        }
    }

    func removeAnnotation(_ annotation: TiledAnnotation?)
    {
        if let annotation = annotation {
            if self.annotations.contains(annotation) {

                if let t = self.visibleAnnotations.visibleAnnotationTupleForAnnotation(annotation) {

                    t.view.removeFromSuperview()
                    self.visibleAnnotations.remove(t)
                }

                self.annotations.remove(annotation)
            }
        }
    }

    func removeAnnotations(_ annotations: [TiledAnnotation])
    {
        for annotation in annotations {
            self.removeAnnotation(annotation)
        }
    }

    func removeAllAnnotations()
    {
        for annotation in self.annotations {
            self.removeAnnotation(annotation)
        }
    }

}

// MARK: - UIScrollViewDelegate

extension TiledScrollView: UIScrollViewDelegate
{

    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return self.tiledView
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView)
    {
        self.tiledScrollViewDelegate?.tiledScrollViewDidZoom?(self)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        self.correctScreenPositionOfAnnotations()

        self.tiledScrollViewDelegate?.tiledScrollViewDidScroll?(self)
    }
}

// MARK: - TiledBitmapViewDelegate

extension TiledScrollView: TiledBitmapViewDelegate {
    
    func tiledView(_ tiledView: TiledView, imageForRow row: Int, column: Int, scale: Int) -> UIImage {
        
        return self.dataSource!.tiledScrollView(self, imageForRow: row, column: column, scale: scale)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension TiledScrollView: UIGestureRecognizerDelegate {
    
    @objc func singleTapReceived(_ gestureRecognizer: UITapGestureRecognizer) {
        
        if gestureRecognizer.isKind(of: TiledAnnotationTapGesture.self) {
            
            let annotationGestureRecognizer = gestureRecognizer as! TiledAnnotationTapGesture

            previousSelectedAnnotationTuple = currentSelectedAnnotationTuple
            currentSelectedAnnotationTuple = annotationGestureRecognizer.tapAnnotation

            if nil == annotationGestureRecognizer.tapAnnotation {

                if let previousSelectedAnnotationTuple = self.previousSelectedAnnotationTuple {
                    self.tiledScrollViewDelegate?.tiledScrollView?(self, didDeselectAnnotationView: previousSelectedAnnotationTuple.view)
                }
                else if self.centerSingleTap {
                    self.setContentCenter(gestureRecognizer.location(in: self.tiledView), animated: true)
                }

                self.tiledScrollViewDelegate?.tiledScrollView?(self, didReceiveSingleTap: gestureRecognizer)
            }
            else {
                if let previousSelectedAnnotationTuple = self.previousSelectedAnnotationTuple {
                    var oldSelectedAnnotationView = previousSelectedAnnotationTuple.view

                    if oldSelectedAnnotationView == nil {
                        oldSelectedAnnotationView = self.tiledScrollViewDelegate?.tiledScrollView(self, viewForAnnotation: previousSelectedAnnotationTuple.annotation)
                    }
                    self.tiledScrollViewDelegate?.tiledScrollView?(self, didDeselectAnnotationView: oldSelectedAnnotationView!)
                }
                if currentSelectedAnnotationTuple != nil {
                    if let tapAnnotation = annotationGestureRecognizer.tapAnnotation {
                        let currentSelectedAnnotationView = tapAnnotation.view
                        if (tiledScrollViewDelegate?.tiledScrollView?(self, shouldSelectAnnotationView: currentSelectedAnnotationView!) ?? true) == true {
                            self.tiledScrollViewDelegate?.tiledScrollView?(self, didSelectAnnotationView: currentSelectedAnnotationView!)
                        }
                        else {
                            self.tiledScrollViewDelegate?.tiledScrollView?(self, didReceiveSingleTap: gestureRecognizer)
                        }
                    }
                }
            }
        }
    }

    @objc func doubleTapReceived(_ gestureRecognizer: UITapGestureRecognizer) {
        
        if self.zoomsInOnDoubleTap {
            let newZoom = self.scrollView.tiled_zoomScaleByZoomingIn(1.0)
            self.makeMuteAnnotationUpdatesTrueFor(kTiledScrollViewAnimationTime)

            if self.zoomsToTouchLocation {
                let bounds = scrollView.bounds
                let pointInView = gestureRecognizer.location(in: scrollView).applying(CGAffineTransform(scaleX: 1 / scrollView.zoomScale, y: 1 / scrollView.zoomScale)
                )
                let newSize = bounds.size.applying(CGAffineTransform(scaleX: 1 / newZoom, y: 1 / newZoom)
                )

                scrollView.zoom(to: CGRect(x: pointInView.x - (newSize.width / 2),
                                                 y: pointInView.y - (newSize.height / 2), width: newSize.width, height: newSize.height), animated: true)
            }
            else {
                scrollView.setZoomScale(newZoom, animated: true)
            }
        }
        self.tiledScrollViewDelegate?.tiledScrollView?(self, didReceiveDoubleTap: gestureRecognizer)
    }

    @objc func twoFingerTapReceived(_ gestureRecognizer: UITapGestureRecognizer) {
    
        if self.zoomsOutOnTwoFingerTap {

            let newZoom = self.scrollView.tiled_zoomScaleByZoomingOut(1.0)

            self.makeMuteAnnotationUpdatesTrueFor(kTiledScrollViewAnimationTime)

            scrollView.setZoomScale(newZoom, animated: true)
        }

        self.tiledScrollViewDelegate?.tiledScrollView?(self, didReceiveTwoFingerTap: gestureRecognizer)
    }

    /** Catch our own tap gesture if it is on an annotation view to set annotation.
     *Return NO to only recognize single tap on annotation
     */

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool
    {
        let location = gestureRecognizer.location(in: self.canvasView)

        (gestureRecognizer as? TiledAnnotationTapGesture)?.tapAnnotation = nil

        for t in self.visibleAnnotations {
            if t.view.frame.contains(location) {
                (gestureRecognizer as? TiledAnnotationTapGesture)?.tapAnnotation = t
                return true
            }
        }

        // Deal with all tap gesture
        return true
    }
}
