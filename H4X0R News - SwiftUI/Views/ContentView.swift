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
                                           .font(.system(.title2))
                                   }
                }

                .listRowBackground(
                           Capsule()
                               .fill(Color.black)
                               .padding(2)
                       )
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





