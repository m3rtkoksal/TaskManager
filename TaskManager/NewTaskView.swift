//
//  NewTaskView.swift
//  TaskManager
//
//  Created by Mert Köksal on 14.10.2020.
//

import SwiftUI
import Combine
import FirebaseFirestore

struct NewTaskView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var obser = observer()
    @State var taskTitle = ""
    @State var taskFrom = ""
    @State var taskFromDate = Date()
    @State var taskToDate = Date()
    @State var taskTo = ""
    @State var taskNote = ""
    @EnvironmentObject var task: SelectedTask
    var body: some View {
        NavigationView {
        VStack(alignment: .leading) {
            Group {
                Text("Task Title")
                TextField("Title", text:$taskTitle)
                Divider()
                Text("From")
                DatePicker("", selection: $taskFromDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .labelsHidden()
                .onReceive(Just(taskFromDate)) { data in
                        taskFrom = getDate(date: taskFromDate)
                }
                Divider()
            } .padding(.horizontal, 10)
            .font(Font.custom("SFCompactDisplay-Bold", size: 25))
            .foregroundColor(.gray)
            Group {
                Text("To")
                DatePicker("", selection: $taskToDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .labelsHidden()
                .onReceive(Just(taskToDate)) { data in
                        taskTo = getDate(date: taskToDate)
                }
                Divider()
                Text("Note")
                TextField("Note", text:$taskNote)
            }.padding(.horizontal, 10)
            .font(Font.custom("SFCompactDisplay-Bold", size: 25))
            .foregroundColor(.gray)
            
            Button(action: {
                let taskDictionary = [
                    "title" : self.taskTitle,
                    "dateTo": self.taskTo,
                    "dateFrom" : self.taskFrom,
                    "text": self.taskNote
                ]
                let docRef = Firestore.firestore().document("tasks/\(UUID().uuidString)")
                docRef.setData(taskDictionary) { (error) in
                    if let error = error {
                        print("error = \(error)")
                    } else {
                        print("success")
                        self.taskTitle = ""
                        self.taskNote = ""
                    }
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)))
                    Text("Create task")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 10)
                .frame(width: UIScreen.main.bounds.width - 20, height: 90)
            })
        }
    }
        
        .navigationBarTitle("Create a task")
            .font(Font.custom("SFCompactDisplay-Bold", size: 30))
    }
}



func getDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    formatter.timeStyle = .short
    let dateTime = formatter.string(from: date)
    return dateTime
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}

