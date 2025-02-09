//
//  ContentView.swift
//  Animations
//
//  Created by Ali Syed on 2025-01-26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingRed = false
        
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ContentView()
}
