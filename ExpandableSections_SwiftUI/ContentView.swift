//
//  ContentView.swift
//  ExpandableSections_SwiftUI
//
//  Created by Josh R on 5/24/21.
//

import SwiftUI

/*
Selected categories are stored in a Set managed with @State. Another option would be
to add a iSelected property on the Category type itself and toggle the bool when selected/deselected.
*/

struct ContentView: View {
    @StateObject private var categoryViewModel = CategoryViewModel()
    @State private var selectedCategories: Set<Category> = []

    var body: some View {
        NavigationView {
            List(categoryViewModel.categories, children: \.sortedSubcategories, rowContent: { row in
                Image(systemName: selectedCategories.contains(row) ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.orange)
                Label(row.name, systemImage: categoryViewModel.icons[row.name] ?? "")
                    .frame(width: UIScreen.main.bounds.width - 90, height: 30, alignment: .leading)
                    .background(Color.init(.systemGray5))   //just to show how far the label stretches
                    .foregroundColor(.blue)
                    .font(.headline)
                    .onTapGesture {
                        if selectedCategories.contains(row) {
                            print("\(row.name) removed")
                            selectedCategories.remove(row)
                        } else {
                            print("\(row.name) added")
                            selectedCategories.insert(row)
                        }
                    }
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
