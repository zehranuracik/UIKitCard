//
//  ViewController.swift
//  CardStoryboard
//
//  Created by Zehra Nur Açık on 19.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    var timer : Timer!
    var cards : [UIImage] = Deck.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }

    @IBAction func stopButtonClicked(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonClicked(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
}

