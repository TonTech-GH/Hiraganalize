//
//  ViewController.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

class VC_input: UIViewController, InputDelegate, HiraganalizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view = View_input(frame: UIScreen.main.bounds, vc: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // SafeArea取得可能になった
        let win = UIApplication.shared.keyWindow
        if let w = win {
            let safe = w.safeAreaInsets
            let view = self.view as! View_input
            view.SetSafearea(safearea: safe)
        }
    }
    
    func InputFinished(str: String) {
        // ひらがな化開始
        Hiraganalizer.instance.Hiraganalize(str: str, vc: self)
    }
    
    func Hiraganalized() {
        let vcNext = VC_result()
        self.present(vcNext, animated: true, completion: nil)
    }
    
    func Error(err: Err) {
        print("エラーが発生しました Code:" + err.rawValue.description)
    }
    
}

