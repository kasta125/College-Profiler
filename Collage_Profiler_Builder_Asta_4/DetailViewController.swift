//
//  DetailViewController.swift
//  Collage_Profiler_Builder_Asta_4
//
//  Created by koryasta on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myNameTextField: UITextField!
    @IBOutlet weak var myNumberTextField: UITextField!
    @IBOutlet weak var myPlaceTextField: UITextField!
    
    var collegeDetail: CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myImageView.image = collegeDetail.picture
        myNameTextField.text = collegeDetail.name
        myNumberTextField.text = collegeDetail.population
        myPlaceTextField.text = collegeDetail.location
    }
    
    
}
