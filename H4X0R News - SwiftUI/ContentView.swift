//
//  ContentView.swift
//  H4X0R News - SwiftUI
//
//  Created by Angela on 28/05/20.
//  Copyright © 2020 Angela. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
             
            List(posts) { post in
                
                
                //In the this closure
                //for every single post in the posts array
                //we are going to use each of this Text objects
                
                Text(post.title)
                //this text view will be populated by the .title
                //property in the posts array
            }
                
            
             .navigationBarTitle("H4X0R News")
            
        }
   
        
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11")
    }
}



struct Post: Identifiable {
    let id : String
    let title : String
}

let posts = [
Post(id: "1", title: "THis is awesome"),
Post(id: "2", title: "THis is more awesome"),
    Post(id: "3", title: "THis is even more awesome")
]

