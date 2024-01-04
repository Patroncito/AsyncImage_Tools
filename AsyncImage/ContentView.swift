//
//  ContentView.swift
//  AsyncImage
//
//  Created by Alfonso Patron on 03/01/24.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self.imageModifier()
        
        .frame(maxWidth: 128)
        .foregroundStyle(Color.purple)
        .opacity(0.5)
        
    }
}

struct ContentView: View {
    private let  imageURL : String = "https://acortar.link/xGghLJ"
    var body: some View {
        
        //MARK: -1. BASIC -> Fast and Easy to show a image in AsyncImage.

        // AsyncImage(url: URL(string: imageURL))
        
        //MARK: -2. SCALE -> Most Manipulable
        
        // AsyncImage(url: URL(string: imageURL), scale: 3.0)
        
        //MARK: -3 PLACEHOLDER -> Usability.
       
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(40)
        
        //MARK: -4 PHASE -> We can control of phases of loading way
        
        // SUCCESS : The image succesfully loaded.
        // FAILURE : THE IMAGEN FAILED TO LOAD WITH A ERROR.
        // EMPTY : NO IMAGE
        
//        AsyncImage(url: URL(string: imageURL)){ phase in
//            
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40)
        
        //MARK: -5 The best option. ALL CONTROL OF PHASES AND LOADING
        
        
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            
//            switch phase {
//            case .success(let image):
//                image.imageModifier()
//            case .empty:
//                Image(systemName: "photo.circle.fill").iconModifier()
//            case .failure(_):
//                Image(systemName: "ant.circle.fill").iconModifier()
//            @unknown default:
//                ProgressView()
//            }
//            
//        }
        
        
        //MARK: 6.- ANIMATION.
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
                    .clipShape(Circle())
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()

            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
            
        }
        .padding(40)
    }
}

#Preview {
    ContentView()
}
