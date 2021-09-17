//
//  ContainerView.swift
//  TouchEventsOutsideBounds
//
//  Created by Pete Smith on 17/09/2021.
//

import UIKit

class ContainerView: UIView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let button = subviews.first { $0 is UIButton }
        guard let button = button else { return false }
        let convertedPoint = button.convert(point, from: self)
        return button.point(inside: convertedPoint, with: event)
    }
}
