// Badge.swift

import SwiftUI

struct Badge: View {
    let number: Int

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 20, height: 20)

            Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 13))
                .offset(x: -2, y: 2)
        }
    }
}
