//
//  AddItem.swift
//  SplitUp
//
//  Created by Naveen Boopathi on 27/02/24.
//

import SwiftUI

struct AddItem: View {
    @State private var name = ""
    @State private var noOfPersons: Int = 2
    @State private var personNames: [String] = ["", ""]
    var body: some View {
        List {
            Section(header: Text("Add Expense Details")) {
                HStack {
                    Text("Name")
                    Spacer()
                    TextField("Name", text: $name)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                Picker("No Of Persons", selection: $noOfPersons) {
                    ForEach (1..<11) { i in
                        Text("\(i)").tag(i)
                    }
                }.onChange(of: noOfPersons) { oldValue, newValue in
                    personNames = []
                    for i in 0..<newValue {
                        personNames.append("")
                    }
                }
            }
            Section(header: Text("Person Details")) {
                ForEach(Array(personNames.enumerated()), id: \.offset) { index, personName in
                    HStack {
                        Text("Person \(index + 1)")
                        Spacer()
                        TextField("Add Person Name", text: $personNames[index])
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            
            
        }
        .padding()
    }
}

#Preview {
    AddItem()
}
