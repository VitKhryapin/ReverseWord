//
//  ReverseWordUITests.swift
//  ReverseWordUITests
//
//  Created by Vitaly Khryapin on 18.11.2021.
//

import XCTest

class ReverseWordUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReversWords() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.textFields["inputTF"].tap()
        app.textFields["inputTF"].typeText("Test string")
        app.buttons["Return"].tap()
        app.buttons["Reverse"].tap()
        let resultTest = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultTest.label, "tseT gnirts")
        
    }
    
    func testEmptyTextFieldAndTapButtonRevers() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.buttons["Reverse"].tap()
        let resultTest = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultTest.label, "Please type text")
    }
    
    func testClearTextFieldAndResultLabel() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.textFields["inputTF"].tap()
        app.textFields["inputTF"].typeText("Test string")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.buttons["Reverse"].tap()
        app.buttons["Clear"].tap()
        let resultTest = app.staticTexts["resultLabel"]
        XCTAssertEqual(resultTest.label, "")
        

        
        
    }
}
