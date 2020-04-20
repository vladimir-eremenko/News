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
        
        let service = DataService()
        
        service.fetchSources {(result) in
            switch result {
                case .failure(let error) :
                    print("\(error)")

                case .success(let result) :
                    print("\(result)")
            }
        }
    }


}

