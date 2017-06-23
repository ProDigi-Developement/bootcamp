//
//  Util.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-23.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import UIKit

class Util {
    static func displayAlert(onView view: UIViewController, withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        view.present(alertController, animated: true, completion: nil)
    }
}
