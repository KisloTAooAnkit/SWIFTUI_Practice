//
//  Modifiers.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 12/07/21.
//

import SwiftUI

struct ShadowModifier : ViewModifier {

    
    func body(content:Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
        
        
    }
    
}

struct FontModifier : ViewModifier {
    
    var style : Font.TextStyle = .body
    
    
    func body(content:Content) -> some View {
        
        content
            .font(.system(style,design: .rounded))
    }
}


struct CustomFontModifier : ViewModifier {
    
    var size  : CGFloat = 28
    
    func body(content:Content) -> some View
{
        content.font(.custom("WorkSans-Bold", size: size))
    }
}
