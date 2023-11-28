//
//  creditCard.swift
//  SJU Ordering
//
//  Created by Ladi Bamgbose on 11/20/23.
//

// CreditCard.swift
import Foundation

struct CreditCard: Identifiable, Equatable {
    var id = UUID()
    var cardNumber: String
    var cardHolder: String
    // ... other properties

    // Implement the Equatable protocol
    static func == (lhs: CreditCard, rhs: CreditCard) -> Bool {
        return lhs.id == rhs.id
    }
}

