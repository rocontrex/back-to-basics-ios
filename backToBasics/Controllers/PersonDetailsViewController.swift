//
//  ViewController.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 05/07/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate {
    func addNewPerson(_ person: Person)
}

class PersonDetailsViewController: UIViewController {
    // MARK: - Atributos
    var delegate: ViewControllerDelegate?
    let courses: [Course] = [
        Course(name: "Python 3", details: "A long course of python language", price: "R$5000.00"),
        Course(name: "Android 20", details: "One more and will rest only 298", price: "R$2.00"),
        Course(name: "iOS to dumbs", details: "Only to dumbs", price: "R$10.00")
    ]
    var selectedCourses: [Course] = []
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var ageTextField: UITextField?
    // MARK: - Actions
    @IBAction func add(_ sender: Any) {
        
        guard let name = nameTextField?.text else {
            return
        }
        
        guard let email = emailTextField?.text else {
            return
        }
        
        guard let age = ageTextField?.text else {
            return
        }
        
        guard let int_age = Int(age) else {
            return
        }
        
        let person = Person(name: name, email: email, age: int_age, courses: selectedCourses)
    
        if let delegate = delegate {
            delegate.addNewPerson(person)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
}
// MARK: - Table View DataSource
extension PersonDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.courses[indexPath.row].name
        return cell
    }
    
}

// MARK: - Table View Delegate
extension PersonDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let clickedItemRow = indexPath.row
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            selectedCourses.append(courses[clickedItemRow])
        } else {
            cell.accessoryType = .none
            let selectedCourse = courses[indexPath.row]
            if let position = courses.firstIndex(of: selectedCourse) {
                selectedCourses.remove(at: position)
            }
        }
    }
}

