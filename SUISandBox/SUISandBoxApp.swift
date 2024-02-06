//
//  SUISandBoxApp.swift
//  SUISandBox
//
//  Created by Виталий Гринчик on 27.01.24.
//

import SwiftUI

@main
struct SUISandBoxApp: App {
    @State private var users = DataStore.shared.getList(of: 5)
    
    var body: some Scene {
        WindowGroup {
            UsersListView(users: $users)
        }
    }
}
