//
//  alert_dialog.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import UIKit


//MARK: Alert Pop up
func alertDialog(_ msg : String,viewController: UIViewController){
    let alrt = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
    
    let cancel = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel) { (action) in
        
    }
    alrt.addAction(cancel)
    viewController.present(alrt, animated: true, completion: nil)
}


