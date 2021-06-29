//
//  Webservices.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import Foundation
import SwiftUI

class WebService {
    

    var requestId : String = ""
    
    func getRequest(_ reqUrl : String, completion: @escaping (_ data: Data?, _ error: String)->()){
        let request = NSMutableURLRequest(url: URL(string: reqUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!)

        request.httpMethod = "GET"
        request.timeoutInterval = 15
    
        let taskCaller = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.async {
                    if error != nil{
                        completion(Data(),cfg.no_internet)
                    }
                    else{
                        let resp = response as! HTTPURLResponse
                        let status = resp.statusCode
                        print(status)
                        switch status{
                        case 200...299:
                            completion(data!,"")
                            break
                        default:
                            completion(nil,self.errorMsg(status))
                            break
                        }
                        
                    }
                }
            }
        }
        
        taskCaller.resume()
    }
    func errorMsg(_ status: Int) -> String{
        var msg = cfg.err_default
        switch status {
        case 500:
            msg = cfg.err_no_503
            break
        case 404:
            msg = cfg.err_no_404
            break
        case 1000:
            msg = cfg.err_no_1000
            break
        case 1001:
            msg = cfg.err_no_1001
            break
        case 1002:
            msg = cfg.err_no_1002
            break
        case 0:
            msg = cfg.err_no_0
            break
        default:
            break
        }
        
        return msg
    }
}

