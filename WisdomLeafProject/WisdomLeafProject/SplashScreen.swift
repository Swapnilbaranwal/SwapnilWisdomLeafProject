//
//  SplashScreen.swift
//  WisdomLeafProject
//
//  Created by Swapnil baranwal on 17/05/23.
//

import SwiftUI


@available(iOS 15.0, *)
struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if isActive{
                ContentView()
            }
            else{
                Color.white
                // Set the background color to white
                
                Image("wisdomLeaf")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300) // Adjust the frame size as needed
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // five seconds of delay then application will be visible
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {

                self.isActive = true
            }
        }
    }
}
