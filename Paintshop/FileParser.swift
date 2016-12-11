//
//  FileParser.swift
//  Paintshop
//
//  Created by Marc Dermejian on 07/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import Foundation

class FileParser {
	
	func parseCustomersData(fromFileAtPath filePath:String) throws -> PaintShop {
		var customers: [Customer] = []
		
		// first, read the contents of the file
		let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
		
		print(fileContents)
		
		// then, separate by new line
		var customerStrings = fileContents.components(separatedBy: CharacterSet.newlines)
		
		//the total number of colors is on the first line
		guard let totalColors = Int(customerStrings[0]) else {
			throw Errors.invalidTotalColors
		}
		
		//remove the first element of the array to make parsing the rest easier
		customerStrings.remove(at: 0)
		
		// then create a customer object from each string representation
		for customerString in customerStrings {
			let trimmedString = customerString.trimmingCharacters(in: .whitespacesAndNewlines)
			if trimmedString.isEmpty {
				continue
			}
			let customer = try Customer(paintPreferences: trimmedString)
			customers += [customer]
		}
		
		let paintshop = PaintShop()
		paintshop.numberOfColors = totalColors
		paintshop.customers = customers
		return paintshop
		
	}
}
