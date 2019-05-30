//
//  HistoryTableViewController.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/28/19.
//  Copyright © 2019 GVSU. All rights reserved.
//
import UIKit
import Foundation

class HistoryTableViewController: UITableViewController{
    var entries :[LocationLookup] = []
    
    
    @IBOutlet weak var tableV: UITableView!
    
    //Mark: -Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView( _ _tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        
        if let locations = self.entries {
            return locations.count
        }else {
            return 0
        }
        
    }
    
    override func tableView(_ _tableView: UITableView,cellForRowAt indexPath:IndexPath)-> UITableViewCell{
        let cell = tableV.dequeueReusableCell(withIdentifier: "cellId" ,for:IndexPath)
        
        if let
        
        return cell
    }
}
