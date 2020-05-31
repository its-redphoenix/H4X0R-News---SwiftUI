//
//  NetworkManager.swift
//  H4X0R News - SwiftUI
//
//  Created by Angela on 29/05/20.
//  Copyright © 2020 Angela. All rights reserved.
//

import Foundation



class NetworkManager: ObservableObject {
    //this means this clas can broadcast one or many of its properties to the interested parties
    
    @Published var posts = [Post]()
    //we initialize it as a new array of post objects
    //@Publish helps us publish our posts data to any interested parties
    
    func fetchData()
    
    {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
        //make a constant to handle the URL string. also it's an optional hence if - let wrapper {
        let session = URLSession(configuration: .default)
        //initialize URL session with a default config
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData )
                            //once the data is decoded we bind it to a constant "results"
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits
                                //we use the decoded data adn store in posts which is an array of [Post]
                            }
                           
                        } catch {
                            print(error)
                        }
                        
                    }
                   
                }
            }
        
            task.resume()
            //this will start off our networking task
        }
    }
    
    
}
