//
//  TasksViewController.swift
//  Do it
//
//  Created by Pete Tynan on 07/10/2016.
//  Copyright © 2016 Pete Tynan. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {

            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }

    
    
    @IBAction func plusTapped(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        do {
        tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("Ooops")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
      
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as? Task
            
            
        }
    }
}

