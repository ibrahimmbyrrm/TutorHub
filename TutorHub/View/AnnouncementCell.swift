//
//  AnnouncementCell.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import UIKit

class AnnouncementCell: UITableViewCell{
   
    @IBOutlet weak var deleteButtonOutlet: UIButton!
    @IBOutlet weak var goButtonOutlet: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var tutorLabel: UILabel!
    var goProtocol : GoButton?
    var deleteProtocol : DeleteButton?
    var indexPath : IndexPath?
    var Feed = FeedViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        let borderColor: UIColor = .white
        self.layer.borderColor = borderColor.cgColor
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteButtonClicked(_ sender: Any) {
        deleteProtocol?.deleteClicked(indexPath: indexPath!)
        
    }
    @IBAction func goButton(_ sender: Any) {
        goProtocol?.goButtonClicked(indexPath: indexPath!)
    }
    
}
