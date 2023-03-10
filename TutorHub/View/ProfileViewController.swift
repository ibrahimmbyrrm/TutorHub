//
//  ProfileViewController.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, ProfileViewOutput {
    func saveData(values: [Announcement]) {
        announcementList = values
        self.tableView.reloadData()
    }
    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toLogin", sender: nil)
        }catch {
            print(error.localizedDescription)
        }
        
        
    }
    private lazy var announcementList = [Announcement]()
    lazy var viewModel : ProfileViewModelOutput = ProfileViewModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.setDelegate(output: self)
        viewModel.fetchData()
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        // Do any additional setup after loading the view.
    }
    
    
}
extension ProfileViewController : UITableViewDelegate, UITableViewDataSource, DeleteButton {
   
    func deleteClicked(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Warning", message: "You are about to delete your announcement permanently.Are you okay with this?", preferredStyle: UIAlertController.Style.alert)
        let yesButton = UIAlertAction(title: "YES", style: UIAlertAction.Style.destructive) { action in
            FirebaseDataManager().deletePost(indexPath: indexPath, array: self.announcementList)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veriSilindi"), object: nil)
            self.announcementList.remove(at: indexPath.row)
            self.tableView.reloadData()
          
            
        }
        let noButton = UIAlertAction(title: "NO", style: UIAlertAction.Style.default)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        self.present(alert, animated: true)
        print("delete clicked")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AnnouncementCell
        let selected = announcementList[indexPath.row]
        cell.tutorLabel.text = selected.name
        cell.typeLabel.text = selected.type
        cell.locationLabel.text = selected.location
        cell.titleLabel.text = selected.title
        cell.costLabel.text = "\(selected.cost) $"
        cell.goButtonOutlet.isHidden = true
        cell.deleteProtocol = self
        cell.indexPath = indexPath
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementList.count
    }
    
    
}
