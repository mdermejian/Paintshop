//
//  main.swift
//  Paintshop
//
//  Created by Marc Dermejian on 07/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import Foundation

let console = ConsoleIO()
let parser = FileParser()

do {
	let filePath = try console.parseInput()
	let paintshop = try parser.parseCustomersData(fromFileAtPath: filePath)
	let solution = paintshop.mixColors()
	print(solution)
	
}catch (Errors.invalidArgsCount) {
	console.printUsage()
}catch (Errors.invalidTotalColors) {
	print("invalid first line encountered! it should be an Int indicating total colors!")
}catch (Errors.invalidColorPreferences) {
	print("invalid color preferences line!")
}catch (Errors.invalidFinish) {
	print("invalid finish encountered!")
}catch _ {
	print("some error has occured")
}
