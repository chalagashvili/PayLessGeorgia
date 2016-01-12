//
//  SearchViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/11/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewController: UITableViewController, UITextFieldDelegate {
    
    var searchText: String? = "" {
        didSet {
            print (searchText)
        }
    }
    
    @IBAction func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField?.text = searchText
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchText = searchTextField?.text
        return true
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! SearchTableViewCell
        
        cell.product = productList[indexPath.row]
        
        return cell
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Product"
    }
    
    static func addProductToList(product: Product) {
        
    }
}
