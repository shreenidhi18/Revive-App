//
//  HomeView.swift
//  revive-app
//
//  Created by shreenidhi vm on 23/10/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ZStack {
                CircleGroupView(shapeOpacity: 0.1, shapeColor: .gray)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                          .animation(
                            Animation
                              .easeInOut(duration: 4)
                              .repeatForever()
                            , value: isAnimating
                          )
            }
            
            Text("Everything is a gift of the universe--even joy, anger, jealously, frustration, or separateness. Everything is perfect either for our growth or our enjoyment.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            Button(action:{
                isOnboardingViewActive = true
                
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
