//
//  Model_Employee.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import Foundation

struct model_emp : Codable {
    let address : Address?
    let company : Company?
    var email : String = ""
    var id : Int = 0
    var name : String = ""
    var phone : String = ""
    var username : String = ""
    var website : String = ""
    var fav : Bool = false
    
    var index: Int!
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case company = "company"
        case email = "email"
        case id = "id"
        case name = "name"
        case phone = "phone"
        case username = "username"
        case website = "website"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//         address = try! Address(from: decoder)
//         company = try! Company(from: decoder)
      address = try values.decodeIfPresent(Address.self, forKey: .address)
      company = try values.decodeIfPresent(Company.self, forKey: .company)
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
        username = try values.decodeIfPresent(String.self, forKey: .username) ?? ""
        website = try values.decodeIfPresent(String.self, forKey: .website) ?? ""
    }
}
struct Company : Codable {
    var bs : String = ""
    var catchPhrase : String = ""
    var name : String = ""
    enum CodingKeys: String, CodingKey {
        case bs = "bs"
        case catchPhrase = "catchPhrase"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bs = try values.decodeIfPresent(String.self, forKey: .bs) ?? ""
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase) ?? ""
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}
struct Address : Codable {
    var city : String = ""
//   varet geo : Geo?
    var street : String = ""
    var suite : String = ""
    var zipcode : String = ""
    enum CodingKeys: String, CodingKey {
        case city = "city"
//        case geo = "geo"
        case street = "street"
        case suite = "suite"
        case zipcode = "zipcode"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(String.self, forKey: .city) ?? ""
//        geo = Geo(from: decoder)
        street = try values.decodeIfPresent(String.self, forKey: .street) ?? ""
        suite = try values.decodeIfPresent(String.self, forKey: .suite) ?? ""
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode) ?? ""
    }
}
struct Geo : Decodable {
    let lat : String?
    let lng : String?
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
    }
}
