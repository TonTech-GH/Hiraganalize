//
//  View_goo_lic.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/06.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit
import WebKit

class View_credit: WKWebView {
    static let DfltWidth : Float = 522
    static let DfltHeight: Float = 219
    
    init() {
        let conf = WKWebViewConfiguration()
        super.init(frame: CGRect.zero, configuration: conf)
        self.scrollView.bounces = false
        
        let urlstr = "https://u.xgoo.jp/img/sgoo.png"
        let url = NSURL(string: urlstr)
        let request = NSURLRequest(url: url! as URL)
        self.load(request as URLRequest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
