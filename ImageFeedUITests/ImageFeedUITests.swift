//
//  ImageFeedUITests.swift
//  ImageFeedUITests
//
//  Created by Ilya Kalin on 25.07.2024.
//

import XCTest

final class ImageFeedUITests: XCTestCase {
    private let email: String = "ilya.muromec888@gmail.com"
    private let password: String = "lzdrmbrbn1488"
    private let fullName: String = "Ilya Kalin"
    private let username: String = "@calvinkalin"
    
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
    }
    
    func testAuth() throws {
        sleep(3)
        
        app.buttons["Authenticate"].tap()
        
        let webView = app.webViews[ "UnsplashWebView"]
        
        XCTAssertTrue(webView.waitForExistence(timeout: 5))
        
        let loginTextField = webView.descendants(matching: .textField).element
        XCTAssertTrue(loginTextField.waitForExistence(timeout: 5))
        
        loginTextField.tap()
        loginTextField.typeText(email)
        app.buttons["Done"].tap()
        
        let passwordTextField = webView.descendants(matching: .secureTextField).element
        XCTAssertTrue(passwordTextField.waitForExistence(timeout: 5))
        
        passwordTextField.tap()
        passwordTextField.typeText(password)
        app.buttons["Done"].tap()
        
        
        
        webView.buttons["Login"].tap()
        
        let tablesQuery = app.tables
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
    }
    
    func testFeed() throws {
        let tablesQuery = app.tables
        
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        cell.swipeUp()
        
        sleep(2)
        
        let cellToLike = tablesQuery.children(matching: .cell).element(boundBy: 1)
        
        cellToLike.buttons["Like button"].tap()
        cellToLike.buttons["Like button"].tap()
        
        sleep(2)
        
        cellToLike.tap()
        
        sleep(2)
        
        let image = app.scrollViews.images.element(boundBy: 0)
        
        image.pinch(withScale: 3, velocity: 1)
        
        image.pinch(withScale: 0.5, velocity: -1)
        
        let navBackButtonWhiteButton = app.buttons["Nav back button white"]
        navBackButtonWhiteButton.tap()
    }
    
    func testProfile() throws {
        sleep(3)
        app.tabBars.buttons.element(boundBy: 1).tap()
        
        let avatarImage = app.images["Avatar image"]
        XCTAssertTrue(avatarImage.waitForExistence(timeout: 5))
        
        XCTAssertTrue(app.staticTexts["\(fullName)"].exists)
        XCTAssertTrue(app.staticTexts["\(username)"].exists)
        
        app.buttons["Logout button"].tap()
        
        app.alerts["Пока, пока!"].scrollViews.otherElements.buttons["Да"].tap()
    }
}
