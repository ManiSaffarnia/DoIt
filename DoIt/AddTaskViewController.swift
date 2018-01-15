//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by mani saffarnia on 1/13/18.
//  Copyright © 2018 mani saffarnia. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    var previousViewController = ViewController()
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addPressed(_ sender: Any) {
        let task:Task = Task()
        task.title = textField.text!
        task.important = importantSwitch.isOn
        
        previousViewController.tasks.append(task)
        previousViewController.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
