//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jasper Tan on 12/6/24.
//

import SwiftUI


struct ContentView: View {
    
    //Habit List
    @State private var habits = Habits()
    
    //Sheets
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($habits.items) { $habits in
                    NavigationLink {
                        HabitDetailView(habit: $habits)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habits.name)
                                Text("\(habits.category)")
                            }
                        }
                        
                    }

                }
                .onDelete { indexSet in
                    removeRows(indexSet: indexSet)
                }
            }
            .navigationTitle("HabitTracker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Add Habit", systemImage: "plus") {
                    showSheet = true
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showSheet) {
                AddHabitItemView(habitList: habits)
            }
        }
    }
    
    
    func removeRows(indexSet: IndexSet) {
        habits.items.remove(atOffsets: indexSet)
    }
}

#Preview {
    ContentView()
}
