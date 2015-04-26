//
//  CGRect+Extension.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/25.
//  Copyright (c) 2015 Geilei_Chen. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGRect {
    init(boundingCenter center: CGPoint, radius: CGFloat) {
        assert(0 <= radius, "radius must be a positive value")
        
        self = CGRectInset(CGRect(origin: center, size: CGSizeZero), -radius, -radius)
    }
}

extension Float {
    var f: CGFloat { return CGFloat(self) }
}