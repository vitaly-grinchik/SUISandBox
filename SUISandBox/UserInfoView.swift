//
//  UserInfoView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var user: User
    @State private var emojiOpacity = 1.0
    @Environment(\.presentationMode) var presentationMode
    
    var tintColor: Color {
        Color(red: user.tintRed, green: user.tintGreen, blue: user.tintBlue)
    }
    
    var body: some View {
            VStack {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 8)
                        .fill(tintColor)
                        .frame(width: 130, height: 130)
                        .shadow(color: tintColor, radius: 8)
                    
                    Text(user.emoji)
                        .font(.system(size: 80))
                }
                .opacity(emojiOpacity)
                .onTapGesture {
                    withAnimation {
                        emojiOpacity = 0.0
                    }
//                    presentationMode.wrappedValue.dismiss()
                }
                
                    
                VStack {
                    HStack {
                        Text("First Name")
                        TextField("User", text: $user.firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.blue, width: 1)
                            
                    }
                    
                    HStack {
                        Text("Last Name")
                        TextField("User", text: $user.lastName)
                            .border(Color.blue, width: 1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
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
