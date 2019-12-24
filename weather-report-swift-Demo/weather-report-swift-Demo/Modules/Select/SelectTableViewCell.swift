//
//  SelectTableViewCell.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/24.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell {
    let timeLabel = UILabel()
    let locationLabel = UILabel()
    let temperatureLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear

        self.timeLabel.textColor = .white
        self.timeLabel.font = .boldSystemFont(ofSize: 15)
        self.addSubview(self.timeLabel)

        self.locationLabel.textColor = .white
        self.locationLabel.font = .boldSystemFont(ofSize: 25)
        self.addSubview(self.locationLabel)

        self.temperatureLabel.textColor = .white
        self.temperatureLabel.font = .boldSystemFont(ofSize: 45)
        self.addSubview(self.temperatureLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        self.timeLabel.frame = CGRect(x: kDeviceWidth * 0.05 * 0.5, y: kDeviceHeight * 0.1175 * 0.1 * 0.5, width: kDeviceWidth * 0.15 * 2, height: kDeviceHeight * 0.1175 * 0.4)

        self.locationLabel.frame = CGRect(x: kDeviceWidth * 0.05 * 0.5, y: kDeviceHeight * 0.1175 * 0.1 * 0.5 + kDeviceHeight * 0.1175 * 0.4, width: kDeviceWidth * 0.15 * 2, height: kDeviceHeight * 0.1175 * 0.4)

        self.temperatureLabel.frame = CGRect(x: kDeviceWidth * 0.7, y: kDeviceHeight * 0.1175 * 0.1, width: kDeviceWidth * 0.15 * 2, height: kDeviceHeight * 0.1175 * 0.8)
    }
    func updataData(resDic: [String : String]) -> () {
        print("JKWJKWJKW")
        print(resDic)
        //let basicDic: NSDictionary = resDic["basic"]! as NSDictionary
        //let nowDic: NSDictionary = resDic["now"]! as NSDictionary

        self.locationLabel.text = resDic["location"]
        self.temperatureLabel.text = resDic["cnty"]

    }
}
