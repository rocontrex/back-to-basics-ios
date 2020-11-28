//
//  Alert.swift
//  backToBasics
//
//  Created by Rodrigo Conte on 28/11/20.
//  Copyright © 2020 Rodrigo Conte. All rights reserved.
//

import UIKit

class Alert {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func show(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(button)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
