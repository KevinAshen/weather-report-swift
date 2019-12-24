//
//  Manager.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/23.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit

class Manager: NSObject {
    private static let sharedManager: Manager = {
        let shared = Manager()
        return shared
    }()
    class func shared() -> Manager {
        return sharedManager
    }
    func getWeather(str: String) -> () {
        let testUrlStr = "https://free-api.heweather.com/s6/weather?location=" + str + "&key=0b32342eb6a14669a0ab16cfca9f1785"
        print(testUrlStr)
        let url = URL(string: testUrlStr)
        let request = URLRequest(url: url!)


        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            <#code#>
        }
    }

}
