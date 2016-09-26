//
//  TextTimeView.swift
//  Timeverse
//
//  Created by Mohamed Ted Meftah on 9/26/16.
//  Copyright © 2016 Mohamed Ted Meftah. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class TextTimeView: UIView {
    
    @IBInspectable var CharactersPerRow: Int = 11
    @IBInspectable var RowsCount: Int = 10
    @IBInspectable var FontSizeFactor:CGFloat = 0.85
    @IBInspectable var onOpacity: Float = 0.9
    @IBInspectable var offOpacity: Float = 0.1
    @IBInspectable var fontName: String = "HelveticaNeue"
    
    func initialize() {
        let forgroundCGColor = tintColor?.cgColor
        for char in TextTime.characters {
            let charView = CATextLayer()
            charView.string = String(char)
            charView.opacity = offOpacity
            charView.isOpaque = false
            charView.alignmentMode = kCAAlignmentCenter
            charView.foregroundColor = forgroundCGColor;
            layer.addSublayer(charView)
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let CharSize = CGSize(width: frame.width / CGFloat(CharactersPerRow), height: frame.height / CGFloat(RowsCount))
        let fontSize = ((CharSize.width > CharSize.height) ? CharSize.height : CharSize.width) * FontSizeFactor
        let font = UIFont(name: fontName, size: fontSize)
        let TextYOffset = (CharSize.height - (font?.pointSize)!)
        
        for (index, charView) in (layer.sublayers as! [CATextLayer]).enumerated() {
            charView.font = font
            charView.fontSize = fontSize
            charView.frame = CGRect(x: CharSize.width * CGFloat(index % CharactersPerRow),
                                    y: (CharSize.height * CGFloat(index / CharactersPerRow)) + TextYOffset,
                                    width: CharSize.width,
                                    height: CharSize.height)
        }

    }
    
    public func setTime (hour: Int, minute: Int) {
        for charLayer in layer.sublayers as! [CATextLayer] { charLayer.opacity = offOpacity }
        for index in TextTime.getActiveChars(hour: hour, minute: minute) { (layer.sublayers?[index] as! CATextLayer).opacity = onOpacity }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
}

