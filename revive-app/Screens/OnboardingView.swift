//
//  OnboardingView.swift
//  revive-app
//
//  Created by shreenidhi vm on 23/10/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth:Double = UIScreen.main.bounds.width - 37
    @State private var buttonOffset:CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    var body: some View {
        ZStack {
            Color("Blue")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Spacer()
                VStack(spacing: 0){
                    Text(textTitle)
                        .font(.system(size:60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                        It isn't what you have or who you are or where you are or what you are doing that makes you happy or unhappy
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y:isAnimating ? 0 : -70)
                .animation(.easeOut(duration: 1), value: isAnimating)
                ZStack{
                    CircleGroupView(shapeOpacity: 0.2, shapeColor: .white)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged{gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                    }
                                }
                                .onEnded{_ in
                                    imageOffset = .zero
                                }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                
                Spacer()
                ZStack{
                    Text("Get started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    HStack{
                        
                        Capsule()
                            .fill(Color("Red"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                        
                        
                        
                        
                        
                        HStack {
                            ZStack{
                                            Circle()
                                                .fill(Color("Red"))
                                            Circle()
                                                .fill(.black.opacity(0.15))
                                                .padding(8)
                                            Image(systemName: "chevron.right.2")
                                                .font(.system(size:24,weight: .bold))
                                            
                                        }
                                        .foregroundColor(.white)
                                        .frame(width: 80,height: 80,alignment: .center)
                                        .offset(x:buttonOffset)
                                        .gesture(
                                            DragGesture()
                                                .onChanged {gesture in
                                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                                        buttonOffset = gesture.translation.width
                                                    }
                                                }
                                                .onEnded{_ in
                                                    withAnimation(Animation.easeOut(duration: 1)){
                                                        if  buttonOffset > buttonWidth / 2 {
                                                            buttonOffset = buttonWidth - 80
                                                            isOnboardingViewActive = false
                                                           
                                                        }else{
                                                            buttonOffset = 0
                                                        }
                                                    }
                                                }
                                        )
                            Spacer()
                        }
                    

                        
                                    
                        
                            
                        
                        
                    
                    
                    
                    
                }
                .frame(height: 80,alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
