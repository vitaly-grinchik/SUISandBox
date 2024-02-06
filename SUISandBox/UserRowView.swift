//
//  UserRowView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 4.02.24.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(
                    Color(
                        red: user.tintRed,
                        green: user.tintGreen,
                        blue: user.tintBlue
                    )
                )
                .frame(width: 40, height: 40)
            
            Text(user.fullName)
                
            Spacer()
        }
            
    }

}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: DataStore.shared.newUser)
    }
}
