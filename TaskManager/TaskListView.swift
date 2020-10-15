//
//  TaskListView.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI

struct TaskListView: View {
    @State private(set) var data = ""
    @State var isSettings: Bool = false
    @State var isSaved: Bool = false
    @State var shown: Bool = false
    @State var selectedTask = TaskElement(title: "", dateFrom: "", dateTo: "", text: "")
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.9333333333, green: 0.9450980392, blue: 0.9882352941, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack {
                    TopBar()
                    HStack {
                        CustomTextField(data: $data, tFtext: "Find task", tFImage: "magnifyingglass")
                        Button(action: {
                            self.isSettings.toggle()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .foregroundColor(Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)))
                                Image("buttonImage")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                            }
                            .padding(.horizontal, 15)
                        })
                    }
                    CustomSegmentedView()
                    ZStack {
                        TaskFrameView()
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button( action: {
                                    self.isSaved.toggle()
                                }, label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7137254902, blue: 0.2196078431, alpha: 1)))
                                        Text("+")
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .fontWeight(.bold)
                                    }
                                    .frame(width: 50, height: 50)
                                    
                                })
                            }
                        }
                        NavigationLink(
                            destination: NewTaskView(isShown: $shown, task: selectedTask),
                            isActive: $shown,
                            label: {
                                Text("")
                            })
                    }
                }
            }
            .navigationBarHidden(true)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct TopBar: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading){
                DateView()
                    .font(Font.custom("SFCompactDisplay", size: 20))
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
                Text("Hi, Random")
                    .font(Font.custom("SFCompactDisplay", size: 20))
            }
            Image(systemName: "ellipsis")
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
