//
//  SavedViewController.swift
//  MenuMyWay_1
//
//  Created by Irais Gopar osorio on 4/15/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentCurr = currencyValue[row]
    }
    

    var currencyValue:[Double] = []
    var currencyType:[String] = ["EUR","GBP","MXN", "USD"]
    var currentCurr = 0.0
    
    @IBOutlet weak var currentCurrencyField: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var resultCurrencyField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url  = URL(string: "http://data.fixer.io/api/latest?access_key=")
        
        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
            if error != nil{
                print("Error")
            } else {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        if let rates = myJson["rates"] as? NSDictionary {
                            for(key, value) in rates {
                                for curr in self.currencyType {
                                    if curr == key as! String {
                                        self.currencyValue.append((value as! Double))
                                    }
                                }
                            }
                            print(self.currencyValue)
                            print(self.currencyType)
                        }
                    }catch {
                        
                    }
                }
            }
            self.currencyPicker.delegate = self
        }
        task.resume()
    }
    
    @IBAction func onConvertBtn(_ sender: Any) {
        if(currentCurrencyField.text != ""){
            resultCurrencyField.text = String(Double(currentCurrencyField.text!)! * currentCurr)
        }
    }
    
}
