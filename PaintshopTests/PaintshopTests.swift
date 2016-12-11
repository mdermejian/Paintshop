//
//  PaintshopTests.swift
//  PaintshopTests
//
//  Created by Marc Dermejian on 11/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import XCTest

class PaintshopTests: XCTestCase {
	
	private struct Constants {
		
		static let ResourcesDir = "Resources"
		
		static let InvalidNumberOfColors = "invalidNumberOfColors"
		static let MissingNumberOfColors = "missingNumberOfColors"
		static let BadFinish = "badFinish"
		static let EmptyLine = "emptyLine"
		static let InvalidColor = "invalidColor"
		
		static let ValidInput01 = "valid_input01"
		static let ValidInput02 = "valid_input02"
		static let ValidInput03 = "valid_input03"
		static let ValidInput04 = "valid_input04"
		static let ValidInput05 = "valid_input05"
		
		static let ValidInput06 = "valid_input06"
		static let ValidInput07 = "valid_input07"
		static let ValidInput08 = "valid_input08"
		static let ValidInput09 = "valid_input09"

	}
	
	let console = ConsoleIO()
	let parser = FileParser()

	lazy var bundle: Bundle = {
		return Bundle(for: type(of: self))
	}()
	
	func testInvalidNumberOfColors () {
		let fileName = bundle.path(forResource: Constants.InvalidNumberOfColors, ofType: nil, inDirectory: Constants.ResourcesDir)
		
		XCTAssertThrowsError(try parser.parseCustomersData(fromFileAtPath: fileName!)) { error in
			XCTAssertEqual(error as? Errors, Errors.invalidTotalColors)
		}
	}
	
	func testMissingNumberOfColors () {
		let fileName = bundle.path(forResource: Constants.MissingNumberOfColors, ofType: nil, inDirectory: Constants.ResourcesDir)
		XCTAssertThrowsError(try parser.parseCustomersData(fromFileAtPath: fileName!)) { error in
			XCTAssertEqual(error as? Errors, Errors.invalidTotalColors)
		}
	}
	
	func testBadFinishInvalid () {
		let fileName = bundle.path(forResource: Constants.BadFinish, ofType: nil, inDirectory: Constants.ResourcesDir)
		
		XCTAssertThrowsError(try parser.parseCustomersData(fromFileAtPath: fileName!)) { error in
			XCTAssertEqual(error as? Errors, Errors.invalidFinish)
		}
	}
	
	func testInvalidColor () {

		let fileName = bundle.path(forResource: Constants.InvalidColor, ofType: nil, inDirectory: Constants.ResourcesDir)
		XCTAssertThrowsError(try parser.parseCustomersData(fromFileAtPath: fileName!)) { error in
			XCTAssertEqual(error as? Errors, Errors.invalidColorPreferences)
		}
	}

	func testEmptyLine () {
		let fileName = bundle.path(forResource: Constants.EmptyLine, ofType: nil, inDirectory: Constants.ResourcesDir)
		let paintshop = try! parser.parseCustomersData(fromFileAtPath: fileName!)
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G G G G G")
	}

	func testValid_input01 () {
		let fileName = bundle.path(forResource: Constants.ValidInput01, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G G G G M")
	}
	
	func testValid_input02 () {
		let fileName = bundle.path(forResource: Constants.ValidInput02, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "No solution exists!")
	}
	
	func testValid_input03 () {
		let fileName = bundle.path(forResource: Constants.ValidInput03, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "M M")
	}

	func testValid_input04 () {
		let fileName = bundle.path(forResource: Constants.ValidInput04, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G G G G G G M G G")
	}

	func testValid_input05 () {
		let fileName = bundle.path(forResource: Constants.ValidInput05, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G M G")
	}

	func testValid_input06 () {
		let fileName = bundle.path(forResource: Constants.ValidInput06, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "M M")
	}

	func testValid_input07 () {
		let fileName = bundle.path(forResource: Constants.ValidInput07, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G G G M G")
	}

	func testValid_input08 () {
		let fileName = bundle.path(forResource: Constants.ValidInput08, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G M G M G")
	}

	func testValid_input09 () {
		let fileName = bundle.path(forResource: Constants.ValidInput09, ofType: nil, inDirectory: Constants.ResourcesDir)
		guard let paintshop = try? parser.parseCustomersData(fromFileAtPath: fileName!) else { XCTFail("error encountered"); return }
		let solution = paintshop.mixColors()
		XCTAssertEqual(solution, "G G G G M")
	}

}
