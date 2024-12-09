//
//  AddHabitItemView.swift
//  HabitTracker
//
//  Created by Jasper Tan on 12/6/24.
//

import SwiftUI

struct AddHabitItemView: View {
    
    //Habit list class instance
    var habitList: Habits
    
    // Input Habit Items
    @State private var name = ""
    @State private var description = ""
    @State private var category: HabitCategory = .Personal
    
    //Sheet and dismissal
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Category", selection: $category) {
                    ForEach(HabitCategory.allCases, id: \.self) { category in
                        Text("\(category)")
                    }
                }
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    addExpense()
                    dismiss()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }
            }
        }
    }
    
    func addExpense() {
        habitList.items.append(HabitItem(name: name, description: description, category: category))
    }
}

#Preview {
    AddHabitItemView(habitList: Habits())
}
