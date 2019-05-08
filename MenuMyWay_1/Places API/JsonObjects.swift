//
//  JsonObjects.swift
//  MenuMyWay_1
//
//  Created by Celina Juarez on 5/8/19.
//  Copyright © 2019 Celina. All rights reserved.
//

import Foundation

struct Menu : Codable {
    struct Food : Codable {
        var name : String
        var description : String?
        
        init() {
            name = ""
            description = ""
        }
    }
    
    struct AllFood : Codable {
        var items : [Food]
        
        init() {
            items = []
        }
    }
    
    struct Category : Codable {
        var name : String           // Food Category
        var description : String?    // Category Description
        var entries : AllFood
        
        init() {
            name = ""
            description = ""
            entries = AllFood()
        }
    }
    
    struct Entry : Codable {
        var count : Int?
        var items : [Category]?
        
        init() {
            count = 0
            items = []
        }
    }
    
    struct Item : Codable {
        var name : String
        var description : String?
        var entries: Entry
        
        init() {
            name = ""
            description = ""
            entries = Entry()
        }
    }
    
    struct Menus : Codable {
        var count : Int
        var items : [Item]?
        
        init() {
            count = 0
            items = []
        }
    }
    
    struct Menu : Codable {
        var menus : Menus
        
        init() {
            menus = Menus()
        }
    }
    
    struct Response : Codable {
        var menu : Menu
        
        init() {
            menu = Menu()
        }
    }
    
    var response : Response
    
    init() {
        response = Response()
    }
}

struct Restaurant : Codable{
    struct Venue : Codable{
        let id : String
        let name : String
    }
    
    struct Response : Codable{
        let venues : [Venue]
    }
    
    let response : Response
}


