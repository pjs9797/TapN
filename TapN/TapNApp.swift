import SwiftUI

@main
struct TapNApp: App {
    let gameDataManager = GameDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, gameDataManager.container.viewContext)
        }
    }
}
