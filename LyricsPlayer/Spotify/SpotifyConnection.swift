//
//  SpotifyConnection.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 15/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//
import Foundation
import UIKit


class SpotifyConnection: UIViewController {
    
    private var sceneDelegate: SceneDelegate? {

        let scene = UIApplication.shared.connectedScenes.first
        
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            return sceneDelegate
        }
        else {
            return nil
        }
    }
    
    func connectMusic() {
        sceneDelegate?.connect()
    }
    
    func getCurrentTrackName() -> String {
        return sceneDelegate?.currentTrackName ?? "Track not found"
    }
}
