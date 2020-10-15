//
//  Date.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI


struct DateView: View {
    
    func getDate() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        let dateTime = formatter.string(from: now)
        print(dateTime)
        return dateTime
    }
    var body: some View {
        ZStack {
        Text(getDate())
        }
    }
}

struct Date_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
