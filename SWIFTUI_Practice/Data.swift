//
//  Data.swift
//  SWIFTUI_Practice
//
//  Created by Ankit Singh on 17/07/21.
//

import SwiftUI




struct Post : Codable, Identifiable {
    var id = UUID()
    var title : String
    var body  : String
    
}


class Api {
    func getPosts(completion : @escaping ([Post]) -> ())
    {
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url) { data, uRLResponse, error in
            DispatchQueue.main.async {
                if let mydata = data
                {
                    print(mydata)
                    do
                    {
                        let jsonDcdr = JSONDecoder()
                        let postList = try jsonDcdr.decode([Post].self, from: mydata)
                        print(postList)
                        completion(postList)
                        
                    }
                    catch
                    {
                        print("Error in fetching data from API")
                    }
                }
            }
            
            //            guard let data = data else { print("error in fetching data"); return}
            //
            //            let posts = try!  JSONDecoder().decode([Post].self, from: data)
            //
            //            DispatchQueue.main.async {
            //                completion(posts)
            //            }
        }
        .resume() 
    }
}
