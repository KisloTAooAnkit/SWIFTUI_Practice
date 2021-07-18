//
//  DataStore.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 17/07/21.
//

import SwiftUI
import Combine

class DataStore : ObservableObject
{
    @Published var listOfPost : SinglePost = []
    
    
    init() {
        self.getPosts()
    }
    
    func getPosts()
    {
        Api().getPosts { posts in
            self.listOfPost = posts
        }
    }
    
    
    
}

