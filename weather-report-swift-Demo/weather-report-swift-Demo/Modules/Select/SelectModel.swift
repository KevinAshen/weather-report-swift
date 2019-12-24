//
//  SelectModel.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/24.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit

//class HeWeatherModel: NSObject {
//    var basic = NSDictionary()
//    var update = NSDictionary()
//    var status = NSDictionary()
//    var now = NSDictionary()
//    var daily_forecast = NSDictionary()
//    var lifestyle = NSDictionary()
//}
//
//class dataModel: NSDictionary {
//    
//}

class SelectModel: NSObject {
    var arr = [NSDictionary]()

    class func initWithDic(dic: NSDictionary) -> SelectModel {
        let model = SelectModel.init()
        model.arr = dic["HeWeather6"] as! [NSDictionary]
        return model
    }
}
