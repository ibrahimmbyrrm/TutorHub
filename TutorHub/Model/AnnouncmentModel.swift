//
//  AnnouncmentModel.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import Foundation

class Announcement {
    var title : String
    var name : String
    var location : String
    var type : String
    var address : String
    var description : String
    var phone : String
    var cost : String
    
    init(title: String, name: String, location: String, type: String, address: String, description: String, phone: String, cost: String) {
        self.title = title
        self.name = name
        self.location = location
        self.type = type
        self.address = address
        self.description = description
        self.phone = phone
        self.cost = cost
    }
}
