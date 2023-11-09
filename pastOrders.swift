//
//  pastOrders.swift
//  sjuOrdering
//
//  Created by Garrett Goodney on 11/8/23.
//

import SwiftUI

struct pastOrders: View {
    var body: some View {
        NavigationStack {
            
            List {
                Section{
                    Text("Pretzel - 11/1/13")
                    Text("Hamburger combo - 11/1/23")
                }
            }
            .navigationTitle("Past orders")
        }
        
    }
}

#Preview {
    pastOrders()
}
