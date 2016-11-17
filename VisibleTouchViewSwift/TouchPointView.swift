//
//  TouchPointView.swift
//  VisibleTouchViewSwift
//
//  Created by Benjamin Chrobot on 11/16/16.
//  Copyright © 2016 Treble Media, Inc. All rights reserved.
//

import Foundation

internal class TouchPointView: UIView {

    var pointerColor: UIColor = UIColor(red: 0, green: 0.75, blue: 1, alpha: 0.7)
    var pointerStockColor: UIColor = UIColor.cyan.withAlphaComponent(0.7)

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .clear
        self.isOpaque = false
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIView

    override func draw(_ rect: CGRect) {
        drawPointer(withSize: rect.size, stockWidth: 3)
    }

    // MARK: - Private

    private func drawPointer(withSize size: CGSize, stockWidth: CGFloat) {
        // Circle
        let circleRect = CGRect(x: 5, y: 5, width: size.width - 10, height: size.height - 10)
        let circlePath = UIBezierPath(ovalIn: circleRect)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = pointerColor.cgColor
        shapeLayer.strokeColor = pointerStockColor.cgColor
        shapeLayer.lineWidth = stockWidth

        layer.addSublayer(shapeLayer)

        // Shadow
        let shadowColor: UIColor = UIColor.black.withAlphaComponent(0.2)
        let shadowOffset = CGSize(width: 0.1, height: -0.1)
        let shadowBlurRadius: CGFloat = 4;

        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowBlurRadius
        layer.shadowPath = circlePath.cgPath
    }
}
