//
//  UIButton+visual.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/08.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

extension UIButton {
    func SetDefaultVisual() -> Void {
        SetDefaultShadow()
        self.layer.cornerRadius = 2
    }
}
