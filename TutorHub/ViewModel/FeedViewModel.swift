//
//  FeedViewModel.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import Foundation
import UIKit
import Firebase

final class FeedViewModel : FeedViewModelOutput {
    var firebaseService: FirebaseService
    var announcementList: [Announcement] = []
    var viewOutput: FeedViewOutput?
    
    func setDelegate(output: FeedViewOutput) {
        viewOutput = output
    }
    init() {
        firebaseService = FirebaseDataManager()
    }
    
    func fetchData() {
        firebaseService.getData { announcementList in
            guard let announcementList = announcementList else {return}
            self.announcementList = announcementList
            self.viewOutput?.saveList(values: announcementList)
        }
    }
  
}
