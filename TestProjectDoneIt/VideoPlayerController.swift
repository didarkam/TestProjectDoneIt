//
//  VideoPlayerController.swift
//  TestProjectDoneIt
//
//  Created by didarkam on 5/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

class VideoPlayerController: UIViewController {
    
    var videoUrl: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Закрыть", style: .plain, target: self, action: #selector(handleCancel))
        
        let height = view.frame.width * 9 / 16
        let videoPlayerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        let videoPlayerView = UIWebView(frame: videoPlayerFrame)
        guard let videoUrl = videoUrl else {return}
        guard let youtubeURL = URL(string: videoUrl) else { return }
        videoPlayerView.loadRequest(URLRequest(url: youtubeURL))
        view.addSubview(videoPlayerView)
    }
    
    
    func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
