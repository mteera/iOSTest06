//
//  HomeViewController.swift
//  iOSTest02
//
//  Created by Chace Teera on 16/10/2017.
//  Copyright © 2017 Beep!. All rights reserved.
//

import UIKit
import LinkedinSwift

class HomeViewController: UIViewController {
    
    var user: LinkedInData!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(user.id!)
        
        self.navigationItem.title = "Welcome \(user.firstName!)"

        // Do any additional setup after loading the view.
    }

}
