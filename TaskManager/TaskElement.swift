//
//  TaskElement.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI
import FirebaseFirestore

class TaskElement: ObservableObject, Identifiable {
    var id : String = UUID().uuidString
    var dateFrom: String
    var dateTo: String
    var title: String
    var text: String
    
    init(title: String, dateFrom: String, dateTo: String, text: String) {
        self.title = title
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.text = text
    }
}


