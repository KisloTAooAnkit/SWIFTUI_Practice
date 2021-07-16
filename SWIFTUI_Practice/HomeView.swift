//
//  HomeView.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 06/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile : Bool
    @State var showUpdate = false
    @Binding var showContent : Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
    //                    .font(.system(size: 28, weight: .bold))
                        .modifier(CustomFontModifier(size: 28))
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: {self.showUpdate.toggle()}) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36, alignment: .center)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 10
                            )
                    }
                    .sheet(isPresented: $showUpdate, content: {
                        UpdateList()
                    })

                }
                .padding(.horizontal) // by default 16 padding
                .padding(.leading,14) // to allign with card start below 14 + 16 = 30
                .padding(.top,30)
                
                ScrollView(.horizontal,showsIndicators :false) {
                    WatchRingsView()
                        .padding(.horizontal,30)
                        .padding(.bottom,30)
                        .onTapGesture {
                            self.showContent = true
                        }
                }
                
                
                ScrollView(.horizontal,showsIndicators : false) {
                    HStack(spacing:30) {
                        ForEach(sectionData) { item in
                            SectionView(section: item)
                        }
                    }
                    .padding(30)
                    .padding(.bottom,30)
                }
                .offset(y: -30)
                
                
                HStack {
                    Text("Courses")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading,30)
                .offset(y:-60)
                
                
                SectionView(section: sectionData[2],width: screen.width-60,height: 275)
                    .offset(y:-60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section : Section
    
    var width : CGFloat = 275
    var height : CGFloat = 275
    
    
    var body: some View {
        VStack {
            HStack(alignment:.top) {
                Text(section.title)
                    .font(.system(size: 24,weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            Text(section.text.uppercased())
                .frame(maxWidth:.infinity,alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:210)
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.5), radius: 20, x: 0, y: 20)
    }
}


struct Section : Identifiable
{
    var id = UUID()
    var title : String
    var text : String
    var logo : String
    var image : Image
    var color : Color
}


let sectionData = [
    Section(title: "Prototype Designs in SwiftUI",
            text: "18 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Card4")),
            color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))

    ),
    Section(title: "Prototype Designs in SwiftUI",
            text: "18 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Card1")),
            color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))

    ),
    Section(title: "Prototype Designs in SwiftUI",
            text: "18 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Card2")),
            color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))

    ),
    Section(title: "Prototype Designs in SwiftUI",
            text: "18 sections",
            logo: "Logo1",
            image: Image(uiImage: #imageLiteral(resourceName: "Card5")),
            color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))

    )
]



struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), width: 44, height: 44, percent: 68, showProgress: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left")
                        .modifier(FontModifier(style: .headline))
                    Text("Watched 10 minutes today")
                        .modifier(FontModifier(style: .caption))
                }
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), color2: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), width: 32, height: 32, percent: 24, showProgress: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            
            HStack(spacing: 12.0) {
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), width: 32, height: 32, percent: 72, showProgress: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
        }
    }
}
