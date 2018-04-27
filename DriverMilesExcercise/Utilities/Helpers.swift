//
//  Helpers.swift
//  DriverMilesExercise
//
//  Created by Alex Hoff on 4/17/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation

extension URL {
    public static func buildSlackUrl() -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "hooks.slack.com"
        urlComponents.path = "/services/T042FMKHH/B1LF1T12L/HoTvYOUSovFpfl9LI59GBKnq"
        guard let url = urlComponents.url else { fatalError("Could not create URL") }
        return url
    }
}

extension URLRequest {
    public static func buildSlackRequestWithUrl(_ url: URL) -> URLRequest {
        // Specify this request as being a POST method
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // Headers specify that HTTP body will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        return request
    }
}
