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
    
    func saveData(title : String, name : String, location : String, type : String, address : String, description : String, phone : String, cost : String) {
        var check = false
        guard Auth.auth().currentUser != nil else {return}
        let firestoreDatabase = Firestore.firestore()
        let firestoreReference : DocumentReference
        let firestoreData = ["announcer" : Auth.auth().currentUser?.email! , "title" : title, "name" : name, "location" : location, "type" : type, "address" : address, "description" : description, "phone" : phone, "cost" : cost, "date" : FieldValue.serverTimestamp()] as [String : Any]
        firestoreReference = firestoreDatabase.collection("Announcements").addDocument(data: firestoreData, completion: { (error) in
           
           
        })
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
