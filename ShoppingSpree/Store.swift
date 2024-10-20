//
//  Store.swift
//  ShoppingSpree
//  Store Data Structure
//


import Foundation

class Store {
    var name: String
    var category: String
    var description: String
    var location: String
    var hours: String
    var phonenumber: String
    var mallEntrance: String
    
    init(name: String, category: String, description: String, location: String, hours: String, phonenumber: String, mallEntrance: String) {
        self.name = name
        self.category = category
        self.description = description
        self.location = location
        self.hours = hours
        self.phonenumber = phonenumber
        self.mallEntrance = mallEntrance
    }
    
}
