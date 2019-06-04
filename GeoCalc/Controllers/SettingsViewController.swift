//
//  SettingsViewController.swift
//  GeoCalc
//
//  Created by Brian N. Mbeere on 5/16/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsChanged(distanceUnits: String, bearingUnits: String)
}

class SettingsViewController: UIViewController {

    var distSelection: String = "Kilometers"
    var bearSelection: String = "Degrees"
    var pickerOptions: [String] = [String]()
    var pickerSelection: UILabel!
    var delegate: SettingsViewControllerDelegate?
    
    @IBOutlet weak var distText: UILabel!
    @IBOutlet weak var bearText: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let distPressed = UITapGestureRecognizer(target: self, action: #selector(self.displayDistancePicker))
        let bearPressed = UITapGestureRecognizer(target: self, action: #selector(self.displayBearingPicker))
        distText.addGestureRecognizer(distPressed)
        bearText.addGestureRecognizer(bearPressed)
        picker.delegate = self
        picker.dataSource = self

        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissPicker))
        self.view.addGestureRecognizer(detectTouch)
        
        updateUnitsText()
        dismissPicker()
    }
    
    @objc func dismissPicker() {
        picker.isHidden = true
    }
    
    @objc func displayDistancePicker(){
        print("distance picker")
        self.pickerOptions = ["Kilometers", "Miles"]
        self.pickerSelection = self.distText
        self.picker.isHidden = false
        self.picker.reloadAllComponents()
    }
    
    @objc func displayBearingPicker(){
        print("bearing picker")
        self.pickerOptions = ["Degrees", "Mils"]
        self.pickerSelection = self.bearText
        self.picker.isHidden = false
        self.picker.reloadAllComponents()
    }
    
    func updateUnitsText() {
        distText.text = distSelection
        bearText.text = bearSelection
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
//        self.dismiss(animated: true, completion: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let del = self.delegate {
            del.settingsChanged(distanceUnits: self.distText.text!, bearingUnits: bearText.text!)
        }
//        self.dismiss(animated: true, completion: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerOptions[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerSelection.text = self.pickerOptions[row]
    }
}
