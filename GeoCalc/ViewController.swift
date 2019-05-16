//
//  ViewController.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/14/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var distanceText: UILabel!
    @IBOutlet weak var bearingText: UILabel!
    
    @IBOutlet weak var p1LatInput: UITextField!
    @IBOutlet weak var p1LongInput: UITextField!
    @IBOutlet weak var p2LatInput: UITextField!
    @IBOutlet weak var p2LongInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
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
                
        //calculte distance between cordinates in meters.
           let distanceInMeters =  p1.distance(from: p2)
        
         //calculte bearing
//        func bearingToPoint(point:CLLocation) -> Double {
//            let p1 = (self.coordinate.latitude, self.coordinate.longitude)
//            let p2 = (point.coordinate.latitude, point.coordinate.longitude)
//            let x = cos(p2.0) * sin(abs(p2.1 - p1.1))
//            let y = cos(p1.0) * sin(p2.0) - sin(p1.0) * cos(p2.0) * cos(abs(p2.1 - p1.1))
//
//            return atan2(x,y) * 180.0 / Double.pi
//        }

        distanceText.text = "Distance: \(distanceInMeters / 1000.0)"
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        // clear text fields and reset outlets
     }
  

}
