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
    @State var showContent = false
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile: $showProfile, showContent: $showContent)
                .padding(.top,44)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color("background2"), Color.white]), startPoint: .top, endPoint: .bottom)
                            .frame(height:200)
                        Spacer()
                    }
                    .background(Color.white)
                )
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
                .offset(x: 0, y: showProfile ? 0 : screen.height)
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
            
            if showContent {
                Color.white.edgesIgnoringSafeArea(.all)
                ContentView()
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .onTapGesture {
                    self.showContent = false
                }
            }
            

            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile : Bool
    var body: some View {
        Button(action: {self.showProfile.toggle()}) {
            Image("ANKIT")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36, alignment: .center)
                .clipShape(Circle())
        }
    }
}


let screen = UIScreen.main.bounds
