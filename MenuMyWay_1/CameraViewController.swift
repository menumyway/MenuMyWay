//
//  CameraViewController.swift
//  MenuMyWay_1
//
//  Created by Celina Juarez on 5/7/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentLanguage = languages[row]
        return languages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        targetCode = languageCodes[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languagePicker.delegate = self
    }
    

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var detectedLabel: UILabel!
    @IBOutlet weak var translatedLabel: UILabel!
    
    var currentLanguage  = ""
    let languages = ["Select a language", "French", "English", "Spanish", "German"]
    let languageCodes = ["es","fr","en","es","de"]
    var targetCode = "es"
    
    lazy var vision = Vision.vision()
    var textDetector: VisionTextDetector?
    
    let synthesizer = AVSpeechSynthesizer()

    

    @IBAction func cameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        imageView.image = image
        detectText(image: image)
        dismiss(animated: true, completion: nil)
    }
    
    func detectText (image: UIImage) {
        
        textDetector = vision.textDetector()
        let visionImage = VisionImage(image: image)
        textDetector?.detect(in: visionImage) { (features, error) in
            guard error == nil, let features = features, !features.isEmpty else {
                return
            }
            
            debugPrint("Feature blocks in the image: \(features.count)")
            
            var detectedText = ""
            for feature in features {
                let value = feature.text
                detectedText.append("\(value) ")
            }
            
            self.detectedLabel.text = detectedText
            self.translateText(detectedText: detectedText)
        }
    }
    
    func translateText(detectedText: String) {
        
        guard !detectedText.isEmpty else {
            return
        }
        
        let task = try? GoogleTranslate.sharedInstance.translateTextTask(text: detectedText, targetLanguage: self.targetCode, completionHandler: { (translatedText: String?, error: Error?) in
            debugPrint(error?.localizedDescription)
            
            DispatchQueue.main.async {
                self.translatedLabel.text = translatedText
                print("translated")
                print(self.translatedLabel)
                print("translated")
                print(self.translatedLabel.text)
                print("translated")
            }
            
        })
        
        task?.resume()
    }
    
    
    @IBAction func speakDetected(_ sender: Any) {
        print(detectedLabel.text)
        let utterance = AVSpeechUtterance(string: detectedLabel.text ?? "Empty")
        utterance.rate = 0.2
        synthesizer.speak(utterance)
    }
    
    @IBAction func speakTrans(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: translatedLabel.text ?? "Empty")
        utterance.rate = 0.2
        
        if (currentLanguage == "French") {
            utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
            synthesizer.speak(utterance)
        }else if (currentLanguage == "Spanish") {
            utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
            synthesizer.speak(utterance)
        }else if (currentLanguage == "German") {
            utterance.voice = AVSpeechSynthesisVoice(language: "de-DE")
            synthesizer.speak(utterance)
        }else if (currentLanguage == "English") {
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            synthesizer.speak(utterance)
        }
    }
}
