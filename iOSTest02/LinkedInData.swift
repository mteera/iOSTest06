//
//  LinkedInData.swift
//  iOSTest02
//
//  Created by Chace Teera on 13/10/2017.
//  Copyright © 2017 Beep!. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

class LinkedInData {
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var headline: String?

    
    init?(json: JSON) {
        
        guard let id = json["id"] as? String, let firstName = json["firstName"] as? String, let lastName = json["lastName"] as? String, let headline = json["headline"] as? String else { return nil }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.headline = headline
    }
}
