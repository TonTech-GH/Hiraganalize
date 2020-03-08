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
        
        // UITextViewにはうまく影が付かないので影用のView
        let sdw = UIButton()
        sdw.backgroundColor = UIColor.white
        sdw.SetDefaultShadow()
        sdw.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sdw)
        sdw.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sdw.centerYAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 3).isActive = true
        sdw.widthAnchor.constraint(equalToConstant: self.bounds.width * 4 / 5).isActive = true
        sdw.heightAnchor.constraint(equalToConstant: self.bounds.height / 2).isActive = true
        
        // 結果出力用View
        let tv = UITextView()
        tv.text = vc.ResultStr()
        tv.isEditable = false
        tv.backgroundColor = .white
        tv.layer.masksToBounds = true
        tv.font = UIFont.systemFont(ofSize: 20)
        tv.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tv)
        tv.centerXAnchor.constraint(equalTo: sdw.centerXAnchor).isActive = true
        tv.centerYAnchor.constraint(equalTo: sdw.centerYAnchor).isActive = true
        tv.widthAnchor.constraint(equalTo: sdw.widthAnchor).isActive = true
        tv.heightAnchor.constraint(equalTo: sdw.heightAnchor).isActive = true
        
        // 入力画面への遷移ボタン
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitle("もどる", for: UIControl.State.normal)
        btn.SetDefaultVisual()
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
