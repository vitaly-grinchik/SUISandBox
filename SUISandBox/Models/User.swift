/// User model
import Foundation

struct User: Identifiable {
    
    struct UserColor {
        let red: Double
        let green: Double
        let blue: Double
        
        init(red: Double, green: Double, blue: Double) {
            self.red = Double.random(in: 0...1)
            self.green = Double.random(in: 0...1)
            self.blue = Double.random(in: 0...1)
        }
    }
    
    let id = UUID()
    var firstName: String
    var lastName: String
    let emoji: String
    
    var fullName: String {
        firstName + " " + lastName
    }
}
