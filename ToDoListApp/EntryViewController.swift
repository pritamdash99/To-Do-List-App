//
//  EntryViewController.swift
//  ToDoListApp
//
//  Created by Pritam Dash on 21/06/22.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
//Have a field where the user can enter in a task and a done button function which once they click it will save it.
    @IBOutlet var field : UITextField!
    
    var update : (() -> Void)? //Is a closure
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        field.delegate = self
        
        //Adidng a button on the navigation bar programmatically
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTasks))
        //selector ia basically a way to reference a function this class once the catual button is clicked.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Trigers when a user preses the enter key on the keyboard.
        saveTasks()
        return true
    }
    
    //adding @objc allows this function to become a selector
    @objc func saveTasks() {
        
        //MAke sure the field is not empty
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        //save the tasks using UserDefaults
        //saving 2 things essentially
        //1. A count of how many tasks we have so far.
        //2. Each task with a given number.
        
        //Once the app loads up, nothing is saved. Visit ViewController and put the initial save mechanism.
        
        //get count
        //var count = UserDefaults().value(forKey: "count") as? Int  was throwing error hence we unwrapped it properly using guard.
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        //set the new count again
        UserDefaults().set(newCount, forKey: "count")
        
        //save the tasks
        UserDefaults().set(text, forKey: "task_\(newCount)")
        //This way every task gets saved with a unique key which can be later used fetch easily.
        
        //Next we need to update the tableView so we need to pass a reference of a function to the EntryViewController.
        
        update?() //Means = If the update function exists then call it
        
        //Once called, dismiss the root VC
        navigationController?.popViewController(animated: true)
    }

}
