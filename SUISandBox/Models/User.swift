/// User model
struct User: Identifiable {
    let id = UUID()
    var name: String
    let emoji: String
    let spotColor: String
}
