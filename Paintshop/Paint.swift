//
//  Paint.swift
//  Paintshop
//
//  Created by Marc Dermejian on 07/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import Foundation

enum Finish: String, CustomStringConvertible {

	case matt = "M"
	case gloss = "G"

	// MARK: CustomStringConvertible implementation
	var description: String {
		switch self {
		case .matt: return "Matte"
		case .gloss: return "Gloss"
		}
	}
}

class Paint: Hashable {

	// MARK: Stored properties
	let color: Int
	let finish: Finish
	
	init(color: Int, finish: Finish) {
		self.color = color
		self.finish = finish
	}

	// MARK: Equatable implementation
	public static func == (left: Paint, right: Paint) -> Bool {
		return left.color == right.color
	}
	
	// MARK: Hashable implementation
	var hashValue: Int {
		return color
	}
}

