//
//  PeopleTableViewController.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 05/07/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController, ViewControllerDelegate {
    
    var people = [Person(name: "Rodrigo", email: "teste@email.com", age: 24),
                  Person(name: "Aline", email: "teste@email.com", age: 24),
                  Person(name: "Danilo", email: "teste@email.com", age: 24)]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let person = people[indexPath.row]
        cell.textLabel?.text = person.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetail(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func showDetail(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let person = people[indexPath.row]
            print(person.name)
        }
    }
    
    func addNewPerson(_ person: Person){
        people.append(person)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add"{
            if let viewController = segue.destination as? PersonDetailsViewController {
                viewController.delegate = self
            }
        }
    }


}
