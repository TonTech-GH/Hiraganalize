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
class View_input: UIView, UITextFieldDelegate {
    weak private var vc: InputDelegate?
    private var ti: UITextField?
    private var cre: View_credit?
    
    init(frame: CGRect, vc : InputDelegate) {
        super.init(frame: frame)
        
        self.vc = vc
        self.backgroundColor = UIColor.white
        
        // テキスト入力UI
        let ti = UITextField()
        ti.placeholder = "ここの入力文章がひらがな化"
        ti.becomeFirstResponder()
        ti.clearButtonMode = UITextField.ViewMode.always
        ti.returnKeyType = UIReturnKeyType.done
        ti.borderStyle = UITextField.BorderStyle.bezel
        ti.borderRect(forBounds: ti.bounds)
        ti.backgroundColor = .white
        ti.SetDefaultShadow()
        ti.delegate = self
        ti.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ti)
        self.ti = ti
        ti.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ti.centerYAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 3).isActive = true
        ti.widthAnchor.constraint(equalToConstant: self.bounds.width * 4 / 5).isActive = true
        ti.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // タイトル表示
        let ttl = UIImageView(image: UIImage(named: "Title"))
        ttl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ttl)
        ttl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ttl.bottomAnchor.constraint(equalTo: ti.topAnchor, constant: -20).isActive = true
        ttl.widthAnchor.constraint(equalTo: ti.widthAnchor, multiplier: 0.7).isActive = true
        let aspect = ttl.bounds.height / ttl.bounds.width
        ttl.heightAnchor.constraint(equalTo: ttl.widthAnchor, multiplier: CGFloat(aspect)).isActive = false
        
        // ひらがな化開始ボタン
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitle("ひらがな化", for: UIControl.State.normal)
        btn.SetDefaultVisual()
        btn.addTarget(self, action: #selector(InputFinished), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(btn)
        btn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: ti.centerYAnchor, constant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // クレジット表示
        let cre = View_credit()
        cre.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cre)
        cre.isHidden = true
        self.cre = cre
    }
    
    func SetSafearea(safearea: UIEdgeInsets) {
        // SafeAreaを考慮してクレジット表記を設置
        if let cre = self.cre {
            cre.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            cre.topAnchor.constraint(equalTo: self.topAnchor, constant: safearea.top).isActive = true
            let scale: Float = 0.2
            cre.widthAnchor.constraint(equalToConstant: CGFloat(View_credit.DfltWidth * scale)).isActive = true
            cre.heightAnchor.constraint(equalToConstant: CGFloat(View_credit.DfltHeight * scale)).isActive = true
            cre.isHidden = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func InputFinished() {
        var str = ""
        if let ti = self.ti {
            if let text = ti.text {
                str = text
            }
        }
        self.vc?.InputFinished(str: str)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.InputFinished()
        return true
    }
    
}
