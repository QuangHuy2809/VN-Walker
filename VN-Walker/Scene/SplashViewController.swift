//
//  SplashViewController.swift
//  VN-Walker
//
//  Created by Huy on 2/7/24.
//  Copyright © Huy. All rights reserved.
//

import AVKit
import UIKit

class SplashViewController: UIViewController {
    private var player: AVPlayer?
    private var playerView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = HexColor.hexFFFFFF
        guard let path = Bundle.main.path(forResource: "vieWalker_splash", ofType: "mp4") else {
            print("Video không tìm thấy")
            return
        }

        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        playerView = UIView(frame: view.bounds)
        if let playerView = playerView {
            playerView.layer.addSublayer(playerLayer)
            view.addSubview(playerView)
        }

        player?.play()

        NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinish), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc
    private func videoDidFinish() {
        UIView.animate(withDuration: 1.0) {
            self.playerView?.alpha = 0.2
        } completion: { _ in
            AppDelegate.shared.loadLoginViewController()
        }
    }
}
