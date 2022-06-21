# To-Do-List-App
A Beginner level to do list iOS App

Our storyboard has 4 view controllers.
One is for navigation, 2nd one for the table view, 3rd one for Inserting the tasks, 4th one to view the task specifically if it is tapped on the 2nd View Controller.

For the tableView ViewController :
It has a task i.e array of strings, a tableview with the data source and delegate and a title.
We create an intial set up block so that we start with a count of 0. We call that function to update our task array for whatever is saved.
We have another function didTapAdd() which is an IBAction to call the Entry View Controller when the add button is clicked at the top right of the screen.
We have the delegate function itself for the tableView for what happens when we select a cell.
Also have the data source function which supplies the number of rows and number of things and tasks aswellas a cell.

For the EntryViewController :
We have a field outlet and a closure "update" with nothing to return(void)
We set the delegate on the field and we create a button for the person to tap done when done enterring.
WE added a delegate function which once a person hits return on the keyboard. They can also add their task when they are in there in that function. 
Savetask function we created makes sure the textfields are not empty. It also makes sure that we have a count which increments when a new task is saved. It calls the update function if it exists and lastly dismisses the VC.

For the TaskViewController :
We have a label outlet.
We have a task variable of Optional String type which we assign our task content to before we push the controller on screen.
In viewdidload we set the label of the task.

Adding a Screen recording of a simple todo list app.

https://user-images.githubusercontent.com/80701312/174840942-45ae7db6-deda-4998-811c-e08a228b0f7f.mp4


