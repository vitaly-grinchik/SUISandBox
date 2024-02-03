//
//  UserInfoView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var user: String
    var body: some View {
        TextField("User", text: $user)
            .textFieldStyle(.roundedBorder)
            .border(Color.blue, width: 2)
            .padding()
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(user: .constant(""))
    }
}
