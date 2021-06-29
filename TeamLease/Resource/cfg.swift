//
//  cfg.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import Foundation



protocol tableCellWithIDActionDelegate {
    func action(_ type : String, id : Int)
    
}

protocol passfav {
    func action2(_ type : String, data : model_emp)
}

class cfg{
    

    static var myfav : [model_emp] = []
    static let favKey: String = "favorite"
    static let reqTimeOut : TimeInterval = 25
    /*************** Request code *******************/
    static let no_internet = "Please Check your Internet Connectivity"
    static let err_no_503 = "Service is unavailable"
    static let err_no_404 = "No Response From Server"
    static let err_no_0 = "No Response From Server"
    static let err_default = "Something went wrong, Please check your internet connection."
    static let err_ncdx = "Sorry unable to going on Quotes Screen"
    static let loading = "Loading..."
    static let something_went_wrong = "Something went wrong, Please contact system administrator."
    static let order_success = "Order Submitted Successfully."
    static let order_failed = "Order Failed. Please Contact System Administrator."
    static let err_no_1000 = "Invalide Request Code"
    static let err_no_1001 = "No Data Found"
    static let err_no_1002 = "UndefinedError"
    static let err_invalid_response = "Invalide Response"
    
}
