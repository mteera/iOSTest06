//
//  ViewController.swift
//  iOSTest02
//
//  Created by Chace Teera on 03/10/2017.
//  Copyright © 2017 Beep!. All rights reserved.
//

import UIKit
import Firebase
import LinkedinSwift

class MainViewController: UIViewController {
    
    //Mark: Variables
    var user: LinkedInData!
    
    //Mark: Outlets
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var linkedInBtn: CustomUIButton!
    
    //Mark: LinkedIn helper
    let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "77tn2ar7gq6lgv", clientSecret: "iqkDGYpWdhf7WKzA", state: "DLKDJF46ikMMZADfdfds", permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: "https://github.com/tonyli508/LinkedinSwift"))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "home" {
            let tab = segue.destination as! TabbarController
            let nav = tab.viewControllers![0] as! UINavigationController
            let destinationViewController = nav.viewControllers[0] as! HomeViewController
            
            destinationViewController.user = user
        }
    }

    @IBAction func loginAction(_ sender: Any) {

        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
            
            //Check if the user user is logged in and perform and action if they are.
            if self.linkedinHelper.lsAccessToken != nil {
                self.linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,email-address,headline)?format=json",
                                          requestType: LinkedinSwiftRequestGet,
                                          success: { (response) -> Void in
                                            //Request success response
                                            let user = LinkedInData(json: response.jsonObject as! JSON)
                                            print(user)
                                            self.user = user
                                            
                }) { [unowned self] (error) -> Void in
                    print(error.localizedDescription)
                    //Encounter error
                }
            } else {
                
            }
            
        }, error: { (error) -> Void in
            print("Uh oh, there was an issue.")
            //Encounter error: error.localizedDescription
        }, cancel: { () -> Void in
            print("Cancelled")
            //User Cancelled!
        })
        linkedInBtn.isHidden = true
    }
}

