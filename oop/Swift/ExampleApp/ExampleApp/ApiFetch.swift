//
//  UserApi.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

import Foundation

class UserApi {
    internal func download(url urlRequest: URL, _ onSuccess: @escaping ConnectionFetchAllSuccess, _ onFail: @escaping ConnectionFetchAllFail) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                onFail(FetchConnectionErrors.Unknown(error))
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
                    onFail(FetchConnectionErrors.wrongHttpObjectResponse)
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    onFail(FetchConnectionErrors.wrongResponseStatusCode)
                    return
                }
                
                if let data = data {
                    onSuccess(data)
                } else {
                    onFail(FetchConnectionErrors.dataIsNil)
                }
            }
        })
        
        task.resume()
    }

}
