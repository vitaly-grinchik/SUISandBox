//
//  UsersListView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UsersListView: View {
    @State private var users = DataStore.shared.getList(of: 7)
    @State private var isNewUserAdded = false
    @State private var selection = Set<UUID>()
    
    private let data = DataStore.shared
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach($users) { $user in
                    NavigationLink {
                        UserInfoView(user: $user.name)
                    } label: {
                        Label(user.name, systemImage: "person")
                    }
                }
                .onMove { source, destination in
                    users.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete { source in
                    users.remove(atOffsets: source)
                }
                
//                if !selection.isEmpty {
//                    Section(header: Text("Selected:")) {
//                        List(<#T##data: RandomAccessCollection##RandomAccessCollection#>, rowContent: <#T##(Identifiable) -> View#>)
//                    }
//                }
                
            }
            .navigationTitle("Users")
//            .refreshable {
//                users = DataGenerator.getList(of: 5)
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        users = data.getList(of: 5)
                    } label: {
                        Image(systemName: "repeat")
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            isNewUserAdded.toggle()
                            let newUser = data.newUser
                            users.append(newUser)
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
//        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
