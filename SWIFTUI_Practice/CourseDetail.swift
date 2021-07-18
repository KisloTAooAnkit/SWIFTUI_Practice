//
//  CourseDetail.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 17/07/21.
//

import SwiftUI

struct CourseDetail: View {
    var course : Course
    @Binding var show : Bool
    @Binding var active : Bool
    @Binding var activeIndex : Int
    var body: some View {
        
        ScrollView {
            VStack {
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

                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16,weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height: 36, alignment: .center)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }

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
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("After typing in the commands to LaTeX (which are the instructions preceded by the backslash character)")
                    
                    Text("About this Course")
                        .font(.title)
                        .bold()
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    
                    Text("Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It's not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader,")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], show: .constant(true),active: .constant(true),activeIndex: .constant(-1))
    }
}
