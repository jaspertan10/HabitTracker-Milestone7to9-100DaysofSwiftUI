//
//  Habits.swift
//  HabitTracker
//
//  Created by Jasper Tan on 12/6/24.
//

import Foundation


enum HabitCategory: String, CaseIterable {
    case Health = "Health"
    case Productivity = "Productivity"
    case Learning = "Learning"
    case Personal = "Personal"
}

struct HabitItem: Identifiable {
    
    var id = UUID()
    
    var name: String
    var description: String
    var category: HabitCategory
}

@Observable
class Habits {
    var items: [HabitItem]
    
    init() {
        items = []
    }
}
