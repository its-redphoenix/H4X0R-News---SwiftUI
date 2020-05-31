//
//  PostData.swift
//  H4X0R News - SwiftUI
//
//  Created by Angela on 29/05/20.
//  Copyright © 2020 Angela. All rights reserved.
//

import Foundation


struct Results: Decodable {
    let hits: [Post]
}



struct Post: Decodable, Identifiable {
    
    //ID is needed to make it identifiable
    var id : String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    
}
