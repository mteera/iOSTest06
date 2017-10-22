//
//  CustomUIButton.swift
//  FoodWaste
//
//  Created by Mongkol Teera (i7676893) on 12/03/2017.
//  Copyright © 2017 mteera. All rights reserved.
//

import UIKit

@IBDesignable class CustomUIButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable open var shadowOpacityBadge: CGFloat = 0.5 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacityBadge)
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    /// Size of the badge shadow
    @IBInspectable open var shadowRadiusBadge: CGFloat = 0.5 {
        didSet {
            layer.shadowRadius = shadowRadiusBadge
            setNeedsDisplay()
        }
    }
    
    /// Color of the badge shadow
    @IBInspectable open var shadowColorBadge: UIColor = UIColor.black {
        didSet {
            layer.shadowColor = shadowColorBadge.cgColor
            setNeedsDisplay()
        }
    }
    
    /// Offset of the badge shadow
    @IBInspectable open var shadowOffsetBadge: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffsetBadge
            setNeedsDisplay()
        }
    }

}
