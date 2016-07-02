//
//  ViewController.swift
//  RGBDiscovery
//
//  Created by bruno da luz on 5/14/15.
//  Copyright (c) 2015 Bruno da Luz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!

    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startWithAnimation()
        updateColor()
        effectView()
    }

    func effectView() {
        let bounds = self.navigationController?.navigationBar.bounds as CGRect!
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        visualEffectView.frame = bounds
        visualEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.navigationController?.navigationBar.addSubview(visualEffectView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func startWithAnimation() {
        let frameWidth = self.view.frame.width

        self.redLabel.center.x   = frameWidth + 30
        self.greenLabel.center.x = frameWidth + 30
        self.blueLabel.center.x  = frameWidth + 30

        self.view.animation(frameWidth, label: self.redLabel, slider: self.sliderRed)
        self.view.animation(frameWidth, label: self.greenLabel, slider: self.sliderGreen)
        self.view.animation(frameWidth, label: self.blueLabel, slider: self.sliderBlue)
    }

    @IBAction func updateBackground() {
        updateColor()
    }

    func updateColor() {
        let red    = CGFloat(self.sliderRed.value)
        let green  = CGFloat(self.sliderGreen.value)
        let blue   = CGFloat(self.sliderBlue.value)

        let hexRed   = self.sliderRed.getHex(red)
        let hexGreen = self.sliderGreen.getHex(green)
        let hexBlue  = self.sliderBlue.getHex(blue)

        self.hexLabel.text = "#\(hexRed)\(hexGreen)\(hexBlue)".uppercaseString

        self.redLabel.text   = "\(self.sliderRed.number(red))"
        self.greenLabel.text = "\(self.sliderGreen.number(green))"
        self.blueLabel.text  = "\(self.sliderBlue.number(blue))"

        self.view.backgroundColor = UIColor(red: red,
                                            green: green,
                                            blue: blue,
                                            alpha: 1.0)
    }
}
