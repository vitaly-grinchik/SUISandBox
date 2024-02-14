//
//  UsersListView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UsersListView: View {
    @State private var isAddingNewUser = false
    @State private var listSize = 5
    @Binding var users: [User]
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    private var userCount: Int {
            users.count
    }
    
    private let data = DataStore.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach($users) { $user in
                    NavigationLink {
                        UserInfoView(user: $user)
                    } label: {
                        UserRowView(user: user)
                    }
                }
                .onMove { source, destination in
                    users.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete { source in
                    users.remove(atOffsets: source)
                    updateListSize()
                }
                
            }
            .navigationTitle("Users")
//            .refreshable {
//                users = DataGenerator.getList(of: 5)
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TextField("\(userCount)", value: $listSize, formatter: formatter) {
                        updateList(for: listSize)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            isAddingNewUser.toggle()
                            let newUser = data.newUser
                            users.append(newUser)
                            updateListSize()
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func updateList(for count: Int) {
        users = data.getList(of: count)
    }
    
    private func updateListSize() {
        listSize = userCount
    }
}


struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        let users = DataStore.shared.getList(of: 3)
        UsersListView(users: .constant(users))
    }
}
