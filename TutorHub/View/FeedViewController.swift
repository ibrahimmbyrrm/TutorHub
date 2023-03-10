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
    var selected : Announcement?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.setDelegate(output: self)
        viewModel.fetchData()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        tableView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(veriYenile), name: NSNotification.Name(rawValue: "veriSilindi"), object: nil)
        print("feede geçildi")
    }
    @objc func veriYenile() {
        self.announcementArray.removeAll(keepingCapacity: false)
        viewModel.fetchData()
        self.tableView.reloadData()
    }

}
extension FeedViewController : UITableViewDelegate, UITableViewDataSource, GoButton {
    func goButtonClicked(indexPath: IndexPath) {
        self.selected = announcementArray[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AnnouncementCell
        let selected = announcementArray[indexPath.row]
        cell.tutorLabel.text = selected.name
        cell.typeLabel.text = selected.type
        cell.locationLabel.text = selected.location
        cell.titleLabel.text = selected.title
        cell.costLabel.text = "\(selected.cost) $"
        cell.goProtocol = self
        cell.indexPath = indexPath
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcementArray.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destVC = segue.destination as! DetailViewController
            destVC.selected = self.selected
            
        }
    }
}
