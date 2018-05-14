//
//  DetailsCell.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit


class DetailsCell: UITableViewCell {
    
    var movieDetails: MovieDetails?{
            didSet{
                guard let movieDetails = movieDetails else {return}
                titleLabel.text = movieDetails.title
                descriptionTextView.text = movieDetails.overview
                revenueLabel.text = "Бюджет: " + String(movieDetails.revenue) + " $"
                runTimeLabel.text = "Продолжительность: " + String(movieDetails.runTime) + " мин"
                
            }
    }
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.isSelectable = false
        tv.isEditable = false
        //        iv.contentMode = .scaleAspectFill
//                tv.backgroundColor = .yellow
        return tv
    }()
    
    
    let runTimeLabel: UILabel = {
        let lb = UILabel()
        //        iv.contentMode = .scaleAspectFill
        //        iv.backgroundColor = .yellow
        return lb
    }()
    
    let revenueLabel: UILabel = {
        let lb = UILabel()
        
        //        iv.contentMode = .scaleAspectFill
        //        iv.backgroundColor = .yellow
        return lb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        
        contentView.addSubview(descriptionTextView)
        descriptionTextView.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 90)
        
        contentView.addSubview(runTimeLabel)
        runTimeLabel.anchor(top: descriptionTextView.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 40)
        
        
        contentView.addSubview(revenueLabel)
        revenueLabel.anchor(top: runTimeLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 40)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
