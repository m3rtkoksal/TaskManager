//
//  TaskElement.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI

class TaskElement: ObservableObject, Identifiable {
    var id : String = UUID().uuidString
    var dateFrom: String
    var dateTo: String
    var title: String
    var text: String
    
    var item = [TaskElement]()
    init(title: String, dateFrom: String, dateTo: String, text: String) {
        self.title = title
        self.dateFrom = dateFrom
        self.dateTo = dateTo
        self.text = text
    }
}

class SelectedTask: ObservableObject {
    @Published var item = [TaskElement]()
    
    func appendNewTask(task: TaskElement) {
        item.append(TaskElement(title: task.title, dateFrom: task.dateFrom , dateTo: task.dateTo , text: task.text))
    }
}


