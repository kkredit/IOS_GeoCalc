//
//  ViewController.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/14/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, SettingsViewControllerDelegate,HistoryTableViewControllerDelegate{
    func selectEntry(entry: LocationLookup) {
        p1LatInput.text = "\(entry.origLat)"
        p1LongInput.text = "\(entry.origLng)"
        p2LatInput.text = "\(entry.destLat)"
        p2LongInput.text = "\(entry.destLng)"
        
        recalculate()
    }
    

    var distUnits: String = "Kilometers"
    var bearUnits: String = "Degrees"
    var entries : [LocationLookup] = [
        LocationLookup(origLat: 90.0, origLng: 0.0, destLat: -90.0, destLng: 0.0, timestamp: Date.distantPast),
        LocationLookup(origLat: -90.0, origLng: 0.0, destLat: 90.0, destLng: 0.0, timestamp: Date.distantFuture)]
    
    
    
    
    @IBOutlet weak var distanceText: UILabel!
    @IBOutlet weak var bearingText: UILabel!
    
    @IBOutlet weak var p1LatInput: UITextField!
    @IBOutlet weak var p1LongInput: UITextField!
    @IBOutlet weak var p2LatInput: UITextField!
    @IBOutlet weak var p2LongInput: UITextField!
    
//    @IBAction func settingsButton(_ sender: Any) {
//    }
    
    func settingsChanged(distanceUnits: String, bearingUnits: String) {
        distUnits = distanceUnits
        bearUnits = bearingUnits
        calculateButtonTapped(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        self.view.backgroundColor = BACKGROUND_COLOR
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
        
        
        //stores a new instance to the array
        entries.append(LocationLookup(origLat: p1Lat, origLng: p1Long, destLat: p2Lat,
                                      destLng: p2Long, timestamp: Date()))
        
        recalculate()
    }
        
        
        func recalculate() {
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
            if let dest = segue.destination as? SettingsViewController {
                dest.delegate = self
                dest.distSelection = distUnits
                dest.bearSelection = bearUnits
            }
        }
        else if segue.identifier == "historySegue" {
            if let dest = segue.destination as? HistoryTableViewController {
                dest.delegate = self
                dest.entries = self.entries                
            }
        }
    }
}
