//
//  Movie.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import SwiftyJSON


struct MovieDetails {
    
    let adult: Bool
    let poster_path:String
    let id: Int
//    let vote_average: Int
    let title: String
//    let popularity: Int
    let overview: String
    let revenue: String
    let runTime: Int
//    let genre_ids: [Int]
//    let backdrop_path: String
//    let adult: Bool
//    let overview: String
//    let release_date: String
    
    
    init(json: JSON) {
        
        self.adult = json["adult"].boolValue
        self.poster_path = "https://image.tmdb.org/t/p/w1280/" + json["poster_path"].stringValue
        
        self.id = json["id"].intValue
//        self.video = json["raiting"].boolValue
//        self.vote_average = json["vote_average"].intValue
        self.title = json["title"].stringValue
//        self.popularity = json["popularity"].intValue
        self.overview = json["overview"].stringValue
//        self.original_language = json["original_language"].stringValue
//        self.original_title = json["original_title"].stringValue
//        self.genre_ids = json["genre_ids"].arrayObject as! [Int]
//        self.backdrop_path =  json["backdrop_path"].stringValue
        self.revenue = json["revenue"].stringValue
        self.runTime = json["runtime"].intValue
//        self.release_date =  json["release_date"].stringValue
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
