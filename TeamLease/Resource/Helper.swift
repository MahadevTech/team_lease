//
//  Helper.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import Foundation


//MARK: Save data into userdefault in form of model (struct)
func saveStruct<T: Encodable>(_ structure: [T], Key: String) {
    let data = structure.map { try? JSONEncoder().encode($0) }
    //        print(data)
    UserDefaults.standard.set(data, forKey: Key)
}

//MARK: Get data from userdefault in form of model (struct)
func getStruct<T: Decodable>(_ Key: String) -> [T] {
    guard let encodedData = UserDefaults.standard.array(forKey: Key) as? [Data] else {
        return []
    }
    return encodedData.map { try! JSONDecoder().decode(T.self, from: $0) }
}

