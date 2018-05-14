//
//  Movie.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie  {
    
    
   
    let vote_count: Int
    let id:Int
    let video: Bool
    let vote_average: Double
    let title: String
    let popularity: Int
    let poster_path: String
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let backdrop_path: String
    let adult: Bool
    let overview: String
    let release_date: String
    
    let year: Int
    let grossing: Int
    
    init(json: JSON) {
        
        self.id = json["id"].intValue
        self.vote_count = json["vote_count"].intValue
        self.video = json["raiting"].boolValue
        self.vote_average = json["vote_average"].doubleValue
        self.title = json["title"].stringValue
        self.popularity = json["popularity"].intValue
        self.poster_path =  "https://image.tmdb.org/t/p/w1280/" + json["poster_path"].stringValue
        self.original_language = json["original_language"].stringValue
        self.original_title = json["original_title"].stringValue
        self.genre_ids = json["genre_ids"].arrayObject as! [Int]
        self.backdrop_path =  json["backdrop_path"].stringValue
        self.adult = json["adult"].boolValue
        self.overview = json["overview"].stringValue
        self.release_date =  json["release_date"].stringValue
        
        self.year = json["year"].intValue
        self.grossing = json["grossing"].intValue
    }
    
    
    
    
}

    
    
    
    
    
    
    
    

