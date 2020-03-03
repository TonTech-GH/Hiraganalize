//
//  View_result.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/04.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

// ViewControllerへの通知用delegate
protocol ResultDelegate : class {
    func Closed()
}

// 結果画面レイアウト
class View_result: UIView {
    weak var myvc: ResultDelegate?
    
    init(frame: CGRect, vc : ResultDelegate) {
        super.init(frame: frame)
        
        self.myvc = vc
        self.backgroundColor = UIColor.red
        
        let ti = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        ti.text = "結果出力"
        self.addSubview(ti)
        
        let btn = UIButton(frame: CGRect(x: 0, y: 120, width: 300, height: 100))
        btn.center = self.center
        btn.backgroundColor = UIColor.blue
        btn.setTitle("BACK", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        self.addSubview(btn)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didButtonTapped() {
        self.myvc?.Closed()
    }
}
