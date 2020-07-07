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
        
        let person = Person(name: name, email: email, age: int_age)
        tableViewController?.addNewPerson(person)
        
        navigationController?.popViewController(animated: true)
    
//        if let name = nameTextField?.text, let email = emailTextField?.text, let age = ageTextField?.text {
//            if let int_age = Int(age){
//                let person = Person(name: name, email: email, age: int_age)
//                tableViewController?.addNewPerson(person)
//            } else {
//                print("Erro ao tentar converter a idade para inteiro")
//            }
//        } else {
//            print("Erro ao tentar incluir nova pessoa")
//        }
//
        
    }
    
}

