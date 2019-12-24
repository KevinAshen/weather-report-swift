//
//  SelectView.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/23.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit
let kDeviceWidth = UIScreen.main.bounds.width
let kDeviceHeight = UIScreen.main.bounds.height

// FIXME:必须这样吗
typealias touchClosure = ()->()

class SelectView: UIView {

    var selectTableView: UITableView
    var addButton: UIButton
    var bottomView: UIView
    var addTouchClosure: touchClosure
    override init(frame: CGRect) {

        let backgroundImage = UIImage.init(named: "SelectView_backgroundImage.png")

        self.selectTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceHeight * 0.94))
        self.selectTableView.backgroundColor = .clear

        self.bottomView = UIView.init(frame: CGRect(x: 0, y: kDeviceHeight * 0.94, width: kDeviceWidth, height: kDeviceHeight * 0.06))

        self.addButton = UIButton.init(frame: CGRect(x: kDeviceWidth * 0.9, y: kDeviceHeight * 0.06 * 0.15, width: kDeviceWidth * 0.1, height: kDeviceHeight * 0.06 * 0.8))
        self.addButton.setImage(UIImage.init(named: "SelectView_bottomView_addButton_image"), for: .normal)
        self.addTouchClosure = {}
        super.init(frame: frame)
        self.addSubview(self.selectTableView)
        self.addSubview(self.bottomView)
        self.bottomView.addSubview(self.addButton)
        self.addButton.addTarget(self, action: #selector(touchAdd), for: .touchUpInside)
        self.layer.contents = backgroundImage?.cgImage

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func touchAdd() {
        //let seekViewController = SeekViewController.init()
        print("touchAdd")
        self.addTouchClosure()
    }
}
