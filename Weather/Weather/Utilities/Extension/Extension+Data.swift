//
//  Extension+Data.swift
//  Go2ShareLive
//
//  Created by Pratik Hirve on 03/04/20.
//  Copyright © 2020 Pratik Hirve. All rights reserved.
//

import Foundation
import Alamofire

extension Data {

    /// Decodes date the data to the class object provided
    /// - Parameter ofType: class to be decoded
    /// - Returns: returns class to which data is decoded
    func decodeData<T>(ofType: T.Type) -> T?  where T : Decodable {
        do {
            let decoder = JSONDecoder()
            decoder.dataDecodingStrategy = .base64
            return (try decoder.decode(ofType, from: self))
            
        } catch (let error as NSError) {
            NSLog("🔴 \(ofType.self) \(error.localizedDescription)")
        }
        return nil
    }
}
