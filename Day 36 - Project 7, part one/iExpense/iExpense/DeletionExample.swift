//
//  DeletionExample.swift
//  iExpense
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct DeletionExample: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }

                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarTitle("Delete Example")
            .navigationBarItems(trailing: EditButton())
        }
    }

    func removeRows(_ offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeletionExample_Previews: PreviewProvider {
    static var previews: some View {
        DeletionExample()
    }
}
