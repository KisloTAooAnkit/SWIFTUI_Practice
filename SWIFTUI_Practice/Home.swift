//
//  Home.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 04/07/21.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    Spacer()
                    Button(action: {self.showProfile.toggle()}) {
                        Image("ANKIT")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36, alignment: .center)
                            .clipShape(Circle())
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                
                Spacer()
            }
            .padding(.top,44)
            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0.0, y: 20)
            .offset(x: 0, y: showProfile ? -450 : 0)
            
            .rotation3DEffect(
                Angle(degrees: showProfile ? -10 : 0),
                axis: (x: 1, y: 0.0, z: 0.0)
            )
            .scaleEffect(showProfile ? 0.9 : 1)
        
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(x: 0, y: showProfile ? 0 : 1000)
                .offset(x: 0, y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                        })
                        .onEnded({ value in
                            
                            if self.viewState.height > 50
                            {
                                self.showProfile = false
                            }
                            self.viewState = .zero
                        })
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
