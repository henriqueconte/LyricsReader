//
//  ImageLoader.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 14/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SwiftUI

import Foundation
import UIKit


extension String {
    
    func getImageFromURL() -> UIImage {
        let url = URL(string: self) ?? URL(fileURLWithPath: "")
        let imageData = (try? Data(contentsOf: url)) ?? Data()
        
        if let image = UIImage(data: imageData) {
            return image
        } else {
            return UIImage()
        }
    }
    
}
