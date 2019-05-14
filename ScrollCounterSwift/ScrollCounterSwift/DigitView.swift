//
//  DigitView.swift
//  ScrollCounterSwift
//
//  Created by Georgy Dyagilev on 14/05/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//


import UIKit

enum DigitScrollStyle {
    case flick
    case spring
}

class DigitView: UIView, UIScrollViewDelegate {
    private weak var scrollView: UIScrollView?
    private weak var digitsView: DigitContentView?
    let scrollStyle: DigitScrollStyle = .spring
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    func addViews() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 90)
        let scrollView = UIScrollView(frame: frame)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        let digitsView = DigitContentView()
        scrollView.addSubview(digitsView)
        self.digitsView = digitsView
        
        scrollView.contentSize = CGSize(width: 50, height: 900)
        addSubview(scrollView)
        self.scrollView = scrollView
        
        let height: CGFloat = frame.size.height
        let width: CGFloat = frame.size.width
        
        let whiteWithNoAlpha = UIColor(white: 1.0, alpha: 0.0)
        let whiteWithFullAlpha = UIColor(white: 1.0, alpha: 1.0)
        
        let colors = [whiteWithNoAlpha.cgColor, whiteWithFullAlpha.cgColor]
        
        let topPoint = CGPoint(x: 0.5, y: 1.0)
        let bottomPoint = CGPoint(x: 0.5, y: 0.0)
        
        let topGradientView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: width, height: 22.0))
        
        let topGradient = CAGradientLayer()
        topGradient.frame = CGRect(x: 0.0, y: 0.0, width: width, height: 22.0)
        topGradient.colors = colors
        topGradient.startPoint = topPoint
        topGradient.endPoint = bottomPoint
        topGradientView.layer.insertSublayer(topGradient, at: 0)
        
        addSubview(topGradientView)
        
        let bottomGradientView = UIView(frame: CGRect(x: 0.0, y: height - 8.0, width: width, height: 8.0))
        
        let bottomGradient = CAGradientLayer()
        bottomGradient.frame = CGRect(x: 0.0, y: 0.0, width: width, height: 8)
        bottomGradient.colors = colors
        bottomGradient.startPoint = bottomPoint
        bottomGradient.endPoint = topPoint
        
        bottomGradientView.layer.insertSublayer(bottomGradient, at: 0)
        
        addSubview(bottomGradientView)
    }
    
    func scroll(toDigit digit: UInt32) {
        let offset: CGFloat = CGFloat(90.0 * Double(digit))
        
        if scrollStyle == DigitScrollStyle.flick {
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseOut, animations: {
                self.scrollView!.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
            }) { finished in
                //nothing
            }
        } else if scrollStyle == DigitScrollStyle.spring {
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                self.scrollView!.setContentOffset(CGPoint(x: 0, y: offset), animated: false)
            }) { finished in
                //nothing
            }
        }
    }
}
