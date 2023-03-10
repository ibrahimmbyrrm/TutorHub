//
//  ProfileViewModel.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import Foundation
import Firebase
import UIKit

final class ProfileViewModel : ProfileViewModelOutput {
 
    var firebaseService: UsersOwnFirebaseService
    var announcementList: [Announcement] = []
    var viewOutput: ProfileViewOutput?
    
    init() {
        firebaseService = FirebaseDataManager()
    }
    
    
    func setDelegate(output: ProfileViewOutput) {
        viewOutput = output
    }
    func fetchData() {
        firebaseService.getCurrentUsersData { announcements in
            guard let announcements = announcements else {return}
            self.announcementList = announcements
            self.viewOutput?.saveData(values: announcements)
        }
    }
   
    
    
   
    
    
}
