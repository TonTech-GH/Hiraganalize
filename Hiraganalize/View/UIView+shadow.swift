//
//  UIView+shadow.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/08.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

extension UIView {
    // 本アプリの共通shadowをセット
    func SetDefaultShadow() -> Void {
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 4
    }
}
