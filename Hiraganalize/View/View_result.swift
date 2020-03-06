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
    func ResultStr() -> String
}

// 結果画面レイアウト
class View_result: UIView {
    weak var myvc: ResultDelegate?
    
    init(frame: CGRect, vc : ResultDelegate) {
        super.init(frame: frame)
        
        self.myvc = vc
        self.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        let tv = UITextView()
        tv.text = vc.ResultStr()
        tv.isEditable = false
        tv.backgroundColor = .white
        tv.layer.masksToBounds = true
        tv.layer.cornerRadius = 20
        tv.layer.borderWidth = 1
        tv.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6).cgColor
        tv.font = UIFont.systemFont(ofSize: 20)
        tv.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tv)
        tv.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tv.centerYAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 3).isActive = true
        tv.widthAnchor.constraint(equalToConstant: self.bounds.width * 4 / 5).isActive = true
        tv.heightAnchor.constraint(equalToConstant: self.bounds.height / 2).isActive = true
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitle("もどる", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 2 / 3).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didButtonTapped() {
        self.myvc?.Closed()
    }
}
