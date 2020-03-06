//
//  VC_input.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

class VC_result: UIViewController, ResultDelegate {
    
    func Closed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = View_result(frame: UIScreen.main.bounds, vc: self)
    }
    
    func ResultStr() -> String {
        let str = Hiraganalizer.instance.GetHiraganaStr()
        if let s = str {
            return s
        }
        return "Invalid State"
    }
}

