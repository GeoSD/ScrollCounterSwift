//
//  ViewController.swift
//  ScrollCounterSwift
//
//  Created by Georgy Dyagilev on 14/05/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var onesDigitView: DigitView!
    @IBOutlet var tensDigitView: DigitView!
    @IBOutlet var hundredsDigitView: DigitView!
    @IBOutlet var oneThousandsDigitView: DigitView!
    @IBOutlet var tenThousandsDigitView: DigitView!
    @IBOutlet var hundredThousandsDigitView: DigitView!
    @IBOutlet var oneMillionsDigitView: DigitView!
    @IBOutlet var tenMillionsDigitView: DigitView!
    @IBOutlet var hundredMillionsDigitView: DigitView!
    /*
     * NSTimer to be called once per second and add some random number to
     * the counter. This will get those numbers spinning.
     */
    var addNumberTimer: Timer?
    
    /**
     * Holds the actual number that we show with the DigitViews
     */
    var number: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // random between 1,000,000 and 10,000,000
        number = 1000000 + arc4random_uniform(9000000)
        
        for familyNames in UIFont.familyNames {
            print(familyNames)
            for font in UIFont.fontNames(forFamilyName: familyNames) {
                print("===\(font)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNumberTimer = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(addRundomNumber(_:)),
                                              userInfo: nil,
                                              repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        addNumberTimer?.invalidate()
    }
    
    @objc func addRundomNumber(_ timer: Timer?) {
        number += 500 + arc4random_uniform(3000)
        var tmpNumber = number

        onesDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        tensDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        hundredsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        
        oneThousandsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        tenThousandsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        hundredThousandsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        
        oneMillionsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        tenMillionsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
        hundredMillionsDigitView.scroll(toDigit: (tmpNumber % 10))
        tmpNumber = tmpNumber / 10
    }
}

