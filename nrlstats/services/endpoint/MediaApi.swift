//
//  MediaApi.swift
//  nrlstats
//
//  Created by Marc O'Neill on 01/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

enum MediaApi: EndpointType {
    case playerHeadshot(playerId: Int)
    case placeholderHeadshot

    var baseUrl: URL {
        guard let url = URL(string: "http://media.foxsports.com.au/match-centre/includes/images/headshots/") else { fatalError("baseURL could not be configured.") }
        return url
    }

    var path: String {
        switch self {
        case .playerHeadshot(let playerId):
            return "landscape/nrl/\(playerId).jpg"
        case .placeholderHeadshot:
            return "headshot-blank-large.jpg"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        return .request
    }
}
