//
//  FeedViewController.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import UIKit

class FeedViewController: UIViewController, FeedViewOutput {
    
    func saveList(values: [Announcement]) {
        self.announcementArray = values
        self.tableView.reloadData()
    }
    private lazy var announcementArray = [Announcement]()
    lazy var viewModel : FeedViewModelOutput = FeedViewModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.setDelegate(output: self)
        viewModel.fetchData()
        view.backgroundColor = .black
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
    }

}
extension FeedViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AnnouncementCell
        let selected = announcementArray[indexPath.row]
        cell.tutorLabel.text = selected.name
        cell.typeLabel.text = selected.type
        cell.locationLabel.text = selected.location
        cell.titleLabel.text = selected.title
        cell.costLabel.text = selected.cost
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementArray.count
    }
}
