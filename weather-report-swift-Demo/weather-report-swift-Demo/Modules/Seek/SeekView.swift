//
//  SeekView.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/23.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit

typealias StrColsure = (String) -> ()

class SeekView: UIView {
    let inputTextField: UITextField = UITextField()
    let touchButton: UIButton = UIButton()
    var touchStr: StrColsure
    override init(frame: CGRect) {

        self.touchStr = {
            (str: String) -> () in
            print(str)
        }
        super.init(frame: frame)
        let backgroundImage = UIImage.init(named: "SeekView_backgroundImage.jpg")
        self.layer.contents = backgroundImage?.cgImage

        self.inputTextField.frame = CGRect(x: 50, y: 50, width: 300, height: 50)
        self.addSubview(self.inputTextField)

        self.inputTextField.backgroundColor = .white

        self.touchButton.frame = CGRect(x: 200, y: 200, width: 100, height: 30)
        self.addSubview(self.touchButton)

        self.touchButton.backgroundColor = .yellow
        self.touchButton.addTarget(self, action: #selector(touchReturn), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func touchReturn() {
        //let seekViewController = SeekViewController.init()
        print("touchReturn")
        self.touchStr(inputTextField.text ?? "13")
    }
}
