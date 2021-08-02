//
//  FavouriteGroupsViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 12.07.2021.
//

import UIKit

class FavouriteGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var groups: [FavGroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = GroupsStorage()
        groups = storage.group
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToParticipants",
           let destinationController = segue.destination as? ParticipantsViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let group = groups[indexPath.row]
            destinationController.participants = group.participant
            destinationController.title = group.title
        }
    }
    
    @IBAction func addGroup(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "addGroup",
              let sc = segue.source as? AllGroupsViewController,
              let indexPath = sc.tableView.indexPathForSelectedRow
        else {
            return
        }
        let group = sc.groups[indexPath.row]
        
        if !groups.contains(where: {$0.title == group.title}) {
            groups.append(group)
            tableView.reloadData()
        }
    }
}

extension FavouriteGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reusedIdentifier, for: indexPath) as? GroupsTableViewCell
        else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
