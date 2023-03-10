//
//  FirebaseManager.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import Foundation
import Firebase
import UIKit

struct FirebaseDataManager : FirebaseService, UsersOwnFirebaseService {
    func getData(completion : @escaping([Announcement]?)->Void) {
        var list = [Announcement]()
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Announcements").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            guard error == nil && snapshot?.isEmpty != true && snapshot != nil else {return}
            list.removeAll(keepingCapacity: false)
            for document in snapshot!.documents {
                guard let announcer = document.get("announcer") as? String else {return}
                guard let title = document.get("title") as? String else {return}
                guard let name = document.get("name") as? String else {return}
                guard let address = document.get("address") as? String else {return}
                guard let cost = document.get("cost") as? String else {return}
                guard let location = document.get("location") as? String else {return}
                guard let description = document.get("description") as? String else {return}
                guard let phone = document.get("phone") as? String else {return}
                guard let type = document.get("type") as? String else {return}
                let announcement = Announcement(title: title, name: name, location: location, type: type, address: address, description: description, phone: phone, cost: cost, announcer: announcer, documentID: document.documentID)
                list.append(announcement)
                
            }
            completion(list)
            
        }
    }
    func saveData(title : String, name : String, location : String, type : String, address : String, description : String, phone : String, cost : String) {
        guard Auth.auth().currentUser != nil else {return}
        let firestoreDatabase = Firestore.firestore()
        let firestoreReference : DocumentReference
        let firestoreData = ["announcer" : Auth.auth().currentUser?.email! , "title" : title, "name" : name, "location" : location, "type" : type, "address" : address, "description" : description, "phone" : phone, "cost" : cost, "date" : FieldValue.serverTimestamp()] as [String : Any]
        firestoreReference = firestoreDatabase.collection("Announcements").addDocument(data: firestoreData, completion: { (error) in
           
           
        })
    }
    func getCurrentUsersData(completion : @escaping([Announcement]?)->Void) {
        var list = [Announcement]()
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Announcements").whereField("announcer", isEqualTo: Auth.auth().currentUser?.email!).order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            guard error == nil && snapshot?.isEmpty != true && snapshot != nil else {return}
            list.removeAll(keepingCapacity: false)
            for document in snapshot!.documents {
                guard let announcer = document.get("announcer") as? String else {return}
                guard let title = document.get("title") as? String else {return}
                guard let name = document.get("name") as? String else {return}
                guard let address = document.get("address") as? String else {return}
                guard let cost = document.get("cost") as? String else {return}
                guard let location = document.get("location") as? String else {return}
                guard let description = document.get("description") as? String else {return}
                guard let phone = document.get("phone") as? String else {return}
                guard let type = document.get("type") as? String else {return}
                let announcement = Announcement(title: title, name: name, location: location, type: type, address: address, description: description, phone: phone, cost: cost, announcer: announcer, documentID: document.documentID)
                list.append(announcement)
                
            }
            completion(list)
            
        }
    }
    func deletePost(indexPath: IndexPath, array : [Announcement]) {
        let db = Firestore.firestore()
        db.collection("Announcements").document(array[indexPath.row].documentID).delete { (error) in
           
        }
    }
    
    
    
}
