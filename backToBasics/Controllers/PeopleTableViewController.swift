//
//  PeopleTableViewController.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 05/07/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
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
        
        return cell
    }
    
    func addNewPerson(_ person: Person){
        people.append(person)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "add"{
            if let viewController = segue.destination as? PersonDetailsViewController {
                viewController.tableViewController = self
            }
        }
    }


}
