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
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
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
            
            
            ScrollView(.horizontal,showsIndicators : false) {
                HStack(spacing:30) {
                    ForEach(sectionData) { item in
                        SectionView(section: item)
                    }
                }
                .padding(30)
                .padding(.bottom,30)
            }
            
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section : Section
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
        .frame(width: 275, height: 275)
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


