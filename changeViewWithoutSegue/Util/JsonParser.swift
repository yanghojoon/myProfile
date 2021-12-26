//
//  JsonParser.swift
//  changeViewWithoutSegue
//
//  Created by 양호준 on 2021/12/26.
//

import Foundation
import UIKit

struct JsonParser: Decodable {
    func decode() throws -> [Experience] {
        guard let jsonAsset = NSDataAsset(name: "experienceData") else {
            throw ParsingError.fileNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        
        guard let decodedData = try? jsonDecoder.decode([Experience].self, from: jsonAsset.data) else {
            throw ParsingError.failDecoding
        }
        
        return decodedData
    }
}
