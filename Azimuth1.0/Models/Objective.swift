//
//  ObjectiveList.swift
//  Azimuth1.0
//
//  Created by Joseph DeWeese on 9/15/24.
//

import SwiftUI
import SwiftData

@Model
final class Objective {
    var name: String
    var briefDescription: String
    var iconName: String
    var isCompleted = false
    
    init(
        name: String,
        briefDescription: String,
        iconName: String,
        isCompleted: Bool = false
    ) {
        self.name = name
        self.briefDescription = briefDescription
        self.iconName = iconName
        self.isCompleted = isCompleted
    }
}
