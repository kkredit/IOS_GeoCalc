//
//  ViewController.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/14/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, SettingsViewControllerDelegate {

    var distUnits: String = "Kilometers"
    var bearUnits: String = "Degrees"
    
    @IBOutlet weak var distanceText: UILabel!
    @IBOutlet weak var bearingText: UILabel!
    
    @IBOutlet weak var p1LatInput: UITextField!
    @IBOutlet weak var p1LongInput: UITextField!
    @IBOutlet weak var p2LatInput: UITextField!
    @IBOutlet weak var p2LongInput: UITextField!
    
    @IBAction func settingsButton(_ sender: Any) {
    }
    
    func reportSettings(dist: String, bear: String) {
        distUnits = dist
        bearUnits = bear
        calculateButtonTapped(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func resetTextFields() {
        distanceText.text = "Distance: "
        bearingText.text = "Bearing: "
        
        p1LatInput.text = ""
        p1LongInput.text = ""
        p2LatInput.text = ""
        p2LongInput.text = ""
    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
        dismissKeyboard()
        
        // if have coords in text fields, calculate
        guard   let p1Lat = Double(p1LatInput.text!),
                let p2Lat = Double(p2LatInput.text!),
                let p1Long = Double(p1LongInput.text!),
                let p2Long = Double(p2LongInput.text!) else {
                return
        }
        
        //set two cordinates points to constants
        let p1 = CLLocation(latitude:p1Lat,longitude: p1Long)
        let p2 = CLLocation(latitude:p2Lat,longitude: p2Long)
                
        //calculte distance between cordinates
        let distanceInMeters =  p1.distance(from: p2)
        
        if (distUnits == "Kilometers") {
            let distInUnits = distanceInMeters / 1000.0
            let distStr = String(format: "%.2f", distInUnits)
            distanceText.text = "Distance: \(distStr) km"
        }
        else {
            let distInUnits = distanceInMeters / 1000.0 * 0.621371
            let distStr = String(format: "%.2f", distInUnits)
            distanceText.text = "Distance: \(distStr) miles"
        }
        
        //calculte bearing
        let bearing = p1.bearingToPoint(point: p2)
        
        if (bearUnits == "Degrees") {
            let bearStr = String(format: "%.2f", bearing)
            bearingText.text = "Bearing: \(bearStr) degrees"
        }
        else {
            let bearInMils = bearing * 17.777777777778
            let bearStr = String(format: "%.2f", bearInMils)
            bearingText.text = "Bearing: \(bearStr) mils"
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        dismissKeyboard()
        // clear text fields and reset outlets
        resetTextFields()
     }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToSettings" {
            if let destNav = segue.destination as? UINavigationController {
                if let dest = destNav.children[0] as? SettingsViewController {
                    dest.delegate = self
                }
            }
        }
    }
}
