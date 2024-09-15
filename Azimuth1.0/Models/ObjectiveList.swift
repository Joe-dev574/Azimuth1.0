//
//  Objective.swift
//  Azimuth1.0
//
//  Created by Joseph DeWeese on 9/15/24.
//

import SwiftUI
import SwiftData

@Model
final class ObjectiveList {
    var title: String
    var remark:  String
    var dateAdded: Date
    var dateStarted: Date
    var dateCompleted: Date
    var priority: Int?
    var status: Status.RawValue
    var isCompleted = false
    @Relationship(deleteRule: .cascade) var objective = [Objective]()
    
    init(
        title: String,
        remark: String,
        dateAdded: Date = Date.now,
        dateStarted: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        priority: Int? = nil,
        status: Status = .active,
        objective: [Objective] = [Objective](),
        isCompleted: Bool = false
    ) {
        self.title = title
        self.remark = remark
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.priority = priority
        self.status = status.rawValue
        self.objective = objective
        self.isCompleted = isCompleted
    }
    
    
    
    var icon: Image {
        switch Status(rawValue: status)! {
        case .planning:
            Image(systemName: "calendar.badge.clock")
        case .active:
            Image(systemName: "hourglass.circle")
        case .completed:
            Image(systemName: "checkmark.seal")
        case .hold:
            Image(systemName: "exclamationmark.circle")
        }
    }
}
///TODO:  create custom icons for icon
enum Status: Int, Codable, Identifiable, CaseIterable {
    case planning,active, completed, hold
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .planning:
            "Plan"
        case .active:
            "Active"
        case .completed:
            "Complete"
        case .hold:
            "Hold"
        }
    }
}
    


