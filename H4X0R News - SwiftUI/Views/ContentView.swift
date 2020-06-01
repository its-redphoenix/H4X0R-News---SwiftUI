//
//  ContentView.swift
//  H4X0R News - SwiftUI
//
//  Created by Angela on 28/05/20.
//  Copyright © 2020 Angela. All rights reserved.
//  Article published https://bit.ly/2AsjbhQ


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.gray]
        
        
    }
    var body: some View {
        
        
        NavigationView {
            
            
        
            List(networkManager.posts) { post in
                
                NavigationLink(destination: DetailView (url: post.url)) {
                    HStack {
                                       Text(String(post.points))
                                           .foregroundColor(.gray)
                                       
                                       Text(post.title)
                                           .foregroundColor(.green)
                                   }
                }

                //In the this closure
                //for every single post in the posts array
                //we are going to use each of this Text objects
                
               
                
                //this text view will be populated by the .title
                //property in the posts array
            }
                
                
            .navigationBarTitle("H4X0R News")
            
            
        }
            
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11")
    }
}





