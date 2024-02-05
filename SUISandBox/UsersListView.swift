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
    
    static let lastNames = [
        "Smith",
        "Johnson",
        "Williams",
        "Jones",
        "Brown",
        "Davis",
        "Miller",
        "Wilson",
        "Moore",
        "Taylor",
        "Anderson",
        "Thomas",
        "Jackson",
        "White",
        "Harris",
        "Martin",
        "Thompson",
        "Garcia",
        "Martinez",
        "Robinson",
        "Clark",
        "Rodriguez",
        "Lewis",
        "Lee",
        "Walker",
        "Hall",
        "Allen",
        "Young",
        "Hernandez",
        "King",
        "Wright",
        "Lopez",
        "Hill",
        "Scott",
        "Green",
        "Adams",
        "Baker",
        "Gonzalez",
        "Nelson",
        "Carter",
        "Mitchell",
        "Perez",
        "Roberts",
        "Turner",
        "Phillips",
        "Campbell",
        "Parker",
        "Evans",
        "Edwards",
        "Collins",
        "Stewart",
        "Sanchez",
        "Morris",
        "Rogers",
        "Reed",
        "Cook",
        "Morgan",
        "Bell",
        "Murphy",
        "Bailey",
        "Rivera",
        "Cooper",
        "Richardson",
        "Cox",
        "Howard",
        "Ward",
        "Torres",
        "Peterson",
        "Gray",
        "Ramirez",
        "James",
        "Watson",
        "Brooks",
        "Kelly",
        "Sanders",
        "Price",
        "Bennett",
        "Wood",
        "Barnes",
        "Ross",
        "Henderson",
        "Coleman",
        "Jenkins",
        "Perry",
        "Powell",
        "Long",
        "Patterson",
        "Hughes",
        "Flores",
        "Washington",
        "Butler",
        "Simmons",
        "Foster",
        "Gonzales",
        "Bryant",
        "Alexander",
        "Russell",
        "Griffin",
        "Diaz",
        "Hayes"
    ]
    
    static let firstNames = [
        "James",
        "Robert",
        "John",
        "Michael",
        "David",
        "William",
        "Richard",
        "Joseph",
        "Thomas",
        "Christopher",
        "Charles",
        "Daniel",
        "Matthew",
        "Anthony",
        "Mark",
        "Donald",
        "Steven",
        "Andrew",
        "Paul",
        "Joshua",
        "Kenneth",
        "Kevin",
        "Brian",
        "George",
        "Timothy",
        "Ronald",
        "Jason",
        "Edward",
        "Jeffrey",
        "Ryan",
        "Jacob",
        "Gary",
        "Nicholas",
        "Eric",
        "Jonathan",
        "Stephen",
        "Larry",
        "Justin",
        "Scott",
        "Brandon",
        "Benjamin",
        "Samuel",
        "Gregory",
        "Alexander",
        "Patrick",
        "Frank",
        "Raymond",
        "Jack",
        "Dennis",
        "Jerry",
        "Tyler",
        "Aaron",
        "Jose",
        "Adam",
        "Nathan",
        "Henry",
        "Zachary",
        "Douglas",
        "Peter",
        "Kyle",
        "Noah",
        "Ethan",
        "Jeremy",
        "Walter",
        "Christian",
        "Keith",
        "Roger",
        "Terry",
        "Austin",
        "Sean",
        "Gerald",
        "Carl",
        "Harold",
        "Dylan",
        "Arthur",
        "Lawrence",
        "Jordan",
        "Jesse",
        "Bryan",
        "Billy",
        "Bruce",
        "Gabriel",
        "Joe",
        "Logan",
        "Alan",
        "Juan",
        "Albert",
        "Willie",
        "Elijah",
        "Wayne",
        "Randy",
        "Vincent",
        "Mary",
        "Patricia",
        "Jennifer",
        "Linda",
        "Elizabeth",
        "Barbara",
        "Susan",
        "Jessica",
        "Sarah",
        "Karen",
        "Lisa",
        "Nancy",
        "Betty",
        "Sandra",
        "Margaret",
        "Ashley",
        "Kimberly",
        "Emily",
        "Donna",
        "Michelle",
        "Carol",
        "Amanda",
        "Melissa",
        "Deborah",
        "Stephanie",
        "Dorothy",
        "Rebecca",
        "Sharon",
        "Laura",
        "Cynthia",
        "Amy",
        "Kathleen",
        "Angela",
        "Shirley",
        "Brenda",
        "Emma",
        "Anna",
        "Pamela",
        "Nicole",
        "Samantha",
        "Katherine",
        "Christine",
        "Helen",
        "Debra",
        "Rachel",
        "Carolyn",
        "Janet",
        "Maria",
        "Catherine",
        "Heather",
        "Diane",
        "Olivia",
        "Julie",
        "Joyce",
        "Victoria",
        "Ruth",
        "Virginia",
        "Lauren",
        "Kelly",
        "Christina",
        "Joan",
        "Evelyn",
        "Judith",
        "Andrea",
        "Hannah",
        "Megan",
        "Cheryl",
        "Jacqueline",
        "Martha",
        "Madison",
        "Teresa",
        "Gloria",
        "Sara",
        "Janice",
        "Ann",
        "Kathryn",
        "Abigail",
        "Sophia",
        "Frances",
        "Jean",
        "Alice",
        "Judy",
        "Isabella",
        "Julia",
        "Grace",
        "Amber",
        "Denise",
        "Danielle",
        "Marilyn",
        "Beverly",
        "Charlotte",
        "Natalie"
    ]
    
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
