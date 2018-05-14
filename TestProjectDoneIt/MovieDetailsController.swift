//
//  MovieDetailsController.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsController: UITableViewController {
    
    let posterCellId = "posterCellId"
    let detailsCellId = "detailsCellId"
//    let detailsCellId = "detailsCellId"
    
    var searchText: String?
    
    var movieId: Int!
    var movieDetails: MovieDetails?
    
    let imageView: CachedImageView = {
        let iv = CachedImageView()
        iv.contentMode = .scaleToFill
//        iv.backgroundColor = .yellow
        return iv
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetails()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "videoCellId")
        tableView.register(PosterCell.self, forCellReuseIdentifier: posterCellId)
        tableView.register(DetailsCell.self, forCellReuseIdentifier: detailsCellId)
//        tableView.allowsSelection = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.item == 2 {
            let videoLauncher = VideoPlayerController()
            guard let details = movieDetails else {return}
            let idString = String(details.id)
            ApiService.sharedInstance.fetchTrailers(movieId: idString) { (trailers, err) in
                if let _ = err {
                    return
                }
                
                
                if trailers.count > 0 {
                    let urlString = "https://www.youtube.com/watch?v=" + trailers[0].key
                    print(urlString)
                    videoLauncher.videoUrl = urlString
                    self.navigationController?.present(UINavigationController(rootViewController:videoLauncher), animated: true, completion: nil)
                    
                }
                
                
            }

        } else {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: detailsCellId, for: indexPath)  as! DetailsCell
            cell.movieDetails = movieDetails
            return cell
        } else if indexPath.item == 2 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "videoCellId", for: indexPath)
            cell.textLabel?.text = "Смотреть видео"
            return cell
        }
       let cell = tableView.dequeueReusableCell(withIdentifier: posterCellId, for: indexPath)  as! PosterCell
        guard let posterPath = movieDetails?.poster_path else {return cell}
        cell.posterImageView.loadImage(urlString: posterPath)
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 280
        } else if indexPath.item == 1 {
            return 240
        } else if indexPath.item == 2 {
            return 100
        } else {
            return 100
        }
    }
    func fetchMovieDetails(){
        ApiService.sharedInstance.fetchMovieDetails(movieId: String(movieId)) { (movieDetails, err) in
//            self.movieDetails = movieDetails
            
            guard let movieDetails = movieDetails else {return}
            self.movieDetails = movieDetails
            self.tableView.reloadData()
        }
    }
    
    
}
