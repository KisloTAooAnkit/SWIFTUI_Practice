//
//  CourseList.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 13/07/21.
//

import SwiftUI

struct CourseList: View {

    
    @State var courses = courseData
    
    var body: some View {
        ScrollView {
            VStack(spacing:30) {

                ForEach(courses.indices,id : \.self) { index in
                    let temp = courses[index].show
                    GeometryReader { geometry in
                        let tempB = $courses[index].show
                        
                        CourseView(show: tempB, course: courses[index])
                            .offset(y: temp ? -geometry.frame(in: .global).minY:0)
                    }
                    .frame(height: temp ? screen.height : 280)
                    .frame(maxWidth: temp ? .infinity : screen.width - 60)
                }
                
            }
            .frame(width : screen.width)
        }
        
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    
    @Binding var show : Bool
    
    var course : Course
    
    var body: some View {
        ZStack(alignment:.top) {
            
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("After typing in the commands to LaTeX (which are the instructions preceded by the backslash character)")
                
                Text("About this Course")
                    .font(.title)
                    .bold()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                
                Text("Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. ???It's not Latin, though it looks like it, and it actually says nothing,??? Before & After magazine answered a curious reader,")
            }
            .padding(30)
            .frame(
                maxWidth : show ? .infinity : screen.width-60 ,
                maxHeight : show ? .infinity : 280,alignment : .top
            )
            .offset(y : show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius :30 , style : .continuous))
            .shadow(color:.black.opacity(0.2),radius : 20 , x:0 , y:20)
            .opacity(show ? 1 : 0)
            
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24,weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(.white.opacity(0.7))
                        
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16,weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36, alignment: .center)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                
                Spacer()
                
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:.infinity)
                    .frame(height:140,alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top , show ? 30 :0)
    //        .frame(width: show ? screen.width : screen.width-60, height: show ? screen.height: 280, alignment: .center)
            .frame(
                maxWidth : show ? .infinity : screen.width-60,
                maxHeight: show ? 460 : 280
            )
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30,style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0.0, y: 20)
           
            .onTapGesture {
                self.show.toggle()
                
            }
            
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}


struct Course : Identifiable
{
    var id  = UUID()
    var title : String
    var subtitle : String
    var image : UIImage
    var logo : UIImage
    var color : UIColor
    var show : Bool
}


var courseData = [
        
    Course(title: "Prototype Design in SwiftUI", subtitle: "18 sections", image: #imageLiteral(resourceName: "Card1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 sections", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "20 sections", image: #imageLiteral(resourceName: "Card2"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)


]


