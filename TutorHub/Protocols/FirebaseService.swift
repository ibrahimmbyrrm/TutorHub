//
//  FirebaseService.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import Foundation

protocol FirebaseService {
    func getData(completion : @escaping([Announcement]?)->Void)
}
