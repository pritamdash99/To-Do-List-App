//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Pritam Dash on 21/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var taskTableView: UITableView!
    
    //creating an array to hold all the tasks that the user has input thus far.
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Get all current saved tasks
        
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
        
        
        return cell
    }
    
    
}
