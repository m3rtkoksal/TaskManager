//
//  TaskElement.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI

struct TaskElementView: View {
    var task: TaskElement
    @State var randColor = Color.black
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .frame(height: 100)
            HStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(newColor())
                    .frame(width: 10, height: 80)
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Text(task.title)
                        .font(Font.custom("SFCompactDisplay-Bold", size: 30))
                        .foregroundColor(.black)
                    Text(task.dateTo)
                        .font(Font.custom("SFCompactDisplay", size: 15))
                        .foregroundColor(.gray)
                }
                .fixedSize()
                Spacer()
            }
        }
        .padding(.horizontal, 10)
    }
    
    func newColor() -> Color {
        let rand1 = Double.random(in: 0...255)
        let rand2 = Double.random(in: 0...255)
        let rand3 = Double.random(in: 0...255)
        let randColor = Color( red: rand1/255, green: rand2/255, blue: rand3/255)
        self.randColor = randColor
        return randColor
    }
}

struct TaskElement_Previews: PreviewProvider {
    static var previews: some View {
        TaskElementView(task: TaskElement( dateFrom: "Tuesday, 06 October 2020", dateTo: "Tuesday, 06 October 2020", title: "UI Design", text: "Do not fear failure"))
    }
}
