import SwiftData

final class AppDataContainer {
    static let shared = AppDataContainer()
    let container: ModelContainer

    private init() {
        do {
            self.container = try ModelContainer(
                for:
                    ExcursionModel.self,
                    PackingHistoryModel.self
            )
        } catch {
            fatalError("Не удалось создать ModelContainer: \(error)")
        }
    }
}
