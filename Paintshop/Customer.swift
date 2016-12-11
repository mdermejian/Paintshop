//
//  Customer.swift
//  Paintshop
//
//  Created by Marc Dermejian on 07/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import Foundation

class Customer {
	
	//MARK: - stored properties
	var paintPreferences: Set<Paint> = []

	//MARK: - computed properties
	var paintPreferencesCount: Int {
		return paintPreferences.count
	}

	//MARK: - initializers

	init(paintPreferences: String) throws {
		let colors = paintPreferences.components(separatedBy: CharacterSet.whitespaces)
		guard colors.count > 1, colors.count%2 == 0 else {
			//the line was either empty or contained
			throw Errors.invalidColorPreferences
		}
		
		for index in stride(from:0, to: colors.count, by: 2) {
			guard let color = Int(colors[index]) else { throw Errors.invalidColorPreferences }
			guard let finish = Finish(rawValue: colors[index+1]) else { throw Errors.invalidFinish }

			add(color: color, withFinish: finish)
		}
	}
	
	//MARK: - helper funcs
	private func add(paint: Paint) {
		paintPreferences.insert(paint)
	}
	
	private func add(color: Int, withFinish finish: Finish? = .gloss){
		add(paint: Paint(color: color, finish: finish!))
	}
	
}

// MARK: - Comparable protocol implementation

extension Customer: Comparable {}

func == (lhs: Customer, rhs: Customer) -> Bool {
	//implementation not really required, except to complete the implementation of Comparable protocol
	return false
}

func < (lhs: Customer, rhs: Customer) -> Bool {
	return lhs.paintPreferencesCount < rhs.paintPreferencesCount
}
