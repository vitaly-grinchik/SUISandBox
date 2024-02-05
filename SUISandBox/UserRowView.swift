//
//  UserRowView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 4.02.24.
//

import SwiftUI

struct UserRowView: View {
    let name: String
    let spotColor: String
    let emoji: String
    
    var body: some View {
        HStack {
            ZStack {
                Color(spotColor)
                Circle()
                    .frame(width: 40, height: 40)
                Text(emoji)
            }
            Text(name)
                .font(.title)
            Spacer()
        }
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(name: "User", spotColor: "blue", emoji: "🏠")
    }
}
