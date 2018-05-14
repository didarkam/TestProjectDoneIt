//
//  Trailer.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation

//
//  Movie.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/10/18.
//  Copyright © 2018 test. All rights reserved.
//


import SwiftyJSON


struct Trailer {
    
    
    
    let iso_639_1: String
    let id:String
    
    let iso_3166_1: String
    let key: String
    let name: String
    
    let size: Int
    let site: String
    let type: String
    
    init(json: JSON) {
        
        self.id = json["id"].stringValue
        self.iso_639_1 = json["iso_639_1"].stringValue
        self.iso_3166_1 = json["iso_3166_1"].stringValue
        
        self.key = json["key"].stringValue
        self.name = json["name"].stringValue
        self.size = json["size"].intValue
        
        
        self.type = json["type"].stringValue
        self.site = json["site"].stringValue
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
