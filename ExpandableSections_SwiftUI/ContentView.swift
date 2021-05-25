//
//  ContentView.swift
//  ExpandableSections_SwiftUI
//
//  Created by Josh R on 5/24/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var categoryViewModel = CategoryViewModel()

    var body: some View {
        NavigationView {
            List(categoryViewModel.categories, children: \.sortedSubcategories, rowContent: { row in
                Label(row.name, systemImage: categoryViewModel.icons[row.name] ?? "")
                    .font(.headline)
                    .accentColor(.orange)
            })
            .toolbar(content: {
                Button(action: {
                    let randomIndex = Int.random(in: 0...2)
                    categoryViewModel.categories[randomIndex].subcategories?.append(Category(name: "NEW"))
                }, label: {
                    Image(systemName: "plus")
                })
            })
            .navigationTitle("Categories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
