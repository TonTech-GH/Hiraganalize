//
//  SharedModel.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/04.
//  Copyright © 2020 TonTech. All rights reserved.
//

import Foundation

// ひらがな化のエラー定義
enum Err: Int {
    case NoInputCharacter   = 0       // 入力文字が無い
    case UnJasonizable      = 1       // JSON化できないデータ
    case JsonizeFailed      = 2       // JSON化失敗
    case CnnectError        = 100     // 通信エラー
    case NoResponce         = 101     // 通信レスポンスデータが無い
    case ParseFailed_Conv   = 200     // JSONのパース失敗 変換失敗
    case ParseFailed_Dict   = 201     // JSONのパース失敗 辞書化失敗
    case ParseFailed_NoElem = 202     // JSONのパース失敗 想定している要素が無い
}

// ViewControllerへの通知用delegate
protocol SharedModelDelegate : class {
    func Hiraganalized()
    func Error(err: Err)
}

// アプリ共通のモデル(singleton)
class SharedModel {
    static private let AppID: String = ""
    static private let Url: String = "https://labs.goo.ne.jp/api/hiragana"
    
    static let instance = SharedModel()
    private var strHiragana: String?
    
    private init() {
    }
    
    func Hiraganalize(str: String, vc: SharedModelDelegate) {
        self.strHiragana = nil
        
        if str.isEmpty {
            vc.Error(err: .NoInputCharacter)
            return
        }
        // Json化するためのdict
        var jDict = Dictionary<String, Any>()
        jDict["app_id"     ] = SharedModel.AppID
        jDict["request_id" ] = "request_id"
        jDict["sentence"   ] = str
        jDict["output_type"] = "hiragana"
        
        // Jsonデータ生成
        if !JSONSerialization.isValidJSONObject(jDict) {
            vc.Error(err: .UnJasonizable)
            return
        }
        let jsonData : Data
        do {
            jsonData = try JSONSerialization.data(withJSONObject: jDict)
            //let jsonStr = String(bytes: jsonData, encoding: .utf8)!
            //print(jsonStr)
        } catch {
            vc.Error(err: .JsonizeFailed)
            return
        }
        // 通信リクエスト生成
        let req = NSMutableURLRequest(url: URL(string: SharedModel.Url)!)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = jsonData
        
        // 通信
        let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler:
        { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            // errorがあるか
            if let e = error {
                print(e.localizedDescription)
                vc.Error(err: .CnnectError)
                return
            }
            
            // dataがnilでないか
            if data == nil {
                vc.Error(err: .NoResponce)
                return
            }
            
            // data parse
            do {
                let items = try JSONSerialization.jsonObject(with: data!) as? Dictionary<String, Any>
                if items == nil {
                    vc.Error(err: .ParseFailed_Dict)
                    return
                }
                let hiragana = items!["converted"] as? String
                if hiragana == nil {
                    vc.Error(err: .ParseFailed_NoElem)
                    return
                }
                self.strHiragana = hiragana
            } catch {
                vc.Error(err: .ParseFailed_Conv)
                return
            }
            
            // VCに通知
            DispatchQueue.main.async {
                vc.Hiraganalized()
            }
        })
        
        task.resume()
    }
    
    func GetHiraganaStr() -> String? {
        return self.strHiragana
    }
}
