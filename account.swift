//
//  account.swift
//  sjuOrdering
//
//  Created by Garrett Goodney on 11/8/23.
//

import SwiftUI

struct account: View {
    @State public var email: String = ""//this should be private
    var body: some View {
        VStack{
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.bold)
            TextField("SJU Email address", text: $email)
                .padding()
                .font (.title3)
                .background(Color.gray)
                
        }
    }
}

#Preview {
    account()
}
