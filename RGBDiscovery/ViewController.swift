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
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: nil, animations: { () -> Void in
            self.redLabel.center.x = self.view.frame.width / 2
            self.sliderRed.center.x = self.view.frame.width / 2
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.1, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: nil, animations: { () -> Void in
            self.greenLabel.center.x = self.view.frame.width / 2
            self.sliderGreen.center.x = self.view.frame.width / 2
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: nil, animations: { () -> Void in
            self.blueLabel.center.x = self.view.frame.width / 2
            self.sliderBlue.center.x = self.view.frame.width / 2
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: nil, animations: { () -> Void in
            self.hexLabel.center.x = self.view.frame.width / 0.5
            self.sliderAlpha.center.x = self.view.frame.width / 0.5
            }, completion: nil)
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
        var iRed = Int(self.fRed * 255)
        self.redLabel.text = "\(iRed)"
        
        var iGreen = Int(self.fGreen * 255)
        self.greenLabel.text = "\(iGreen)"
        
        var iBlue = Int(self.fBlue * 255)
        self.blueLabel.text = "\(iBlue)"
    }
    
    func updateHex() {
        var sRed = getRedHex()
        var sGreen = getGreenHex()
        var sBlue = getBlueHex()
        
        self.hexLabel.text = "#\(sRed)\(sGreen)\(sBlue)".uppercaseString
    }
    
    func getRedHex() -> String {
        var iRed = Int(self.fRed * 255)
        var i = Int16(iRed)
        var sHex = hex(i)
        var aux = dropFirst(sHex)
        return dropFirst(aux)
    }
    
    func getGreenHex() -> String {
        var iGreen = Int(self.fGreen * 255)
        var i = Int16(iGreen)
        var sHex = hex(i)
        var aux = dropFirst(sHex)
        return dropFirst(aux)
    }
    
    func getBlueHex() -> String {
        var iBlue = Int(self.fBlue * 255)
        var i = Int16(iBlue)
        var sHex = hex(i)
        var aux = dropFirst(sHex)
        return dropFirst(aux)
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

