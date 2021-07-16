//
//  ContentView.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showcard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showcard ? 0.4 : 1)
                .offset(y : showcard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                )
            
            BackCardView()
                //.frame(width: showcard ? 300 : 340, height: 220, alignment: .center)
                .frame(width: 300, height: 220, alignment: .center)
                .background(show ? Color("card3") :  Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y: show ? -400: -40)
                .offset(x:viewState.width,y:viewState.height)
                .offset(y: showcard ? -180 : 0)
                .scaleEffect( showcard ? 1 :0.9)
                .rotationEffect(Angle(degrees: show ? 0:10))
                .rotationEffect(Angle(degrees: showcard ? -10:0))
                
                .rotation3DEffect(
                    Angle(degrees: showcard ? 0 : 10),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            BackCardView()
                //.frame(width: showcard ? 300 : 340, height: 220, alignment: .center)
                .frame(width:  300, height: 220, alignment: .center)
                .background(show ? Color("card4") :  Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:show ? -200 :-20)
                .offset(x:viewState.width,y:viewState.height)
                .offset(y: showcard ? -140 : 0)
                .scaleEffect( showcard ? 1 :0.95)
                .rotationEffect(Angle(degrees: show ? 0: 5))
                .rotationEffect(Angle(degrees: showcard ? -5:0))
                .rotation3DEffect(
                    Angle(degrees: showcard ? 0 : 5),
                    axis: (x: 10.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            
            CardView()
                //.frame(width: showcard ? 375 : 340, height: 220, alignment: .center)
                .frame(width: 340, height: 220, alignment: .center)
                .background(Color.black)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:viewState.width,y:viewState.height)
                .offset(y : showcard ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showcard.toggle()
                }
                .gesture(
                    DragGesture().onChanged({ Value in
                        self.viewState = Value.translation
                        self.show = true
                    })
                    .onEnded({ value in
                        self.viewState = .zero
                        self.show = false
                    })
                )
//          0
            
            BottomCardView(show: $showcard)
                .offset(x:0,y: showcard ? 400 : 1000)
                .offset(y : bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.easeInOut)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.bottomState = value.translation
                            if self.showFull
                            {
                                self.bottomState.height += -300
                            }
                            if self.bottomState.height < -300
                            {
                                self.bottomState.height = -300
                            }
                            
                        })
                        .onEnded({ value in
                            if self.bottomState.height > 50
                            {
                                self.showcard = false
                            }
                            if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && showFull)
                            {
                                self.bottomState.height = -300
                                self.showFull = true
                            }
                            else
                            {
                                self.bottomState = .zero
                            }
                        })
                )
            
            
            
            
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .foregroundColor((Color("accent")))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal , 20)
            .padding(.top,20)
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            
        }
        
        
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    
    @Binding var show : Bool
    
    var body: some View {
        VStack(spacing:20){
            Rectangle()
                .frame(width: 40, height: 5, alignment: .center)
                .cornerRadius(3)
                .opacity(0.1)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            HStack(spacing: 20.0) {
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 88, height: 88, percent: 78, showProgress: $show)
                    .animation(Animation.easeInOut.delay(0.3))
                
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    Text("12 of 12 section completed\n 10 hours spent so far ")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10)
            }
                
            
            Spacer()
        }
        .padding(.top,8)
        .padding(.horizontal,20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
