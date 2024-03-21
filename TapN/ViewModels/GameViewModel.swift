import Foundation
import SwiftUI
import Combine
import CoreData

class GameViewModel: ObservableObject {
    @Published var selectedType: String
    @Published var timerString = "00:00:00"
    @Published var gameTiles: [GameTile] = []
    @Published var gameStarted = false
    @Published var gameEnded = false
    @Published var columns: [GridItem] = []
    
    private var context: NSManagedObjectContext
    private var gridSize = 0
    private var correctTapCount = 0
    private var timer: AnyCancellable?
    private var startTime: Date?
    
    init(selectedType: String, context: NSManagedObjectContext){
        self.selectedType = selectedType
        self.context = context
        updateGridColumns(for: selectedType)
        switch selectedType{
        case "1 To 9":
            setupGame(with: 9)
        case "1 To 16":
            setupGame(with: 16)
        case "1 To 25":
            setupGame(with: 25)
        default:
            break
        }
    }
    
    func setupGame(with gridSize: Int) {
        self.gridSize = gridSize
        let numbers = (1...gridSize).shuffled()
        gameTiles = numbers.map { GameTile(number: $0, isHidden: false) }
        correctTapCount = 0
    }
    
    func startGame() {
        gameStarted = true
        startTime = Date()
        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
            .sink { [weak self] _ in
                guard let startTime = self?.startTime else { return }
                let elapsedTime = Date().timeIntervalSince(startTime)
                self?.timerString = self?.formatTimeInterval(elapsedTime) ?? "00:00:00"
            }
    }
    
    func resetGame() {
        gameStarted = false
        timer?.cancel()
        timerString = "00:00:00"
        startTime = nil
        
        gameStarted = false
        correctTapCount = 0
        
        setupGame(with: gridSize)
    }
    
    func stopGame() {
        gameStarted = false
        gameEnded = true
        timer?.cancel()
    }
    
    func updateGridColumns(for type: String) {
        let sideCount: Int
        switch type {
        case "1 To 9":
            sideCount = 3
        case "1 To 16":
            sideCount = 4
        case "1 To 25":
            sideCount = 5
        default:
            sideCount = 0
        }
        self.columns = Array(repeating: .init(.flexible(), spacing: 4*Constants.standardWidth), count: sideCount)
    }
    
    func tapTile(at index: Int) -> Bool {
        guard gameStarted, index < gameTiles.count, !gameTiles[index].isHidden else { return false }
        
        if gameTiles[index].number == correctTapCount + 1 {
            gameTiles[index].isHidden = true
            correctTapCount += 1
            if correctTapCount == gridSize {
                stopGame()
                GameDataManager.shared.saveGameRecord(gameType: selectedType, record: timerString, context: context)
            }
            return true
        }
        return false
    }
    
    func cellSize(for width: CGFloat) -> CGFloat {
        let columns: CGFloat = selectedType == "1 To 9" ? 3 : selectedType == "1 To 16" ? 4 : 5
        return (width - (4 * (columns - 1))) / columns
    }
    
    func formatTimeInterval(_ interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60 % 60
        let seconds = Int(interval) % 60
        let milliseconds = Int(interval.truncatingRemainder(dividingBy: 1) * 100)
        return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
    }
}
