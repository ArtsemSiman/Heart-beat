//
//  ViewController.swift
//  HeartBeat
//
//  Created by Артём Симан on 15.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    @IBOutlet weak var textInfo: UITextView!
    
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
        
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 2
        myShadow.shadowOffset = CGSize(width: 2, height: 2)
        myShadow.shadowColor = UIColor.white
        
        let myAttribute = [NSAttributedString.Key.font: UIFont(name: "Cimero Pro", size: 14)!,
                           NSAttributedString.Key.backgroundColor: UIColor.yellow,
                           NSAttributedString.Key.shadow: myShadow ]
        
       
        
        let myString = NSMutableAttributedString( string: "Проверь как будет биться твоё сердечко. ВАЖНО! Если у тебя что-то не получилось,\n то ты мёртв или можешь позвонить +375291234567", attributes: myAttribute)
        
        let myRange = NSRange(location: 40, length: 6)
        myString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.red, range: myRange)
        textInfo.attributedText = NSAttributedString(attributedString: myString)
       

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

