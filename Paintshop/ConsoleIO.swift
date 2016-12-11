//
//  ConsoleIO.swift
//  Paintshop
//
//  Created by Marc Dermejian on 07/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import Foundation

class ConsoleIO {
	
	func parseInput() throws -> String {
		let argCount = CommandLine.argc
		
		// we need to make sure that we have at least 2 arguments
		// Application will discard any extra arguments
		guard argCount > 1 else {
			throw Errors.invalidArgsCount
		}
		
		return CommandLine.arguments[1] //this is supposed to be the input file
	}
	
	func printUsage() {
		let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
		
		print("Please provide the path for the input file as the first argument!")
		print("usage:")
		print("\(executableName) pathToFile")
	}
	
}
