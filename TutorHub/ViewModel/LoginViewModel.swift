//
//  LoginViewModel.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import Foundation
import UIKit
import Firebase

struct LoginViewModel {
    
    var email : String
    var password : String
    
    func createUser(completion : @escaping(Bool)->Void) {
            Auth.auth().createUser(withEmail: self.email, password: self.password) { (authdata, error) in
                if error != nil {
                    completion(false)
                }else {
                    completion(true)
                }
                
            }
        
    }
    
    func signIn(completion : @escaping(Bool)->Void){
        Auth.auth().signIn(withEmail: self.email, password: self.password) { (authdata, error) in
            if error != nil {
                completion(false)
            }else {
                completion(true)
            }
        }
    }
    
    
}

