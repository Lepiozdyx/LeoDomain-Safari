import SwiftData
import Foundation

@Model
class ExcursionModel {
    var id = UUID()
    var name: String
    var location: String
    var date: Date
    var notes: String?
    var thingsToBring: String?
    
    init(id: UUID = UUID(), name: String, location: String, date: Date, notes: String? = nil, thingsToBring: String? = nil) {
        self.id = id
        self.name = name
        self.location = location
        self.date = date
        self.notes = notes
        self.thingsToBring = thingsToBring
    }
}
