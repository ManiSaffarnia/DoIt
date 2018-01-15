//
//  ViewController.swift
//  DoIt
//
//  Created by mani saffarnia on 1/13/18.
//  Copyright © 2018 mani saffarnia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedIndex = 0
    var tasks:[Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddPageSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPageSegue"{
            let nextViewController = segue.destination as! AddTaskViewController
            nextViewController.previousViewController = self
        }
        if segue.identifier == "CompletePageSegue"{
            let nextViewController = segue.destination as! CompleteViewController
            nextViewController.previousVC = self
            nextViewController.selectedTask = sender as! Task
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectTask = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "CompletePageSegue", sender: selectTask)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = createTasks()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if  task.important {
            cell.textLabel?.text = "❗️\(task.title)"
        }
        else{
            cell.textLabel?.text = "\(task.title)"
        }
        return cell
    }
    
    func createTasks() -> [Task]{
        let task1 = Task()
        task1.title = "Go to the dentist"
        task1.important = true
        
        let task2 = Task()
        task2.title = "Play football"
        task2.important = false
        
        let task3 = Task()
        task3.title = "Do your homework"
        task3.important = false
        
        return [task1,task2,task3]
        
    }
    
    
}

