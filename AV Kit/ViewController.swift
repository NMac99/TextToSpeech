//
//  ViewController.swift
//  AV Kit
//
//  Created by Narek Arsenyan on 08.11.21.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var voiceButton: UIButton!
    @IBOutlet weak var pitchValue: UILabel!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var rateValue: UILabel!
    @IBOutlet weak var rateSlider: UISlider!
    
    @IBOutlet weak var AppleImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUIViews()
        
        pitchSlider.value = 1
        pitchSlider.minimumValue = 0.5
        pitchSlider.maximumValue = 2.0
        pitchValue.text = String(format: "%.1f", pitchSlider.value)
        
        rateSlider.value = AVSpeechUtteranceMaximumSpeechRate
        rateSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        rateSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
        rateValue.text = String(format: "%.1f", rateSlider.value)
        
    }
    
    func SetupUIViews() {
        textView.text = ""
        textView.layer.cornerRadius = 2
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.black.cgColor

    }
    
    
    @IBAction func tapp(_ sender: UIButton) {
        if sender == clearButton {
            textView.text = ""
            textView.becomeFirstResponder()
        } else if sender == voiceButton {
            textView.resignFirstResponder()
            
            SpeechService.shared.startSpeech(textView.text)
        }    }
    
    @IBAction func pitchSliderChange(_ sender: Any) {
        textView.resignFirstResponder()
        pitchValue.text = String(format: "%.1f", pitchSlider.value)
        
        SpeechService.shared.pitch = pitchSlider.value
    }


    @IBAction func rateSliderChange(_ sender: Any) {
        textView.resignFirstResponder()
        rateValue.text = String(format: "%.1f", rateSlider.value)
        
        SpeechService.shared.rate = rateSlider.value
    }
    
}

