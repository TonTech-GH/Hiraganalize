//
//  ViewController.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

class VC_input: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.yellow
        
        let ti = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        ti.center = self.view.center;
        ti.text = "テキストフィールドだよ"
        self.view.addSubview(ti)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 120, width: 300, height: 100))
        btn.backgroundColor = UIColor.blue
        btn.setTitle("GO", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @objc func didButtonTapped() {
        let vcNext = VC_result()
        self.present(vcNext, animated: true, completion: nil)
    }


}

