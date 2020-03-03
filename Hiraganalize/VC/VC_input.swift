//
//  ViewController.swift
//  Hiraganalize
//
//  Created by Yushi Nakaide on 2020/03/03.
//  Copyright © 2020 TonTech. All rights reserved.
//

import UIKit

class VC_input: UIViewController, InputDelegate {
    
    func InputFinished(str: String) {
        print(str)
        
        let vcNext = VC_result()
        self.present(vcNext, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view = View_input(frame: UIScreen.main.bounds, vc: self)
        
    }
    


}

