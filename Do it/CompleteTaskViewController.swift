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
    
    var task : Task? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            takkLabel.text = "❗️\(task!.name!)"
        } else {
            
            takkLabel.text = task!.name!
        }


        
    }

    @IBAction func completeTapped(_ sender: AnyObject) {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)

    }

 
}
