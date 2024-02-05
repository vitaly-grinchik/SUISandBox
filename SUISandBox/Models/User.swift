/// User model
import Foundation

struct User: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    let emoji: String
    let spotColor: String
    
    var fullName: String {
        firstName + " " + lastName
    }
}
