//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 황석범 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var imageHeight: CGFloat?
    @State private var textContainerHeight: CGFloat?

    var body: some View {
        HStack() {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 80.0, height: 80)
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            print("Image height: \(geometry.size.height)")
                            imageHeight = geometry.size.height
                        }
                    }
                }
                .padding(.top, 20)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Hello")
                    .font(.title)
                    .foregroundColor(.blue)
                Text("World")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .frame(maxHeight: textContainerHeight)
            .overlay {
                GeometryReader { geometry in
                    Color.clear.onAppear {
                        print("Text container height: \(geometry.size.height)")
                        textContainerHeight = geometry.size.height
            
                    }
                }
            }
            .padding(.top, imageHeight ?? 0 > textContainerHeight ?? 0 ? 20.0 : 10.0)
        }
        .padding()
        .background(Color.yellow)
    }
}

#Preview {
    ContentView()
}
