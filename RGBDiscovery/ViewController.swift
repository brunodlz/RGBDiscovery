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
    
    @IBOutlet weak var redLabel: UITextField!
    @IBOutlet weak var greenLabel: UITextField!
    @IBOutlet weak var blueLabel: UITextField!
    @IBOutlet weak var hexLabel: UITextField!
    
    var fRed:   CGFloat = 0
    var fGreen: CGFloat = 0
    var fBlue:  CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor()
        updateRGB()
        updateHex()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        self.view.backgroundColor = UIColor(red: self.fRed, green: self.fGreen, blue: self.fBlue, alpha: 1)
    }
    
    func updateRGB() {
        var iRed = Int(self.fRed * 255)
        self.redLabel.text = "R: \(iRed)"
        
        var iGreen = Int(self.fGreen * 255)
        self.greenLabel.text = "G: \(iGreen)"
        
        var (iBlue) = Int(self.fBlue * 255)
        self.blueLabel.text = "B: \(iBlue)"
    }
    
    func updateHex() {
        var sRed = getRedHex()
        var sGreen = getGreenHex()
        var sBlue = getBlueHex()
        
        self.hexLabel.text = "Hex: #\(sRed)\(sGreen)\(sBlue)"
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

