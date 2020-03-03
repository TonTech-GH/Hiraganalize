//
//  View_input.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/04.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

// ViewControllerへの通知用delegate
protocol InputDelegate : class {
    func InputFinished(str : String)
}

// Input画面レイアウト
class View_input: UIView {
    weak var myvc: InputDelegate?
    var ti: UITextField?
    
    init(frame: CGRect, vc : InputDelegate) {
        super.init(frame: frame)
        
        self.myvc = vc
        self.backgroundColor = UIColor.yellow
        
        let ti = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        ti.center = self.center;
        ti.placeholder = "ここの入力文章がひらがな化"
        self.addSubview(ti)
        self.ti = ti
        
        let btn = UIButton(frame: CGRect(x: 0, y: 120, width: 300, height: 100))
        btn.backgroundColor = UIColor.blue
        btn.setTitle("GO", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        self.addSubview(btn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didButtonTapped() {
        var str = ""
        if let ti = self.ti {
            if let text = ti.text {
                str = text
            }
        }
        self.myvc?.InputFinished(str: str)
    }
}
