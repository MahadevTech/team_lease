//
//  Api_Employee.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import Foundation



let jsonD = JSONDecoder()
class Api_Employee{
    private let webReq = WebService()
    let url = "https://jsonplaceholder.typicode.com/users"
    
    func getEmployee(completion: @escaping (_ data: [model_emp],_ error: String) -> ()){
        webReq.getRequest(url)  {[self] (data, error) in
            guard let resp = data else{ completion([],error); return }
            do{
                let response = try jsonD.decode([model_emp].self, from: resp)
                completion(response,"")
            }
            catch{
                completion([],cfg.err_invalid_response)
            }
            
            
        }
    }
    
}
