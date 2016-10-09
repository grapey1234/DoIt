//
//  CompleteTaskViewController.swift
//  Do it
//
//  Created by Pete Tynan on 09/10/2016.
//  Copyright © 2016 Pete Tynan. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var takkLabel: UILabel!
    
    var task = Task()
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            takkLabel.text = "❗️\(task.name)"
        } else {
            
            takkLabel.text = task.name
        }


        
    }

    @IBAction func completeTapped(_ sender: AnyObject) {
    
    previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
