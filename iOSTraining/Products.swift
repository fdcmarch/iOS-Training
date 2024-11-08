//
//  Products.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/8/24.
//

import Foundation

struct ProductResponse : Decodable {
    let products : [Products]
    let limit: Int
    let skip: Int
    let total: Int
    
    struct Products: Decodable{
        let id : Int
        let title: String
        let description: String
        let category: String
        let price: Double
        
    }
}
