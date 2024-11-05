//
//  Book.swift
//  SlipsReader
//
//  Created by ITCharge on 2024/11/1.
//

import Foundation


struct Book: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let publisher: String
    let coverImage: String
} 
