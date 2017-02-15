//
//  CollegeClass.swift
//  Collage_Profiler_Builder_Asta_4
//
//  Created by koryasta on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var location = ""
    var name = ""
    var population = ""
    var picture = UIImage(named: "Depaul")
    
    init(Name: String, Place: String, Number: String, Picture: UIImage)
    {
        name = Name
        location = Place
        population = Number
        picture = Picture
    }
    
    init(Name: String, Place: String)
    {
        name = Name
        location = Place
    }
}
