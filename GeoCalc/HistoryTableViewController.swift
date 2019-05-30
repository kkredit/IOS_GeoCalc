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
        return entries.count
    }
    
    override func tableView(_ _tableView: UITableView,cellForRowAt indexPath:IndexPath)-> UITableViewCell{
        let cell = self.tableV.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
}
extension UINavigationController{
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
