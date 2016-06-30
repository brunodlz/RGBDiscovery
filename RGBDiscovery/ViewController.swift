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

        let frameWidth = self.view.frame.width

        self.redLabel.center.x   = frameWidth + 30
        self.greenLabel.center.x = frameWidth + 30
        self.blueLabel.center.x  = frameWidth + 30

        UIView.animateWithDuration(1.0) {
            self.redLabel.center.x  = frameWidth / 2
            self.sliderRed.center.x = frameWidth / 2
        }


        UIView.animateWithDuration(1.0) {
            self.greenLabel.center.x  = frameWidth / 2
            self.sliderGreen.center.x = frameWidth / 2
        }

        UIView.animateWithDuration(1.0) {
            self.blueLabel.center.x  = frameWidth / 2
            self.sliderBlue.center.x = frameWidth / 2
        }
    }

    @IBAction func updateBackground() {
        updateColor()
    }

    func updateColor() {
        let red    = CGFloat(self.sliderRed.value)
        let green  = CGFloat(self.sliderGreen.value)
        let blue   = CGFloat(self.sliderBlue.value)

        self.redLabel.text   = "\(self.sliderRed.number(red))"
        self.greenLabel.text = "\(self.sliderGreen.number(green))"
        self.blueLabel.text  = "\(self.sliderBlue.number(blue))"

        self.view.backgroundColor = UIColor(red: red,
                                            green: green,
                                            blue: blue,
                                            alpha: 1.0)
    }
}
