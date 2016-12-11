//
//  PaintShop.swift
//  Paintshop
//
//  Created by Marc Dermejian on 07/12/2016.
//  Copyright © 2016 Marc Dermejian. All rights reserved.
//

import Foundation

class PaintShop {
	
	//MARK: - stored properties
	var customers: [Customer] = []
	var numberOfColors = 0
	
	//list of paints to satisfy the customers
	private var fixedFinishes: [Int:Finish] = [:]
	//list of candidate paints to make it to the final solution
	private var paintCandidates: [Paint] = []
	
	//MARK: - computed properties
	var formattedOutput: String {
		
		var output = ""
		for i in stride(from: 1, through: numberOfColors, by: 1) {
			if let finish = fixedFinishes[i] {
				output += "\(finish.rawValue) "
			}else {
				output += "\(Finish.gloss.rawValue) "
			}
		}
		
		return output.trimmingCharacters(in: .whitespaces)
	}

	//MARK: - brains of the paintshop
	func mixColors() -> String {
		
		// start by sorting them (customers with least number of preferences go first)
		customers.sort()
		
		for customer in customers {
			
			paintCandidates = []
			let fixedPaint = decidePaint(forCustomer: customer)
			
			if customer.paintPreferencesCount == 1 {
				// if the customer has only one paint preference, that must be in the output
				guard fixedPaint != nil else {
					return "No solution exists!"
				}
				fixedFinishes[fixedPaint!.color] = fixedPaint!.finish
			}else {
				// if the customer has more paint preferences, the method below will also
				// fill a list with candidate paints and return a fixed paint or null
				if fixedPaint != nil {
					// there is a paint already fixed which is good for this customer,
					// nothing left to do, customer is already satisfied
					continue
				}
				else if paintCandidates.isEmpty {
					// all the paint preferences of this customer is in conflict
					// with the ones already fixed - no solution exists
					return "No solution exists!"
				}
				
				// we need to select one paint for this customer
				// it should be gloss, since it's cheaper, but
				// if there isn't one, we'll go with the first
				var paintToSelect =	paintCandidates.first
				for paint in paintCandidates {
					if paint.finish == .gloss {
						paintToSelect = paint
						break;
					}
				}
				
				fixedFinishes[paintToSelect!.color] = paintToSelect!.finish
				
			}
		}
		
		return formattedOutput
	}
	
	func decidePaint(forCustomer customer: Customer) -> Paint? {
		
		for paint in customer.paintPreferences {
			let fixedFinish = self.fixedFinishes[paint.color]
			
			if customer.paintPreferencesCount == 1 {
				if fixedFinish == nil || fixedFinish == paint.finish {
					// there is no finish fixed for this color yet,
					// or it's the same as the preference of this customer
					return paint
				}else {
					// there is another finish needed for this color already,
					// there is no solution.
					return nil
				}
			}else {
				if (fixedFinish == nil) {
					// 'color' is not in the fixed finishes yet,
					// let's remember it as a candidate
					paintCandidates.append(paint);
				}
				else if (fixedFinish == paint.finish){
					// we found one of the paint preferences of this customer
					// in the already fixed paints, let's return it!
					return paint
				}
			}
		}
		// for a customer with multiple paint preferences, there were no match
		// in the already fixed paints; that's not a problem.
		return nil
	}
	
}

