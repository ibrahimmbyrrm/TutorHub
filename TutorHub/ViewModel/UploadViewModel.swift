//
//  UploadViewModel.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

struct UploadViewModel {
    var types = ["Face To Face", "Hybrid" , "Online"]
    
    func pickerRowNumber() -> Int {
        return types.count
    }
    func pickerTitles(index : Int) -> String {
        return types[index]
    }

    func clearField(title : UITextField, name : UITextField, location : UITextField, address : UITextView, description : UITextView, phone : UITextField, cost : UITextField) {
        title.text = ""
        name.text = ""
        location.text = ""
        address.text = ""
        description.text = ""
        phone.text = ""
        cost.text = ""
    }
   
}
