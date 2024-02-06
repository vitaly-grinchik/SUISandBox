/// User model
import Foundation

struct User: Identifiable {
    
    let id = UUID()
    var firstName: String
    var lastName: String
    let emoji: String
    
    let tintRed = Double.random(in: 0...1)
    let tintGreen = Double.random(in: 0...1)
    let tintBlue = Double.random(in: 0...1)

    var fullName: String {
        firstName + " " + lastName
    }
}
