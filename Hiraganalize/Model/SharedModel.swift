//
//  SharedModel.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/04.
//  Copyright © 2020 TonTech. All rights reserved.
//

// ViewControllerへの通知用delegate
protocol SharedModelDelegate : class {
    func Hiraganalized()
}

// アプリ共通のモデル(singleton)
class SharedModel {
    static let instance = SharedModel()
    weak var vc: SharedModelDelegate?
    private var strHiragana: String?
    
    private init() {
    }
    
    func Hiraganalize(str: String, vc: SharedModelDelegate) {
        self.strHiragana = nil
        
        // ここでひらがな化
        self.strHiragana = str + "がひらがな化された文字列"
        
        // 終了したらこれを呼ぶ
        vc.Hiraganalized()
    }
    
    func GetHiraganaStr() -> String? {
        return self.strHiragana
    }
}
