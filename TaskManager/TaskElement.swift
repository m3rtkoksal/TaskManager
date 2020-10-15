//
//  TaskElement.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI
import FirebaseFirestore

struct TaskElement: Identifiable {
    var id : String = UUID().uuidString
    var dateFrom: String
    var dateTo: String
    var title: String
    var text: String
}


