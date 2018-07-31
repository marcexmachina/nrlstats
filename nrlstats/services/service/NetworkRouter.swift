//
//  NetworkRouter.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype Endpoint: EndpointType
    func request(_ route: Endpoint, session: URLSession, completion: @escaping NetworkRouterCompletion)
}
