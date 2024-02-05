/// User model
import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    let emoji: String
    let spotColor: String
}
