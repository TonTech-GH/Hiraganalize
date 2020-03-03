//
//  ViewController.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ti = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        ti.center = self.view.center;
        ti.text = "テキストフィールド"
        
        self.view.addSubview(ti)
        
    }

}

