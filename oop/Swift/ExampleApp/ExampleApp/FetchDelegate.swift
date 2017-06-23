//
//  FetchDelegate.swift
//  ExampleApp
//
//  Created by Caio Dias on 2017-06-19.
//  Copyright © 2017 Caio Dias. All rights reserved.
//

protocol FetchDelegate {
    // MARK: Fetch Users
    func fetchedAllUsers()
    func fetchUsersFailed(errorMessage msg: String)
    
    // MARK: Update User
    func updatedSuccessfully(user: User)
    func updatedFailed(errorMessage msg: String)
    
    // MARK: Delete User
    func deletedSuccessfully(user: User)
    func deletedFailed(errorMessage msg: String)
}

