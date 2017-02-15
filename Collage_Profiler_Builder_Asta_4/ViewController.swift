//
//  ViewController.swift
//  Collage_Profiler_Builder_Asta_4
//
//  Created by koryasta on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!

    var myCollegeObject: [CollegeClass] = []
    var myCollege = ["Depaul University", "Harper College", "Stanford University"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "Depaul University", Place: "Chicago, IL", Number: "23,539", Picture: #imageLiteral(resourceName: "Depaul")))
        myCollegeObject.append(CollegeClass(Name: "Harper College", Place: "Palatine, IL", Number: "16,336", Picture: #imageLiteral(resourceName: "Harper")))
        myCollegeObject.append(CollegeClass(Name: "Stanford University", Place: "Stanford, CA", Number: "16,060", Picture: #imageLiteral(resourceName: "Stanford")))
    }
    
    // add to list of colleges
    @IBAction func addButtonTapped(_ sender: AnyObject)
    {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .alert)
        alert.addTextField
            {
                (nameTextField) in
                nameTextField.placeholder = "Add College Name Here"
        }
        alert.addTextField
            {
                (placeTextField) in
                placeTextField.placeholder = "Enter Location Here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default)
        {
            (action) in
            let collegeTextField = alert.textFields?[0]
            let placeTextField = alert.textFields?[1]
            
            self.myCollegeObject.append(CollegeClass(Name: (collegeTextField?.text)!, Place: (placeTextField?.text)!))
            
            self.myTableView.reloadData()
        }
        
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //require function - sets number of rows in TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    //require function - sets the cells in TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //sets cell identifier
        let cell  = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].population
        
        return cell
    }
    //allows you to delete rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        //
        if (editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        var selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.collegeDetail = myCollegeObject[selectedRow!]
    }
    
}

