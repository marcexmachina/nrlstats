//
//  Router.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class Router<Endpoint: EndpointType>: NetworkRouter {
    private var task: URLSessionTask?

    func request(_ route: Endpoint, session: URLSession, completion: @escaping NetworkRouterCompletion) {
        let request = buildRequest(from: route)
        task = session.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }
    }

    // Private Methods

    private func buildRequest(from route: Endpoint) -> URLRequest {
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path))
        request.httpMethod = route.httpMethod.rawValue

        switch route.task {
        case .request:
            request.setValue("application/json", forHTTPHeaderField: "Content-type")
        }
        return request
    }
}
