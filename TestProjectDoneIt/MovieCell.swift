//
//  MovieCell.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit


class MovieCell: UITableViewCell {
    
    var movie: Movie? {
        didSet{
            guard let movie = movie else {return}
            nameLabel.text = movie.title
            movieImageView.loadImage(urlString: movie.poster_path)
            dateLabel.text = movie.release_date
            voteAverageLabel.text = String(movie.vote_average)
            
        }
    }
    
    let nameLabel: UILabel = {
        let lb = UILabel()
//        lb.font = UIFont (name: "Akrobat-Bold", size: 16)
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        lb.adjustsFontSizeToFitWidth = true
        return lb
    }()
    
    let movieImageView: CachedImageView = {
        let iv = CachedImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let dateLabel: UILabel = {
        let lb = UILabel()
        //        lb.font = UIFont (name: "Akrobat-Bold", size: 16)
        lb.font = UIFont.boldSystemFont(ofSize: 17)
        lb.textColor = .gray
        return lb
    }()
    
    let voteAverageLabel: UILabel = {
        let lb = UILabel()
        //        lb.font = UIFont (name: "Akrobat-Bold", size: 16)
        lb.font = UIFont.boldSystemFont(ofSize: 25)
        lb.textAlignment = .center
        
        return lb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(movieImageView)
        contentView.addSubview(voteAverageLabel)
        contentView.addSubview(dateLabel)
        
        
        movieImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 20, bottomConstant: 90, rightConstant: 20, widthConstant: 0, heightConstant: 0)
        
        
        voteAverageLabel.anchor(top: movieImageView.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 60, height: 60)
        
        nameLabel.anchor(movieImageView.bottomAnchor, left: voteAverageLabel.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 15, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 40)
        
        
        dateLabel.anchor(top: nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: voteAverageLabel.bottomAnchor, right: nameLabel.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

