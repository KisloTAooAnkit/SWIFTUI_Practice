//
//  MenuView.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 04/07/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing:16) {
                Text("Ankit - 29% Complete")
                    .font(.caption)
                Color.white
                    .frame(width: 38, height: 6, alignment: .center)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24, alignment: .center)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1))
                    .cornerRadius(12)
                    
                MenuRow(title: "Account", icon: "gear")
                MenuRow(title: "Billing", icon: "creditcard")
                MenuRow(title: "Sign out", icon: "person.crop.circle")
            }
            .frame(maxWidth : .infinity)
            .frame(height:300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0.0, y: 20)
            .padding(.horizontal,30)
            .overlay(
                Image("ANKIT")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                    .offset(x: 0, y: -150)
            )
            
        }
        .padding(.bottom,30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    
    var title : String
    var icon : String
    
    var body: some View {
        HStack(spacing:16){
            Image(systemName: icon)
                .font(.system(size: 20, weight: .bold))
                .imageScale(.large)
                .frame(width: 32, height: 32, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
