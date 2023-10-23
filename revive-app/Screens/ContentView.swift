//
//  ContentView.swift
//  revive-app
//
//  Created by shreenidhi vm on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            }else{
                HomeView()
                
            }
        }
        .animation(.easeOut(duration: 0.5), value: isOnboardingViewActive)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
