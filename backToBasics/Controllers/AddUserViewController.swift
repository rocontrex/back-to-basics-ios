//
//  AddUserViewController.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 26/11/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

protocol AddNewCourseDelegate {
    func addCouse(_ course: Course)
}

class AddUserViewController: UIViewController {
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Atributos
    var delegate: AddNewCourseDelegate?
    
    init(delegate: AddNewCourseDelegate) {
        super.init(nibName: "AddUserViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: = IBOutlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var detailField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    // MARK: - IBActions
    @IBAction func addCourse(_ sender: Any) {
        guard let name = nameField.text else { return }
        guard let detail = detailField.text else { return }
        guard let price = priceField.text else { return }
        
        let course = Course(name: name, details: detail, price: price)
        if let delegate = self.delegate {
            delegate.addCouse(course)
        }
        navigationController?.popViewController(animated: true)
    }
}
