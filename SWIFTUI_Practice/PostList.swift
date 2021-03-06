//
//  PostList.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 17/07/21.
//

import SwiftUI

struct PostList: View {
    
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store) { post in
            VStack(alignment: .leading, spacing: 8)
            {
                Text(post.title)
                    .font(.system(.title,design:.serif)).bold()
                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
        }
            
        }
        
    }


struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
