//
//  ViewController.swift
//  DoIt
//
//  Created by mani saffarnia on 1/13/18.
//  Copyright © 2018 mani saffarnia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks:[Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddPageSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CompletePageSegue"{
            let nextViewController = segue.destination as! CompleteViewController
            nextViewController.selectedTask = sender as? Task
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectTask = tasks[indexPath.row]
        performSegue(withIdentifier: "CompletePageSegue", sender: selectTask)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        getTask()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if  task.important {
            if let taskTitle = task.title{
                cell.textLabel?.text = "❗️\(taskTitle)"
            }
        }
        else{
            if let taskTitle = task.title{
                cell.textLabel?.text = "\(taskTitle)"
            }
            
        }
        return cell
    }
    
    
    func getTask(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest())
        } catch {
            print("there is an error")
        }
    }
    
    
}

