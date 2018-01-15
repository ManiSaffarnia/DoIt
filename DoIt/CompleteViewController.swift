//
//  CompleteViewController.swift
//  DoIt
//
//  Created by mani saffarnia on 1/15/18.
//  Copyright © 2018 mani saffarnia. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var previousVC = ViewController()
    var selectedTask = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskLaber.text = selectedTask.title
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var taskLaber: UILabel!
    
    @IBAction func completePressed(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}
