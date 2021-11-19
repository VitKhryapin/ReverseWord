//
//  ReverseWordTests.swift
//  ReverseWordTests
//
//  Created by Vitaly Khryapin on 18.11.2021.
//

import XCTest
@testable import ReverseWord

class ReverseWordTests: XCTestCase {
    
    var revers: ViewController!
    

    override func setUp() {

    }
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        revers = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        revers.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        revers = nil
    }
    
    func testSignupForm_WhenLoaded_TextFieldAreConnected() throws {
        _ = try XCTUnwrap(revers.inputTF, "The Text to reverse UITextField is not connected")
    }

    func testExample() throws {
        
    }
    func testNotEmptyTextField() throws {
        
        //Given
        revers.inputTF.text = "Test string"
        let resultTest = "tseT gnirts"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    func testEmptyTextField() throws {
        
        //Given
        revers.inputTF.text = nil
        let resultTest = "Please type text"
    
        //When
        if revers.inputTF.text == nil || revers.inputTF.text == "" {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testEmptyTextFieldAndNotEmptyResultLabel() throws {
        
        //Given
        revers.inputTF.text = nil
        revers.resultLabel.text = "some text"
        let resultTest = "Please type text"
    
        //When
        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
      
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testNotEmptyTextFieldAndNotEmptyResultLabel() throws {
        
        //Given
        revers.inputTF.text = "Test string"
        revers.resultLabel.text = "Please type text"
        let resultTest = "tseT gnirts"
    
        //When
        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
       
      
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    func testClear() throws {
        
        //Given
        revers.inputTF.text = "Test string"
        revers.resultLabel.text = "Please type text"
        let resultTest = ""
    
        //When
        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
       
      
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }

}
