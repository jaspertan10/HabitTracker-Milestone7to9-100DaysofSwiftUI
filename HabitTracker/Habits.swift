//
//  Habits.swift
//  HabitTracker
//
//  Created by Jasper Tan on 12/6/24.
//

import Foundation


enum HabitCategory: String, CaseIterable, Codable {
    case Health = "Health"
    case Productivity = "Productivity"
    case Learning = "Learning"
    case Personal = "Personal"
}

struct HabitItem: Identifiable, Codable {
    
    var id = UUID()
    
    var name: String
    var description: String
    var category: HabitCategory
    var timesCompleted: Int = 0
}

@Observable
class Habits {
    var items: [HabitItem] {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                
                return
            }
        }
        
        items = []
    }
}
