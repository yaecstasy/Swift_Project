//
//  TableViewController.swift
//  Filterer2
//
//  Created by Tzu-I Lee on 11/28/15.
//  Copyright © 2015 Tzu-I Lee. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    let filters = [
      "Red",
      "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(filters[indexPath.row])
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return filters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath)
        
        cell.textLabel?.text=filters[indexPath.row]
        
        return cell
    }
    
   }
