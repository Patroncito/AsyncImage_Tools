//
//  ContentView.swift
//  AsyncImage
//
//  Created by Alfonso Patron on 03/01/24.
//

import SwiftUI

struct ContentView: View {
    private let  imageURL : String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        
        //MARK: -1. BASIC -> Fast and Easy to show a image in AsyncImage.

        // AsyncImage(url: URL(string: imageURL))
        
        //MARK: -2. SCALE -> Most Manipulable
        AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        
    }
}

#Preview {
    ContentView()
}
