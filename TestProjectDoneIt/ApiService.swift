//
//  ApiService.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON


class ApiService: NSObject {
    
    let tron = TRON(baseURL: "https://api.themoviedb.org")
    
    static let sharedInstance = ApiService()
    
    class Home: JSONDecodable {
        
        let movies: [Movie]

        
        required init(json: JSON) throws {
            //print("Now ready to parse json: \n", json)
            
            guard let clubsJsonArray = json["results"].array else {
                
                throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey : "Parsing JSON is not valid in JSON"])
                
            }
            
            
            self.movies = clubsJsonArray.map{Movie(json: $0)}

            
        }
    }
    
    
    class HomeDetails: JSONDecodable {
        
        let movieDetails: MovieDetails
        
        required init(json: JSON) throws {
            print("Now ready to parse json: \n", json)
            

            
            
            self.movieDetails = MovieDetails(json: json)
            
            
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    class HomeTrailer: JSONDecodable {
        
        let trailers: [Trailer]
        
        
        required init(json: JSON) throws {
            //print("Now ready to parse json: \n", json)
            
            guard let clubsJsonArray = json["results"].array else {
                
                throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey : "Parsing JSON is not valid in JSON"])
                
            }
            
            
            self.trailers = clubsJsonArray.map{Trailer(json: $0)}
            
            
        }
    }
    
    
    func fetchClubs( completion: @escaping ([Movie], Error?) -> ()) {
        
        let request: APIRequest<Home, JSONError> = tron.request("/3/movie/popular/")
        
        var parameters = [String: Any]()
        
        let api_key="5a36b4f9c439feb174a3458a889e9c56"
        
        parameters["api_key"] = api_key
        
        request.parameters = parameters
        
        request.headers = ["Accept": "text/html" ]
        request.headers = ["Content-Type": "application/json" ]
        
        request.perform(withSuccess: { (data) in
            print("Succesfully fetched json")
            print("zzz\(data.movies.count)")
            
            
            completion(data.movies, nil)
            
        }) { (JSONError) in
            print("Failed to fetch json")
            print(JSONError)
            completion([], JSONError)
        }
        
        
    }
    
    func fetchMovieDetails( movieId: String, completion: @escaping (MovieDetails?, Error?) -> ()) {
        
        let request: APIRequest<HomeDetails, JSONError> = tron.request("/3/movie/\(movieId)")
        
        var parameters = [String: Any]()
        
        let api_key="5a36b4f9c439feb174a3458a889e9c56"
        
        parameters["api_key"] = api_key
        
        request.parameters = parameters
        
        
        request.headers = ["Accept": "text/html" ]
        request.headers = ["Content-Type": "application/json" ]
        
        request.perform(withSuccess: { (data) in
            print("Succesfully fetched json movie details")

            
            completion(data.movieDetails, nil)
            
        }) { (JSONError) in
            print("Failed to fetch json")
            print(JSONError)
            print(123)
            
            completion(nil, JSONError)
        }
        
        
    }
    
    func fetchMoviesSearch(searchText: String, completion: @escaping ([Movie], Error?) -> ()) {
        
        let request: APIRequest<Home, JSONError> = tron.request("/3/search/movie/")
        
        var parameters = [String: Any]()
        parameters["query"] = searchText
        
        let api_key="5a36b4f9c439feb174a3458a889e9c56"
        
        parameters["api_key"] = api_key
        
        
        request.parameters = parameters
        
        
        request.headers = ["Accept": "text/html" ]
        request.headers = ["Content-Type": "application/json" ]
        
        request.perform(withSuccess: { (data) in
            print("Succesfully fetched json")
            print("zzz\(data.movies.count)")
            
            completion(data.movies, nil)
            
        }) { (JSONError) in
            print("Failed to fetch json")
            print(JSONError)
            
            completion([], JSONError)
        }
        
        
    }
    
    
    
    func fetchTrailers(movieId: String, completion: @escaping ([Trailer], Error?) -> ()) {
        
        let request: APIRequest<HomeTrailer, JSONError> = tron.request("/3/movie/\(movieId)/videos")
        
        var parameters = [String: Any]()
        parameters["query"] = movieId
        
        let api_key="5a36b4f9c439feb174a3458a889e9c56"
        
        parameters["api_key"] = api_key
        
        
        request.parameters = parameters
        
        
        request.headers = ["Accept": "text/html" ]
        request.headers = ["Content-Type": "application/json" ]
        
        request.perform(withSuccess: { (data) in
            print("Succesfully fetched json")
            print("zzz\(data.trailers.count)")
            
            completion(data.trailers, nil)
            
        }) { (JSONError) in
            print("Failed to fetch json")
            print(JSONError)
            completion([], JSONError)
        }
        
        
    }
    
    
    
    
    
    
    
}
