//
//  PosterCell.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit


class PosterCell: UITableViewCell {
    
    var posterPath: String?{
        didSet{
            guard let posterPath = posterPath else {return}
            posterImageView.loadImage(urlString: posterPath)
        }
    }
    
    let posterImageView: CachedImageView = {
        let iv = CachedImageView()
        iv.contentMode = .scaleAspectFit
//        iv.backgroundColor = .yellow
        return iv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(posterImageView)
        posterImageView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)
       
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
