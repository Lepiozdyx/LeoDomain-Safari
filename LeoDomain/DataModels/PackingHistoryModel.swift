import SwiftData
import Foundation

@Model
class PackingHistoryModel {
    var id = UUID()
    var date: Date
    var didComplete: Bool
    var pickedItems: Int
    
    init(id: UUID = UUID(), date: Date, didComplete: Bool, pickedItems: Int) {
        self.id = id
        self.date = date
        self.didComplete = didComplete
        self.pickedItems = pickedItems
    }
}
