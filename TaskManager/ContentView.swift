//
//  ContentView.swift
//  TaskManager
//
//  Created by Mert Köksal on 12.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State var nextPage: Bool = false
    var body: some View {
        NavigationView {
        ZStack {
            Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack {
                Image("bgImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hi, Freelancer")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 50))
                            .foregroundColor(.white)
                            
                        Text("Finish your work")
                            .font(Font.custom("SFCompactDisplay", size: 20))
                            .foregroundColor(.white)
                            
                    }
                    .padding()
                    Spacer()
                }
                Button( action: {
                    self.nextPage.toggle()
                }, label: {
                    ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7137254902, blue: 0.2196078431, alpha: 1)))
                    Text("Get started now")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                NavigationLink(
                    destination: TaskListView(),
                    isActive: $nextPage,
                    label: {
                        Text("")
                    })
                Text("Do you have an account? Login")
                    .foregroundColor(.white)
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
