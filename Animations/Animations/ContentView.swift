//
//  ContentView.swift
//  Animations
//
//  Created by Ali Syed on 2025-01-26.
//

import SwiftUI

struct ContentView: View {
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
        
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) {
                num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    ContentView()
}
