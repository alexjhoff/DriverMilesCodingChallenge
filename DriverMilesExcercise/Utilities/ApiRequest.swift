//
//  ApiRequest.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation

class ApiRequest: NSObject {
    let url: URL
    var request: URLRequest
    
    static let shared = ApiRequest()
    
    private override init() {
        url = URL.buildSlackUrl()
        request = URLRequest.buildSlackRequestWithUrl(url)
    }
    
    func submitPost(post: Post, completion:((Error?) -> Void)?) {
        // Encode out Post struct into JSON data
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(post)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            completion?(error)
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                completion?(responseError!)
                return
            }
        
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                print("response: ", utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        task.resume()
    }
}
