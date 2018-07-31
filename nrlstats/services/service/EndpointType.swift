//
//  EndpointType.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
