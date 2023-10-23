//
//  CircleGroupView.swift
//  revive-app
//
//  Created by shreenidhi vm on 23/10/23.
//

import SwiftUI

struct CircleGroupView: View {
    @State var shapeOpacity: Double
    @State var shapeColor:Color
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity),lineWidth: 40)
                .frame(width: 260,height: 260,alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity),lineWidth: 80)
                .frame(width: 260,height: 260,alignment: .center)
            }
        .blur(radius: isAnimating ? 1 :0 )
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 0.5), value: isAnimating)
        .onAppear(perform:{
            
         isAnimating = true
            
        })
        
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Blue")
                .ignoresSafeArea()
            CircleGroupView(shapeOpacity: 0.2, shapeColor: .white)
        }
    }
}
