//
//  UITouch+TouchPointView.swift
//  VisibleTouchViewSwift
//
//  Created by Benjamin Chrobot on 11/17/16.
//  Copyright © 2016 Treble Media, Inc. All rights reserved.
//

import Foundation
import ObjectiveC

internal extension UITouch {

    private struct AssociationKeys {
        static var TouchPointView: UInt8 = 0
    }

    var touchPointView: TouchPointView! {
        get {
            return objc_getAssociatedObject(self, &AssociationKeys.TouchPointView) as? TouchPointView
        }
        set(touchPointView) {
            objc_setAssociatedObject(self,
                                     &AssociationKeys.TouchPointView,
                                     touchPointView,
                                     .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
