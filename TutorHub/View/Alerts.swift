//
//  Alerts.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import Foundation
import UIKit

struct Alerts {
    func alertBox(title : String, message : String) -> UIViewController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        return alert
    }
}
