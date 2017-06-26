//
//  UserApi.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation
import SystemConfiguration

internal class ApiFetch {
    private let url: URL
    internal var delegate: FetchDelegate? = nil
    
    internal init() {
        self.url = URL(string: "https://randomuser.me/api/?results=20")!
    }

    internal func fetchUsers() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let errorUnwrapped = error {
//                onFail(FetchConnectionErrors.Unknown(error))
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
//                    onFail(FetchConnectionErrors.wrongHttpObjectResponse)
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
//                    onFail(FetchConnectionErrors.wrongResponseStatusCode)
                    return
                }
                
                if let data = data {
//                    onSuccess(data)
                } else {
//                    onFail(FetchConnectionErrors.dataIsNil)
                }
            }
        })
        
        task.resume()
    }
}
