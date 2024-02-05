/// Data for app
final class DataStore {
    
    enum SpotColor: String, CaseIterable {
        case red, orange, yellow, green, blue, magenta, brown, pink
    }
    
    static let shared = DataStore()    
    
    private let emojiList = ["👻", "🐢", "🧑🏻‍✈️"]
    
    private let lastNames = [
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
    
    private let firstNames = [
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
    
    let newUser = User(
        name: "New User",
        emoji: "♥️",
        spotColor: SpotColor.blue.rawValue
    )
    
    private func getEmoji() -> String {
        emojiList.randomElement() ?? "♥️"
    }
    
    private func getSpotColor() -> String {
        SpotColor.allCases.randomElement()?.rawValue ?? "♥️"
    }
    
    /// Get random list  of users with phantom names
     func getList(of count: Int) -> [User] {
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
    
    private init() {}
    
}