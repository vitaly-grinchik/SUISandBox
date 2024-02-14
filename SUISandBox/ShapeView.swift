//
//  ShapeView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 11.02.24.
//

import SwiftUI

struct ShapeView: View {
    
    @State private var radius: CGFloat = 100
    
    var body: some View {
        VStack {
            Circle()
                .stroke(lineWidth: 7)
                .fill(Color(red: 0.5, green: 0.5, blue: 0.5))
            .shadow(radius: 10)
            .frame(width: radius * 2, height: radius * 2)
            .onTapGesture {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.0)) {
                    radius = (radius == 40) ? 100.0 : 40.0
                }
            }
            
        }
            
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
