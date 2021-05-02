//
//  Alerts.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.
//

import UIKit

class Alerts {
    
    class func simple(title:String, body: String, button: String, vc: UITableViewController) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: button, style: .default, handler: { (buttonPressed) in
            alert.dismiss(animated: true, completion: nil)
        }))
        vc.present(alert, animated: true, completion: nil)
    }
    
}
