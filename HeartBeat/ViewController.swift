//
//  ViewController.swift
//  HeartBeat
//
//  Created by Артём Симан on 15.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0

    @IBOutlet weak var heart: UIImageView!
    
    @IBOutlet weak var heartHeight: NSLayoutConstraint!
    @IBOutlet weak var numberOfBeats: UIStepper!
    
    @IBOutlet weak var beatsString: UITextField!
    
    @IBOutlet weak var start: UIButton!
    
    @IBAction func numberOfBeatsAction(_ sender: UIStepper) {
        beatsString.text = "Количество ударов: \(String(Int(numberOfBeats.value)))"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        start.addTarget(self, action: #selector(heartBeats), for: .touchUpInside)
    }


    
    @objc
    private func heartBeats() {
        guard Int(self.numberOfBeats.value) > 0 else {return}
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.heartHeight.constant += 30
            self.view.layoutIfNeeded()
        }, completion: {_ in
            self.heartHeight.constant -= 30
            self.view.layoutIfNeeded()
            self.counter += 1
            if (self.counter < Int(self.numberOfBeats.value)) {
                self.heartBeats()
            } else {
                self.counter = 0
            }
        })
    }
}

