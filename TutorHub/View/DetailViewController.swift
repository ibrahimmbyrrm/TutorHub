//
//  DetailViewController.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 10.03.2023.
//

import UIKit

class DetailViewController: UIViewController{
   
    

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var addressText: UITextView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var selected : Announcement?
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setDetails(announcement: selected!)
        print(selected?.phone)
    
    }
    
    //Arama
    @IBAction func callButtonClicked(_ sender: Any) {
        guard let number = selected?.phone else {return}
        guard let url = URL(string: "tel:\(number)") else {
            print("olmadı be")
            return}
        UIApplication.shared.open(url)
        print("oldu")
        
    }
    
    
    @IBAction func messageButtonClicked(_ sender: Any) {
        guard let number = selected?.phone else {return}
        print(number)
        guard let url = URL(string: "https://api.whatsapp.com/send?phone=\(number)&text=Invitation") else {return}
        if UIApplication.shared.canOpenURL(url) {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
    }
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func setDetails(announcement: Announcement) {
        print(announcement.name ?? "not found")
        phoneLabel.text = announcement.phone
        costLabel.text = "\(announcement.cost)$"
        addressText.text = announcement.address
        descriptionText.text = announcement.description
        typeLabel.text = announcement.type
        nameLabel.text = announcement.name
        titleLabel.text = announcement.title
    }
   
    func setViews() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        addressText.layer.masksToBounds = true
        addressText.layer.cornerRadius = 10
        addressText.layer.borderWidth = 1
        addressText.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColor : UIColor = .systemPurple
        addressText.layer.borderColor = borderColor.cgColor
        
        descriptionText.layer.masksToBounds = true
        descriptionText.layer.cornerRadius = 10
        descriptionText.layer.borderWidth = 1
        descriptionText.layer.shadowOffset = CGSize(width: -1, height: 1)
        descriptionText.layer.borderColor = borderColor.cgColor
    }
}
