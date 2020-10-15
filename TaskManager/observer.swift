//
//  observer.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class observer : ObservableObject{
    
    @Published var tasks = [TaskElement]()
    @Published var task: TaskElement
    @Published var modified = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init(task: TaskElement = TaskElement( title: "", dateFrom: "",dateTo: "", text: "")) {
        self.task = task
        
        self.$task
            .dropFirst()
            .sink { [weak self] task in
                self?.modified = true
            }
            .store(in: &self.cancellables)
    }
    
    let db = Firestore.firestore()
    
    func fetchData() {
        
        db.collection("tasks").addSnapshotListener { (querySnapshot, err) in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.tasks = documents.map { (queryDocumentSnapshot)  -> TaskElement in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let dateFrom = data["dateFrom"] as? String ?? ""
                let dateTo = data["dateTo"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                return TaskElement(title: title, dateFrom: dateFrom, dateTo: dateTo, text: text)
            }
        }
    }
}
