//
//  ListFriendsViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 09.07.2021.
//

import UIKit

class ListFriendsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var persons: [PersonInListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = PersonStorage()
        persons = storage.persons
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToPhotos" {
            if let dc = segue.destination as? PhotosInProfilesViewController {
                let indexPath = tableView.indexPathForSelectedRow!
                let person = persons[indexPath.row]
                dc.photos = person.photosInProfile
                dc.title = "Photos of \(person.nameSurname)"
            }
        }
    }
    
    @IBAction func addFriend(_ segue: UIStoryboardSegue) {
        guard segue.identifier == "addFriend",
              let sourceController = segue.source as? AllPersonsViewController,
              let indexPath = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        let person = sourceController.persons[indexPath.row]
        // не плодим дубли, проверяем
        if !persons.contains(where: { $0.nameSurname == person.nameSurname}) {
            persons.append(person)
            tableView.reloadData()
        }
    }
}

extension ListFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.reusedIdentifier, for: indexPath) as? PersonTableViewCell
        else {
            return UITableViewCell()
        }
        let person = persons[indexPath.row]
        cell.configure(person: person)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
