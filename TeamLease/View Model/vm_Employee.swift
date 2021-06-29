//
//  vm_Employee.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import Foundation
import UIKit


class vm_Employee{
    
    var api = Api_Employee()
    var empData : [model_emp] = []
    var lbl : UILabel!

    
    func callEmployee(completion: @escaping(_ data: [model_emp], _ error: String ) -> ()){
        api.getEmployee()  { [self] (data, error) in
            if error == ""{
                if data.isEmpty{
                    self.lbl.text = error
                    completion([],cfg.err_no_1001)
                }
                else{
                    self.empData = data
                    self.lbl.text = ""
                    updateAddToFav()
                    completion(data,"")
                }
            }
            else{
                self.lbl.text = error
                completion([],error)
            }
            
        }
    }
    func updateAddToFav(){
        for i in 0..<cfg.myfav.count{
            for j in 0..<empData.count{
                if cfg.myfav[i].id == empData[j].id{
                empData[j].fav = true
            }
        
        }
    }
    }
}
