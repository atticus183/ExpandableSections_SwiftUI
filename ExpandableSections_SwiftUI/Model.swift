//
//  Model.swift
//  ExpandableSections_SwiftUI
//
//  Created by Josh R on 5/24/21.
//

import Foundation

struct Category: Identifiable {
    let id = UUID().uuidString
    var name: String
    var subcategories: [Category]?   //this type MUST be the same as the parent

    var sortedSubcategories: [Category]? {
        subcategories?.sorted(by: { $0.name < $1.name })
    }
}
