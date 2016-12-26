//
//  User.swift
//  HighStakes
//
//  Created by Rafael Valer on 26/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation
import Parse

class User: PFUser {
    static var className : String = "_User"
    
    // MARK: - Managed PFSubclassing
    override class func initialize() {
        self.registerSubclass()
    }
    
    // MARK: Initializers
    override init() {
        super.init()
    }
    init(objectId: String) {
        super.init()
        self.objectId = objectId
    }
    init(email: String, password: String, firstName: String, lastName: String, fullName: String) {
        super.init()
        
        self.email = email
        self.username = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
    }
    
    // MARK: - Properties
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var fullName: String?
    
    // MARK: - Methods
    
    class func login(_ email: String?, _ password: String?, response: @escaping (_ user: User?, _ error: Error?, _ message: String?) -> ()) {
        guard let email = email, !email.isEmpty else {
            response(nil, nil, "Please fill your email.")
            return
        }
        guard let password = password, !password.isEmpty else {
            response(nil, nil, "Please fill your password.")
            return
        }
        
        User.logInWithUsername(inBackground: email, password: password) { (user: PFUser?, error: Error?) in
            guard let user = user as? User else {
                response(nil, error, "User not found.")
                return
            }
            response(user, error, nil)
        }
    }
    class func signUp(_ email: String?, _ password: String?, _ firstName: String?, _ lastName: String?, response: @escaping (_ user: User?, _ error: Error?, _ message: String?)->()) {
        guard let firstName = firstName, !firstName.isEmpty else {
            response(nil, nil, "Please fill your firstName.")
            return
        }
        guard let lastName = lastName, !lastName.isEmpty else {
            response(nil, nil, "Please fill your lastName.")
            return
        }
        guard let email = email, !email.isEmpty else {
            response(nil, nil, "Please fill your email.")
            return
        }
        guard let password = password, !password.isEmpty else {
            response(nil, nil, "Please fill your password.")
            return
        }
        
        let newUser = User(email: email, password: password, firstName: firstName, lastName: lastName, fullName: "\(firstName) \(lastName)")
        newUser.signUpInBackground { (succeeded: Bool, error: Error?) in
            response(newUser, error, nil)
        }
    }
}
