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

    override func viewDidLoad() {
        super.viewDidLoad()

        startWithAnimation()
        updateColor()
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
    }

    func updateColor() {
        let red    = CGFloat(self.sliderRed.value)
        let green  = CGFloat(self.sliderGreen.value)
        let blue   = CGFloat(self.sliderBlue.value)
        let alpha  = CGFloat(self.sliderAlpha.value)

        self.redLabel.text   = "\(self.sliderRed.number(red))"
        self.greenLabel.text = "\(self.sliderGreen.number(green))"
        self.blueLabel.text  = "\(self.sliderBlue.number(blue))"

        self.view.backgroundColor = UIColor(red: red,
                                            green: green,
                                            blue: blue,
                                            alpha: alpha)
    }
}
