//
//  ContentView.swift
//  Animations
//
//  Created by Ali Syed on 2025-01-26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    //.onEnded { _ in dragAmount = .zero}
                    .onEnded { _ in
                        //explicit animation
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
            )
            //implicit animation
            //.animation(.bouncy, value: dragAmount)
    }
}

#Preview {
    ContentView()
}
