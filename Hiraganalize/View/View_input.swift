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
    weak var vc: InputDelegate?
    var ti: UITextField?
    
    init(frame: CGRect, vc : InputDelegate) {
        super.init(frame: frame)
        
        self.vc = vc
        self.backgroundColor = UIColor.white
        
        // テキスト入力UI
        //let ti = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        let ti = UITextField()
        ti.placeholder = "ここの入力文章がひらがな化"
        ti.becomeFirstResponder()
        ti.clearButtonMode = UITextField.ViewMode.always
        ti.returnKeyType = UIReturnKeyType.done
        ti.borderStyle = UITextField.BorderStyle.bezel
        ti.borderRect(forBounds: ti.bounds)
        ti.delegate = self
        ti.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ti)
        self.ti = ti
        ti.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ti.centerYAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height / 3).isActive = true
        ti.widthAnchor.constraint(equalToConstant: self.bounds.width * 4 / 5).isActive = true
        ti.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // 完了ボタン
        let btn = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitle("ひらがなにする", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(InputFinished), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(btn)
        
        btn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btn.topAnchor.constraint(equalTo: ti.centerYAnchor, constant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
