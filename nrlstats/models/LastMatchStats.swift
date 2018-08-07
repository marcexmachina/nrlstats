//
//  LastMatchStats.swift
//  nrlstats
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct Stat: Decodable {
    var type: String
    var value: String
}
struct LastMatchStats: Decodable {

    private var matchStatsDict: [String: Any]

    var matchStats: [Stat] {
        return matchStatsDict.reduce([Stat]()) {
            var results = $0
            let stat = Stat(type: $1.key, value: "\($1.value)")
            results.append(stat)
            return results
        }
    }

    fileprivate struct CodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.matchStatsDict = container.decodeKeyValues()
    }
}

extension KeyedDecodingContainer where Key == LastMatchStats.CodingKeys {
    func decodeKeyValues() -> [String: Any] {
        var data = [String: Any]()

        for key in allKeys {
            if let value = try? decode(String.self, forKey: key) {
                data[key.stringValue] = value
            } else if let value = try? decode(Int.self, forKey: key) {
                data[key.stringValue] = value
            } else if let value = try? decode(Double.self, forKey: key) {
                data[key.stringValue] = value
            } else {
                NSLog("Key %@ type not supported", key.stringValue)
            }
        }
        return data
    }
}
