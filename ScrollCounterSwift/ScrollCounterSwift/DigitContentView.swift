//
//  DigitContentView.swift
//  ScrollCounterSwift
//
//  Created by Georgy Dyagilev on 14/05/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class DigitContentView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 900.0)
        backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        var fontAttributes: [NSAttributedString.Key: AnyObject]? = nil
        
        if let font = UIFont(name: "AvenirNext-DemiBold", size: 80) {
            fontAttributes = [NSAttributedString.Key.font: font,
                              NSAttributedString.Key.foregroundColor: UIColor.black,
                              NSAttributedString.Key.paragraphStyle: paragraphStyle]
        }
        
        "0".draw(in: CGRect(x: 0, y: 90 * 0, width: 50, height: 90), withAttributes: fontAttributes)
        "1".draw(in: CGRect(x: 0, y: 90 * 1, width: 50, height: 90), withAttributes: fontAttributes)
        "2".draw(in: CGRect(x: 0, y: 90 * 2, width: 50, height: 90), withAttributes: fontAttributes)
        "3".draw(in: CGRect(x: 0, y: 90 * 3, width: 50, height: 90), withAttributes: fontAttributes)
        "4".draw(in: CGRect(x: 0, y: 90 * 4, width: 50, height: 90), withAttributes: fontAttributes)
        "5".draw(in: CGRect(x: 0, y: 90 * 5, width: 50, height: 90), withAttributes: fontAttributes)
        "6".draw(in: CGRect(x: 0, y: 90 * 6, width: 50, height: 90), withAttributes: fontAttributes)
        "7".draw(in: CGRect(x: 0, y: 90 * 7, width: 50, height: 90), withAttributes: fontAttributes)
        "8".draw(in: CGRect(x: 0, y: 90 * 8, width: 50, height: 90), withAttributes: fontAttributes)
        "9".draw(in: CGRect(x: 0, y: 90 * 9, width: 50, height: 90), withAttributes: fontAttributes)
    }
}
