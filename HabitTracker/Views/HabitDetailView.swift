//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Jasper Tan on 12/8/24.
//

import SwiftUI

struct HabitDetailView: View {
    
    @Binding var habit: HabitItem
    
    @State private var tempHabit: HabitItem = HabitItem(name: "", description: "", category: .Personal)
    
    //Sheet and dismissal
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $tempHabit.name)
                Picker("Category", selection: $tempHabit.category) {
                    ForEach(HabitCategory.allCases, id: \.self) { category in
                        Text("\(category)")
                    }
                }
                TextField("Description", text: $tempHabit.description)
            }
            .navigationTitle("View habit")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                Button("Save") {
                    habit = tempHabit
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
            .onAppear {
                tempHabit = habit
            }

        }
    }
    

}

#Preview {
    @Previewable @State var item = HabitItem(name: "Jog", description: "Jog 5x a week", category: .Health)
    HabitDetailView(habit: $item)
}
