//
//  FeedViewModelService.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import Foundation

protocol FeedViewModelOutput {
    func fetchData()
    
    var firebaseService : FirebaseService {get}
    var announcementList : [Announcement] {get set}
    var viewOutput : FeedViewOutput? {get}
    
    func setDelegate(output : FeedViewOutput)
}
