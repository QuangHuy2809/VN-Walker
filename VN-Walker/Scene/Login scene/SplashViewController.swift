//
//  SplashViewController.swift
//  VN-Walker
//
//  Created by Huy on 2/7/24.
//  Copyright © Huy. All rights reserved.
//

import UIKit
import AVKit

class SplashViewController: UIViewController {
    private var player: AVPlayer?
    private var playerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = HexColor.hexFFFFFF
        var r = "Huy"
        guard let path = Bundle.main.path(forResource: "vieWalker_splash", ofType: "mp4") else {
            print("Video không tìm thấy")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerView = UIView(frame: self.view.bounds)
        if let playerView = playerView {
            playerView.layer.addSublayer(playerLayer)
            self.view.addSubview(playerView)
        }
        
        player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinish(_:)), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    private func videoDidFinish(_ notification: Notification) {
        UIView.animate(withDuration: 1.0) {
            self.playerView?.alpha = 0.2
        } completion: { _ in
            AppDelegate.shared.loadLoginViewController()
        }
    }
}
