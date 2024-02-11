//
//  UsersListView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UsersListView: View {
    @State private var isAddingNewUser = false
    @State private var selection = Set<UUID>()
    @State private var listSize = "5"
    @Binding var users: [User]
    
    private let data = DataStore.shared
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
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
                }
                
            }
            .navigationTitle("Users")
//            .refreshable {
//                users = DataGenerator.getList(of: 5)
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TextField("Count", text: $listSize)
                        .textFieldStyle(.roundedBorder)
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
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onChange(of: listSize) { newValue in
                updateList()
            }
        }
//        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func updateList() {
        users = data.getList(of: Int(listSize) ?? 1)
    }
}


struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView(users: .constant([DataStore.shared.newUser]))
    }
}
