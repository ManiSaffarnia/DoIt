//
//  CompleteViewController.swift
//  DoIt
//
//  Created by mani saffarnia on 1/15/18.
//  Copyright © 2018 mani saffarnia. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var selectedTask:Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if selectedTask != nil {
            taskLaber.text = selectedTask?.title
        }
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var taskLaber: UILabel!
    
    @IBAction func completePressed(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(selectedTask!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
}
