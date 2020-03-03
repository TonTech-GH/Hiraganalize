//
//  VC_input.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

class VC_result: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        
        let ti = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        ti.text = "結果出力"
        
        let btn = UIButton(frame: CGRect(x: 0, y: 120, width: 300, height: 100))
        btn.center = self.view.center
        btn.backgroundColor = UIColor.blue
        btn.setTitle("BACK", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        self.view.addSubview(btn)
        
        self.view.addSubview(ti)
        
    }
    
    @objc func didButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

}

