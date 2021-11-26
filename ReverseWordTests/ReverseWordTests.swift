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
    func testNotEmptyTextFieldAndDefaultSegmentController() throws {
        
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
    func testTextFieldWithAlhabeticSymbolsAndDefaultSegmentController() throws {
        
        //Given
        revers.inputTF.text = "Foxminded cool 24/7"
        let resultTest = "dednimxoF looc 24/7"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testTextFieldNotAlhabeticSymbolsAndDefaultSegmentController() throws {
        
        //Given
        revers.inputTF.text = "abcd efgh"
        let resultTest = "dcba hgfe"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testTextFieldWithAlhabeticSymbolsAndPunctuationMarksAndDefaultSegmentController() throws {
        
        //Given
        revers.inputTF.text = "a1bcd efg!h"
        let resultTest = "d1cba hgf!e"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testTextFieldOnlyNumbersAndDefaultSegmentController() throws {
        
        //Given
        revers.inputTF.text = "1234 56789"
        let resultTest = "1234 56789"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testNotEmptyTextFieldAndCustomSegmentController() throws {
        
        //Given
        revers.inputTF.text = "Test string"
        let resultTest = "tseT gnirts"
        revers.segmentControllerOutlet.actionForSegment(at: 1)
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testTextFieldAndCustomSegmentControllerAndNotEmptyIgnoreTF1() throws {
        
        //Given
        revers.inputTF.text = "Foxminded cool 24/7"
        let resultTest = "dexdnimoF oocl 7/42"
        revers.segmentControllerOutlet.selectedSegmentIndex = 1
        revers.textIgnoreTF.text = "xl"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    func testTextFieldAndCustomSegmentControllerAndNotEmptyIgnoreTF2() throws {
        
        //Given
        revers.inputTF.text = "a1bcd efglh"
        let resultTest = "dcb1a hgfle"
        revers.segmentControllerOutlet.selectedSegmentIndex = 1
        revers.textIgnoreTF.text = "xl"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    func testTextFieldAndCustomSegmentControllerAndOnlyNumbersIgnoreTF() throws {
        
        //Given
        revers.inputTF.text = "12345 12345"
        let resultTest = "42315 42315"
        revers.segmentControllerOutlet.selectedSegmentIndex = 1
        revers.textIgnoreTF.text = "25"
    
        //When
        if revers.inputTF.text != nil {
            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(resultTest, revers.resultLabel.text)
    }
    
    //Button hidden
//    func testEmptyTextField() throws {
//
//        //Given
//        revers.inputTF.text = nil
//        let resultTest = "Please type text"
//
//        //When
//        if revers.inputTF.text == nil || revers.inputTF.text == "" {
//            revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
//        }
//
//        //Then
//        XCTAssertEqual(resultTest, revers.resultLabel.text)
//    }
    //Button hidden
//    func testEmptyTextFieldAndNotEmptyResultLabel() throws {
//
//        //Given
//        revers.inputTF.text = nil
//        revers.resultLabel.text = "some text"
//        let resultTest = "Please type text"
//
//        //When
//        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
//
//        //Then
//        XCTAssertEqual(resultTest, revers.resultLabel.text)
//    }
    //Button hidden
//    func testNotEmptyTextFieldAndNotEmptyResultLabel() throws {
//
//        //Given
//        revers.inputTF.text = "Test string"
//        revers.resultLabel.text = "Please type text"
//        let resultTest = "tseT gnirts"
//
//        //When
//        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
//
//
//        //Then
//        XCTAssertEqual(resultTest, revers.resultLabel.text)
//    }
    //Button hidden
//    func testClear() throws {
//
//        //Given
//        revers.inputTF.text = "Test string"
//        revers.resultLabel.text = "Please type text"
//        let resultTest = ""
//
//        //When
//        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
//        revers.reverseButtonOutlet.sendActions(for:.allTouchEvents)
//
//
//        //Then
//        XCTAssertEqual(resultTest, revers.resultLabel.text)
//    }

}
