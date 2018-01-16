//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by mani saffarnia on 1/13/18.
//  Copyright © 2018 mani saffarnia. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addPressed(_ sender: Any) {
        let coreDataContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task:Task = Task(context: coreDataContext)
        task.title = textField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //pop back
        navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
