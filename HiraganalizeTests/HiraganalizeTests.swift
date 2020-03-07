//
//  HiraganalizeTests.swift
//  HiraganalizeTests
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import XCTest
@testable import Hiraganalize

class HiraganalizeTests: XCTestCase, HiraganalizerDelegate {
    var closure: (String?, Err?) -> () = { _,_ in  }
    
    func Hiraganalized() {
        self.closure(Hiraganalizer.instance.GetHiraganaStr(), nil)
    }
    
    func Error(err: Err) {
        self.closure(Hiraganalizer.instance.GetHiraganaStr(), err)
    }
    
    func Hiraganalize(str: String, closure: @escaping (String?, Err?) -> ()) {
        self.closure = closure
        Hiraganalizer.instance.Hiraganalize(str: str, vc: self)
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func templateTest(desc: String, str: String, strCheck: @escaping (String?) -> (), errCheck: @escaping (Err?) -> ()) {
        let exp = expectation(description: desc)
        self.Hiraganalize(str: str, closure: { (str: String?, err: Err?) -> Void in
            strCheck(str)
            errCheck(err)
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 10)
    }
    
    func testNormal() {
        templateTest(desc: "Normal", str: "通常の文字列",
                     strCheck: { (str: String?) -> () in
                        XCTAssert(str != nil)
                     },
                     errCheck: { (err: Err?) -> () in
                        XCTAssert(err == nil)
                     })
    }
    
    func testNoInput() {
        templateTest(desc: "NoInput", str: "",
                     strCheck: { (str: String?) -> () in
                        XCTAssert(str == nil)
                     },
                     errCheck: { (err: Err?) -> () in
                        XCTAssert(err == Err.NoInputCharacter)
                     })
    }
    
    func testLongStr() {
        let longStr = "すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章すごく長い文章"
        templateTest(desc: "LongStr", str: longStr,
                     strCheck: { (str: String?) -> () in
                        XCTAssert(str != nil)
                        print(str ?? "")
                     },
                     errCheck: { (err: Err?) -> () in
                        XCTAssert(err == nil)
                     })
    }
    
    func testSymbol() {
        let symbolStr = "!\"#$%&'()=~|-^¥@[`{;:]+*},./_<>?_"
        templateTest(desc: "Symbol", str: symbolStr,
                     strCheck: { (str: String?) -> () in
                        XCTAssert(str != nil)
                        print(str ?? "")
                     },
                     errCheck: { (err: Err?) -> () in
                        XCTAssert(err == nil)
                     })
    }
    
    func testNumEng() {
        let str = "abcdefghijklmnopqrstuvwxyz0123456789"
        templateTest(desc: "NumEng", str: str,
                     strCheck: { (str: String?) -> () in
                        XCTAssert(str != nil)
                        print(str ?? "")
                     },
                     errCheck: { (err: Err?) -> () in
                        XCTAssert(err == nil)
                     })
    }
    
    func testRand() {
        let str = "asdfgja;posiufjp:oawekf:poiajs@ovjake89ru-23q~0)(0=I`=0)I(0=}*?*>*+*PL{`+>*+L+|~=0)('&%$#!?><>X<+LKNBLKUSHDVjkbhfglhd;zvhzdilfhvkjzfkv愛fじゃおsdfjぽ足jhdfごあいjg；ぁhjふぃおあそえfらおsdhふぉあ；jvg；亜gdjf；lgkvアポイjふぁsdぎあsjがゔぃあhjv上；亜sfdbv；じゃsdjrふぁhgじゃいhjfgasihjあsゴフィhじゃfdvじゃs；追いfhじゃs"
        templateTest(desc: "NumEng", str: str,
                     strCheck: { (str: String?) -> () in
                        XCTAssert(str != nil)
                        print(str ?? "")
                     },
                     errCheck: { (err: Err?) -> () in
                        XCTAssert(err == nil)
                     })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
