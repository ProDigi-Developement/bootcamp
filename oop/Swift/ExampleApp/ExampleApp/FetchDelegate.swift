//
//  FetchDelegate.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

public protocol FetchDelegate {
    // MARK: Fetch Users
    func fetchedAllUsers()
    func fetchUsersFailed(errorMessage msg: String)
}

