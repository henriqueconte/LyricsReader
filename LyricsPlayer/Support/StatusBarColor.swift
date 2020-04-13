//
//  StatusBarColor.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 08/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


class DarkHostingController<Content> : UIHostingController<Content> where Content : View {
    @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}


