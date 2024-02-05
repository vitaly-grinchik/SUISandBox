//
//  UserInfoView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var user: User
    var body: some View {
        VStack {
            Text(user.emoji)
                
            HStack {
                Text("First Name")
                TextField("User", text: $user.firstName)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.blue, width: 1)
            }
            
            HStack {
                Text("Last Name")
                TextField("User", text: $user.lastName)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.blue, width: 1)
            }
        }
        .padding()
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(user: .constant(DataStore.shared.newUser))
    }
}
