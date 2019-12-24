//
//  Manager.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/23.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit

//typealias StrColsure = (String) -> ()
typealias successHandle = ([String : String]) -> ()

class Manager: NSObject {
    private static let sharedManager: Manager = {
        let shared = Manager()
        return shared
    }()
    class func shared() -> Manager {
        return sharedManager
    }
    func fetchLatestWeather(str: String, successColsure:@escaping successHandle) -> () {
        let testUrlStr = "https://free-api.heweather.com/s6/weather?location=" + str + "&key=0b32342eb6a14669a0ab16cfca9f1785"
        print(testUrlStr)
        let url = URL(string: testUrlStr)
        let request = URLRequest(url: url!)

        var resDic = [String : String]()
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                let dic: NSDictionary = self.JSONToFunction(AnyData: data) as! NSDictionary
                let modelArr = SelectModel.initWithDic(dic: dic)
//                print(modelArr.arr[0]["basic"])
                resDic = modelArr.arr[0]["basic"] as! [String : String]

//                resDic = modelArr.arr[0] as! [String : [String : String]]
                successColsure(resDic)

            }
        }
        dataTask.resume()
    }
    func JSONToFunction(AnyData: Data!) -> Any {
        if JSONSerialization.isValidJSONObject(AnyData) {
            return NSNull.init()
        }
        return try! JSONSerialization.jsonObject(with: AnyData, options: .mutableContainers)
    }
}
