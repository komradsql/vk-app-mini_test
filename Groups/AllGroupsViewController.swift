//
//  AllGroupsViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 13.07.2021.
//

import UIKit

final class AllGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [FavGroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = GroupsStorage().allGroups
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reusedIdentifier) as? GroupsTableViewCell
        else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
}

