//
//  UserRowView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 4.02.24.
//

import SwiftUI

struct UserRowView: View {
    let fullName: String
    let emoji: String
    let spotColor = Self.getColor()
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(spotColor)
                .frame(width: 40, height: 40)
            
            Text(fullName)
                
            Spacer()
        }
            
    }
    
    private static func getColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        return Color(red: red, green: green, blue: blue)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(fullName: "User Fullname", emoji: "♦️")
    }
}
