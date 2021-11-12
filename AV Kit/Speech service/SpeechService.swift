//
//  SpeechService.swift
//  AV Kit
//
//  Created by Narek Arsenyan on 08.11.21.
//

import Foundation
import AVKit

class SpeechService: NSObject {
    
     static let shared = SpeechService()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var pitch: Float = 1
    var rate : Float = AVSpeechUtteranceMaximumSpeechRate
    
    func startSpeech(_ text: String) {
        self.stopSpeeching()
        if let language = NSLinguisticTagger.dominantLanguage(for: text) {
            let utterence = AVSpeechUtterance(string: text)
            utterence.voice = AVSpeechSynthesisVoice(language: language)
            utterence.pitchMultiplier = pitch
            utterence.rate = rate
            
            speechSynthesizer.speak(utterence)
        }
    }
    
    func stopSpeeching() {
        speechSynthesizer.stopSpeaking(at: .immediate)
    }
}
