//
//  ViewController.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 05/07/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    var tableViewController: PeopleTableViewController?
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var ageTextField: UITextField?
    
    
    @IBAction func add(_ sender: Any) {
        
        if let name = nameTextField?.text, let email = emailTextField?.text, let age = ageTextField?.text {
            if let int_age = Int(age){
                let person = Person(name: name, email: email, age: int_age)
                tableViewController?.addNewPerson(person)
            } else {
                print("Erro ao tentar converter a idade para inteiro")
            }
        } else {
            print("Erro ao tentar incluir nova pessoa")
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

