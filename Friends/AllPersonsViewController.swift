//
//  AllPersonsViewController.swift
//  VKAPP-Volohin
//
//  Created by Евгений Волохин on 10.07.2021.
//

import UIKit

final class AllPersonsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var lettersControl: LettersControl!
    
    var persons = [PersonInListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        persons = PersonStorage().allPersons.sorted(by: { $0.nameSurname < $1.nameSurname})
        let firstLetters = getFirstLetters(persons)
        lettersControl.setLetters(firstLetters)
        lettersControl.addTarget(self, action: #selector(scrollToLetter), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func scrollToLetter() {
        let letter = lettersControl.selectLetter
        guard let firstIndexForLetter = persons.firstIndex(where: { String($0.nameSurname.prefix(1)) == letter })
        else {
            return
        }
        
        tableView.scrollToRow(at: IndexPath(row: firstIndexForLetter, section: 0),
                              at: .top,
                              animated: true)
    }
    
    private func getFirstLetters(_ persons: [PersonInListModel]) -> [String] {
        let personsName = persons.map { $0.nameSurname }
        let firstLetters = Array(Set(personsName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }
    
}

extension AllPersonsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.reusedIdentifier, for: indexPath) as? PersonTableViewCell
        else {
            return UITableViewCell()
        }
        let person = persons[indexPath.row]
        cell.configure(person: person)
        return cell
    }
}
