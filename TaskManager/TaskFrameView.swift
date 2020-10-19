//
//  TaskFrameView.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI

struct TaskFrameView: View {
    @ObservedObject private var obser = observer()
    var body: some View {
        VStack(alignment: .leading){
            Text("Today task")
                .padding()
            ScrollViewTask()
        }
    }
}

struct ScrollViewTask: View {
    @EnvironmentObject var selectedTask : SelectedTask
    @State var shown: Bool = false
    @ObservedObject private var obser = observer()
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                ForEach(self.obser.tasks) { task in
                    TaskElementView(task:task)
                        .onTapGesture {
                            self.selectedTask.appendNewTask(task: task)
                        }
                }
            }
        }
        .onAppear {
            self.obser.fetchData()
        }
        .fullScreenCover(isPresented: $shown, content: {
            NewTaskView(isShown: $shown)
                .environmentObject(selectedTask)
        })
    }
}


struct TaskFrameView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFrameView()
    }
}

