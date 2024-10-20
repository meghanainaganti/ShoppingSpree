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
    var locationOnMap: String
    
    init(name: String, category: String, description: String, location: String, hours: String, locationOnMap: String) {
        self.name = name
        self.category = category
        self.description = description
        self.location = location
        self.hours = hours
        self.locationOnMap = locationOnMap
    }
    
}
