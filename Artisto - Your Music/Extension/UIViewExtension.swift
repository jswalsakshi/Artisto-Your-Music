//
//  UIViewExtension.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 12/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
    
    func setBorderWidth(_ width: Float, withColor color: UIColor, CornerRadius cornerRadius: CGFloat) {
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
