//
//  UserTests.swift
//  HighStakes
//
//  Created by Rafael Valer on 28/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import XCTest
@testable import HighStakes

class UserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogInSucceeded(){
        let email = "test@test.com"
        let password = "testUser"
        
        var expectation: XCTestExpectation? = self.expectation(description: "testLogInSucceeded")
        
        User.login(email, password) { (user, error, message) in
            DispatchQueue.main.async(execute: {
                XCTAssertNotNil(user)
                expectation?.fulfill()
                expectation = nil
            })
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    func testLogInFailed(){
        let email = "unknownUser@test.com"
        let password = "unknownUserPasswordInvalid231231204"
        
        var expectation: XCTestExpectation? = self.expectation(description: "testLogInFailed")
        
        User.login(email, password) { (user, error, message) in
            DispatchQueue.main.async(execute: {
                XCTAssertNil(user)
                expectation?.fulfill()
                expectation = nil
            })
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    func testSignUpInvalidParams(){
        
        let firstName = "Alex"
        let lastName = "Barbosa"
        let email = ""
        let password = "AlexBarbosa"
        
        var expectation: XCTestExpectation? = self.expectation(description: "testSignUpInvalidParams")
        
        User.signUp(email, password, firstName, lastName) { (user, error, msg) in
            DispatchQueue.main.async(execute: {
                XCTAssertNil(user)
                expectation?.fulfill()
                expectation = nil
            })
        }
        
        self.waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
