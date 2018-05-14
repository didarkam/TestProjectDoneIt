//
//  ViewController.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/10/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    @available(iOS 8.0, *)
    public func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text == nil || searchController.searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            fetchMovies()
        } else {
            isSearching = true
            fetchSearchMovies(searchText: searchController.searchBar.text!)
        }
    }

    
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearching = false
    
    var movies = [Movie]()
    
    var searchingMovies = [Movie]()
    
    let movieCellId = "movieCellId"
    
    let searchBar = UISearchBar()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(MovieCell.self, forCellReuseIdentifier: movieCellId)
//        if !isSearching {
            fetchMovies()
//        }
        
        setupSearchController()
        
        
        
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        
        let app = UIApplication.shared
        if searchController.isActive && app.isStatusBarHidden && searchController.searchBar.frame.origin.y == 0 {
            if let container = self.searchController.searchBar.superview {
                container.frame = CGRect(x: container.frame.origin.x, y: container.frame.origin.y, width: container.frame.size.width, height: container.frame.size.height + app.statusBarFrame.height)
                
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchController.isActive = true
    }
    
    func setupSearchController(){
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        
        
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        isSearching = false
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            fetchMovies()
        } else {
            isSearching = true
            fetchSearchMovies(searchText: searchBar.text!)
        }
    }
    
    func fetchSearchMovies(searchText: String){
        ApiService.sharedInstance.fetchMoviesSearch(searchText: searchText) { (movies, err) in
            if let _ = err {
                print("error occured")
                return
            }
            self.searchingMovies = movies
            self.tableView.reloadData()
            
        }
    }

    
    func setupSearchBar(){
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
//        searchBar.delegate = self
        searchBar.returnKeyType = .done
        navigationItem.titleView = searchBar
    }
    
    
    func fetchMovies(){
        ApiService.sharedInstance.fetchClubs { (movies, err) in
            if let _ = err {
                print("error occured")
                return
            }
            print(movies.count)
            self.movies = movies
            print("aaa")
            self.tableView.reloadData()
            
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = MovieDetailsController()
        
        if isSearching {
            movieDetailsVC.movieId = searchingMovies[indexPath.item].id
        } else {
            movieDetailsVC.movieId = movies[indexPath.item].id
        }
        
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return searchingMovies.count
        }
        
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellId, for: indexPath)  as! MovieCell
        
        
        if isSearching {
            cell.movie = searchingMovies[indexPath.item]
            
        } else {
            cell.movie = movies[indexPath.item]
            
        }
        
        
//        cell.itemImageView.image = #imageLiteral(resourceName: "nav_drawer_collectz")
        
        
        return cell
    }


}

