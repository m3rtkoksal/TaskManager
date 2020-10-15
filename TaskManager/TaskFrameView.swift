//
//  TaskFrameView.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI

struct TaskFrameView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Today task")
                .padding()
            ScrollViewTask()
        }
    }
}

struct ScrollViewTask: View {
    @ObservedObject private var obser = observer()
    @State var selectedTask = TaskElement(dateFrom: "", dateTo: "", title: "", text: "")
    @State var shown: Bool = false
    var body: some View {
        ZStack {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(self.obser.tasks) { task in
                            TaskElementView(task:task)
                                .onTapGesture {
                                    self.selectedTask = task
                                    self.shown.toggle()
                                }
                        }
                    }
                }
                .onAppear {
                    self.obser.fetchData()
                }
            
            NewTaskView(isShown: $shown, task: selectedTask)
        }
    }
    
    
    struct TaskFrameView_Previews: PreviewProvider {
        static var previews: some View {
            TaskFrameView()
        }
    }
}
