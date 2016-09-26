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
class TextTimeView: UIView {
    
    @IBInspectable var CharactersPerRow: Int = 11
    @IBInspectable var RowsCount: Int = 10
    @IBInspectable var FontSizeFactor:CGFloat = 0.85
    @IBInspectable var onOpacity: CGFloat = 0.9
    @IBInspectable var offOpacity: CGFloat = 0.3
    @IBInspectable var fontName: String = "HelveticaNeue"
    
    func initialize() {

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let CharSize = CGSize(width: frame.width / CGFloat(CharactersPerRow), height: frame.height / CGFloat(RowsCount))
        let fontSize = ((CharSize.width > CharSize.height) ? CharSize.height : CharSize.width) * FontSizeFactor
        
        let font = UIFont(name: fontName, size: fontSize)
        let forgroundCGColor = tintColor?.cgColor
        let TextYOffset = (CharSize.height - (font?.pointSize)!)
        
        for (index, char) in TextTime.characters.enumerated() {
            let charView = CATextLayer()
            charView.font = font
            charView.fontSize = fontSize
            charView.string = String(char)
            charView.opacity = Float(offOpacity)
            charView.isOpaque = false
            charView.frame = CGRect(x: CharSize.width * CGFloat(index % CharactersPerRow),
                                    y: (CharSize.height * CGFloat(index / CharactersPerRow)) + TextYOffset,
                                    width: CharSize.width, height: CharSize.height)
            charView.alignmentMode = kCAAlignmentCenter
            charView.foregroundColor = forgroundCGColor;
            layer.addSublayer(charView)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
}

