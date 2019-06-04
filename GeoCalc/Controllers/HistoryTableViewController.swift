//
//  HistoryTableViewController.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/28/19.
//  Copyright © 2019 GVSU. All rights reserved.
//
import UIKit
import Foundation


protocol HistoryTableViewControllerDelegate{
    func selectEntry(entry: LocationLookup)
}

class HistoryTableViewController: UITableViewController{
    var entries :[LocationLookup] = []
    var delegate :HistoryTableViewControllerDelegate?

    //Mark: -Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView( _ _tableView: UITableView,numberOfRowsInSection section:Int)->Int{
        return entries.count
    }
    
    override func tableView(_ _tableView: UITableView,cellForRowAt indexPath:IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for:indexPath)
    
        
        let entry = self.entries[indexPath.row]
        let lblText = "(\(entry.origLat),\(entry.origLng)) (\(entry.destLat),\(entry.destLng))"
        let title = "\(entry.timestamp)"
        cell.detailTextLabel?.text = title
        cell.textLabel?.text = lblText
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let del = self.delegate{
            let trial = entries[indexPath.row]
            del.selectEntry(entry:trial)
        }
        _ = self.navigationController?.popViewController(animated: true)
    }
}

extension UINavigationController{
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}


