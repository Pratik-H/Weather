//
//  GlobalMethods.swift
//  Weather
//
//  Created by Neosoft on 20/09/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation

/*This method converts Codable Model to JSON
 - Parameter sender: Model of Codable type
 - Returns: JSON Object.
 - Remark: Returns nil if Encoding fails or Object not found
 - Precondition: compulsory parameters must be non empty.
 */
 func convertModelToJSON<T: Codable>(model: T) -> [String: Any]? {
    do {
        let data = try JSONEncoder().encode(model)
        let object = try JSONSerialization.jsonObject(with: data)
        return object as? [String: Any]
    } catch {
        return nil
    }
}
