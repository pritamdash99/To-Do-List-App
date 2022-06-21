//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Pritam Dash on 21/06/22.
//

import UIKit
//We will be creating 2 other VCs 1 to enter a task and another to show the information about a task.

class ViewController: UIViewController {
    @IBOutlet var taskTableView: UITableView!
    
    //creating an array to hold all the tasks that the user has input thus far.
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Giving a title to the VC
        title = "Tasks"
        
        //connecting the delegate and data source of tableview
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        //Setup : Initial save mechanism
        if !UserDefaults().bool(forKey:"setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        //Get all current saved tasks
       
    }
    
    @IBAction func didTapAdd() {
        //We need another VC to make an entry.
        
        //instantiate the VC
        let entryVC = storyboard?.instantiateViewController(withIdentifier: "EntryViewController") as! EntryViewController
        
        entryVC.title = "New Task"
        
        //Because we embedded the main vc inside a navigation vc we do :
        navigationController?.pushViewController(entryVC, animated: true)
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskTableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //We need to Dequeue the cell : means using the template over and over again.
        //To get an instance of a cell we are going to configure the cell which means passing the data to the cell.
        
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
}
