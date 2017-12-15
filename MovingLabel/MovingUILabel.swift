//
//  MovingUILabel.swift
//  MovingLabel
//
//  Created by Ram Vinay on 15/12/17.
//  Copyright © 2017 Ram Vinay. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class MovingUILabel: UILabel {

    var isRepeate: Bool = true
    var repetedText: String? = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    func textLayer() -> CATextLayer? {
        return self.layer as? CATextLayer
    }
    
    func setup() {
        
        self.text = self.text
        self.textColor = self.textColor
        self.font = self.font
        self.textLayer()?.alignmentMode = kCAAlignmentJustified
        self.textLayer()?.isWrapped = true
        self.layer.display()
        self.lineBreakMode   = .byClipping
        self.backgroundColor = self.backgroundColor
        self.textAlignment   = self.textAlignment
        self.font            = UIFont(name: "Helvetica", size: 17.0)
        
        _ = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(timer: Timer) {
        DispatchQueue.main.async {
            if let text = self.text, !text.isEmpty {
                let index = text.index(after: text.startIndex)
                self.text = text.substring(from: index)
            } else {
                if self.isRepeate {
                    self.text = self.repetedText
                } else {
                    self.text            = self.repetedText
                    timer.invalidate()
                }
            }
        }
    }
    
    func setText(text:NSString) {
        super.text = text as String
        self.textLayer()?.string = text
    }
    
    func setTextColor(textColor:UIColor) {
        super.textColor = textColor
        self.textLayer()?.foregroundColor = textColor.cgColor
    }
    
    func setFont(font:UIFont) {
        super.font = font
        let fontName:CFString = CFStringCreateWithCString(nil,font.fontName,CFStringBuiltInEncodings.UTF8.rawValue)
        let fontRef:CGFont = CGFont(fontName)!
        self.textLayer()?.font = fontRef
        self.textLayer()?.fontSize = font.pointSize
    }

}
