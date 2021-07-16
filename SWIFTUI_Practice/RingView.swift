//
//  RingView.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 10/07/21.
//

import SwiftUI

struct RingView: View {
    
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width : CGFloat = 88
    var height : CGFloat = 88
    var percent : CGFloat = 30
    
    @Binding var showProgress : Bool
    
    var body: some View {
        
        let multiplier = width/44
        let progress = 1-percent/100
        
        return ZStack {
            
            Circle()
                .stroke(Color.black.opacity(0.1),style:StrokeStyle(lineWidth:5*multiplier))
                .frame(width: width, height: height, alignment:.center)
            
            Circle()
                .trim(from: showProgress ? progress : 1, to: 1.0)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(lineWidth: 5*multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: .zero))
                .rotationEffect(Angle(degrees: 270))
                .frame(width: width, height: height, alignment: .center)
                .shadow(color: Color(color2).opacity(0.1), radius: 3*multiplier, x: 0, y: 3*multiplier)
                
            
            Text("\(Int(percent))%")
                .font(.system(size: 14*multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.showProgress.toggle()
                }
        }
        
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(showProgress: .constant(true))
    }
}
