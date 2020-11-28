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

class PersonDetailsViewController: UIViewController, AddNewCourseDelegate {
    //MARK: - Delegates
    func addCouse(_ course: Course) {
        courses.append(course)
        coursesTableView.reloadData()
    }
    // MARK: - Atributos
    var delegate: ViewControllerDelegate?
    var courses: [Course] = [
        Course(name: "Python 3", details: "A long course of python language", price: "R$5000.00"),
        Course(name: "Android 20", details: "One more and will rest only 298", price: "R$2.00"),
        Course(name: "iOS to dumbs", details: "Only to dumbs", price: "R$10.00")
    ]
    var selectedCourses: [Course] = []
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var ageTextField: UITextField?
    @IBOutlet weak var coursesTableView: UITableView!
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
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        let buttonAddPerson = UIBarButtonItem(title: "New Course", style: .plain, target: self, action: #selector(addNewUser))
        navigationItem.rightBarButtonItem = buttonAddPerson
        
        setup()
    }
    
    @objc func addNewUser() {
        let addUserViewController = AddUserViewController(delegate: self)
        navigationController?.pushViewController(addUserViewController, animated: true)
    }
    
    func setup() {
        nameTextField?.delegate = self
        emailTextField?.delegate = self
        ageTextField?.delegate = self
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
            let course = courses[indexPath.row]
            if let position = selectedCourses.firstIndex(of: course) {
                selectedCourses.remove(at: position)
            }
        }
    }
}

// MARK: - TextField Delegate

extension PersonDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}
