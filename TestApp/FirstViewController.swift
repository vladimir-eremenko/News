//
//  FirstViewController.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.auth { (result) in
            print("")
        }
        // Do any additional setup after loading the view.
    }


}

