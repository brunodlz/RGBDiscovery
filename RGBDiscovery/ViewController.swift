//
//  ViewController.swift
//  RGBDiscovery
//
//  Created by bruno da luz on 5/14/15.
//  Copyright (c) 2015 bruno v0id. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderAlpha: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var fRed:   CGFloat = 0
    var fGreen: CGFloat = 0
    var fBlue:  CGFloat = 0
    var fAlpha: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startWithAnimation()
        updateColor()
        updateRGB()
        updateHex()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func startWithAnimation() {
        self.redLabel.center.x = self.view.frame.width + 30
        self.greenLabel.center.x = self.view.frame.width + 30
        self.blueLabel.center.x = self.view.frame.width + 30
        
        UIView.animateWithDuration(1.0) { 
            self.redLabel.center.x = self.view.frame.width / 2
            self.sliderRed.center.x = self.view.frame.width / 2
        }
        
        
        UIView.animateWithDuration(1.0) {
            self.greenLabel.center.x = self.view.frame.width / 2
            self.sliderGreen.center.x = self.view.frame.width / 2
            }
        
        UIView.animateWithDuration(1.0) {
            self.blueLabel.center.x = self.view.frame.width / 2
            self.sliderBlue.center.x = self.view.frame.width / 2
            }
        
        UIView.animateWithDuration(1.0) {
            self.hexLabel.center.x = self.view.frame.width / 0.5
            self.sliderAlpha.center.x = self.view.frame.width / 0.5
            }
    }
    
    @IBAction func updateBackground() {
        updateColor()
        updateRGB()
        updateHex()
    }
    
    func updateColor() {
        self.fRed   = CGFloat(self.sliderRed.value)
        self.fGreen = CGFloat(self.sliderGreen.value)
        self.fBlue  = CGFloat(self.sliderBlue.value)
        self.fAlpha  = CGFloat(self.sliderAlpha.value)
        
        self.view.backgroundColor = UIColor(red: self.fRed, green: self.fGreen, blue: self.fBlue, alpha: self.fAlpha)
    }
    
    func updateRGB() {
        let iRed = Int(self.fRed * 255)
        self.redLabel.text = "\(iRed)"
        
        let iGreen = Int(self.fGreen * 255)
        self.greenLabel.text = "\(iGreen)"
        
        let iBlue = Int(self.fBlue * 255)
        self.blueLabel.text = "\(iBlue)"
    }
    
    func updateHex() {
        let sRed = getRedHex()
        let sGreen = getGreenHex()
        let sBlue = getBlueHex()
        
        self.hexLabel.text = "#\(sRed)\(sGreen)\(sBlue)".uppercaseString
    }
    
    func getRedHex() -> String {
        let iRed = Int(self.fRed * 255)
        let i = Int16(iRed)
        let sHex = hex(i)
        _ = (sHex.characters).dropFirst()
        return ""
    }
    
    func getGreenHex() -> String {
        let iGreen = Int(self.fGreen * 255)
        let i = Int16(iGreen)
        let sHex = hex(i)
        _ = (sHex.characters).dropFirst()
        return ""
    }
    
    func getBlueHex() -> String {
        let iBlue = Int(self.fBlue * 255)
        let i = Int16(iBlue)
        let sHex = hex(i)
        _ = (sHex.characters).dropFirst()
        return ""
    }
    
    func hex<T: SignedIntegerType>(v: T) -> String {
        var s = ""
        var i = v.toIntMax()
        for _ in 0..<sizeof(T)*2 {
            s = String(format: "%x", i & 0xF) + s
            i = i >> 4
        }
        return s
    }
}

