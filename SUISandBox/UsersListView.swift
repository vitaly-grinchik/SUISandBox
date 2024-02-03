//
//  UsersListView.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

struct UsersListView: View {
    @State private var users = DataGenerator.getList(of: 7)
    @State private var isNewUserAdded = false
    @State private var selection = Set<UUID>()
    
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
                        users = DataGenerator.getList(of: 6)
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
                            let newUser = DataGenerator.newUser
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

/// Data for app
struct DataStore {
    
    enum SpotColor: String, CaseIterable {
        case red, orange, yellow, green, blue, magenta, brown, pink
    }
    
    static let emojiList = ["👻", "🐢", "🧑🏻‍✈️"]
    
    static let names = [""]
    
    static let surnames = [""]
    
}

/// User model
struct User: Identifiable {
    let id = UUID()
    var name: String
    let emoji: String
    let spotColor: String
}

struct DataGenerator {

    static let newUser = User(
        name: "New User",
        emoji: "♥️",
        spotColor: DataStore.SpotColor.blue.rawValue
    )
    
    static func getEmoji() -> String {
        DataStore.emojiList.randomElement() ?? "♥️"
    }
    
    static func getSpotColor() -> String {
        DataStore.SpotColor.allCases.randomElement()?.rawValue ?? "♥️"
    }
    
    /// Get random list  of users with phantom names
    static func getList(of count: Int) -> [User] {
        var list = [User]()
        var name = ""
        let alphabeth = "abcdefghjiklmnopqrstvuwxyz"
        
        (1...count).forEach { _ in
            (1...Int.random(in: 3...10)).forEach { _ in
                if let char = alphabeth.randomElement() {
                    name.append(char)
                }
            }
            list.append(User(
                name: name,
                emoji: getEmoji(),
                spotColor: getSpotColor()
            ))
            name = ""
        }
        
        return list
    }
    
}
