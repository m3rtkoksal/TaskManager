//
//  CustomSegmentedView.swift
//  TaskManager
//
//  Created by Mert Köksal on 13.10.2020.
//

import SwiftUI

struct CustomSegmentedView: View {
    @State var menu = 0
    var body: some View {
        HStack(spacing: 15) {
            
            Button(action: {
                
                self.menu = 0
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(self.menu == 0 ? Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)) : Color.white)
                    VStack {
                        Text("18")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 30))
                        Text("Active")
                    }
                }
                .frame(width: 70, height: 70)
                .foregroundColor(self.menu == 0 ? .white : .gray)
                .padding(.vertical, 25)
                .padding(.horizontal, 20)
                
            }
            .background(self.menu == 0 ? Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            Button(action: {
                
                self.menu = 1
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(self.menu == 1 ? Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)) : Color.white)
                    VStack {
                        Text("13")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 30))
                        Text("Ongoing")
                    }
                }
                .frame(width: 70, height: 70)
                .foregroundColor(self.menu == 1 ? .white : .gray)
                .padding(.vertical, 25)
                .padding(.horizontal, 20)
                
            }
            .background(self.menu == 1 ? Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Button(action: {
                
                self.menu = 2
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(self.menu == 2 ? Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)) : Color.white)
                VStack{
                    Text("5")
                        .font(Font.custom("SFCompactDisplay-Bold", size: 30))
                    Text("Done")
                }
                }
                .frame(width: 70, height: 70)
                .foregroundColor(self.menu == 2 ? .white : .gray)
                .padding(.vertical, 25)
                .padding(.horizontal, 20)
                
            }
            .background(self.menu == 2 ? Color(#colorLiteral(red: 0.4274509804, green: 0.2196078431, blue: 1, alpha: 1)) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
    }
}


struct CustomSegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSegmentedView()
    }
}
