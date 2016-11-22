//
//  VisibleTouchView.swift
//  VisibleTouchViewSwift
//
//  Created by Benjamin Chrobot on 11/16/16.
//  Copyright © 2016 Treble Media, Inc. All rights reserved.
//

import Foundation

fileprivate let startScale: CGFloat = 2
fileprivate let endScale: CGFloat = 1.2

/// Foobar
public class VisibleTouchWindow: UIWindow {

    // MARK: - Properties

    public var isShowTouchesEnabled: Bool = true
    public var appearAnimationDuration: Double = 0.1
    public var disappearAnimationDuration: Double = 0.1
    private let pointerSize = CGSize(width: 50, height: 50)

    // MARK: - Lifecycle

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Event Handling

    override public func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)

        guard event.type == .touches, let allTouches = event.allTouches else {
            return
        }

        for touch in allTouches {
            switch touch.phase {
            case .began:
                // Don't display new touches if showTouches is disabled
                guard isShowTouchesEnabled else {
                    return
                }

                // Create touch point view
                let point = touch.location(in: self)
                let origin = CGPoint(x: point.x - pointerSize.width / 2,
                                     y: point.y - pointerSize.height / 2)
                let touchPointView = TouchPointView(frame: CGRect(origin: origin, size: pointerSize))
                touchPointView.transform = CGAffineTransform(scaleX: startScale, y: startScale)
                touchPointView.alpha = 0

                // Store view with touch event
                touch.touchPointView = touchPointView

                // Display touch with animation
                addSubview(touchPointView)
                UIView.animate(withDuration: appearAnimationDuration) {
                    touchPointView.transform = CGAffineTransform.identity
                    touchPointView.alpha = 1
                }

            case .ended, .cancelled:
                // Retrieve touch point view from event
                if let touchPointView = touch.touchPointView {
                    // Animate removal
                    UIView.animate(withDuration: disappearAnimationDuration, animations: {
                        touchPointView.transform = CGAffineTransform(scaleX: endScale, y: endScale)
                        touchPointView.alpha = 0;
                    }, completion: { (_) in
                        touchPointView.removeFromSuperview()
                    })
                }
                break

            case .moved:
                // Retrieve touch point view from event
                if let touchPointView = touch.touchPointView {
                    // Determine point's new frame based on touch event
                    let point = touch.location(in: self)
                    var touchFrame = touchPointView.frame
                    touchFrame.origin.x = point.x - pointerSize.width / 2
                    touchFrame.origin.y = point.y - pointerSize.height / 2

                    // Animate movement
                    touchPointView.frame = touchFrame
                }
                break

            default:
                break
            }
        }
    }
}
