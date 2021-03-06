//
//  SeekViewController.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/23.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit
typealias DicColsure = ([String : String]) -> ()

class SeekViewController: UIViewController, UISearchBarDelegate {
    let topSearchBar: UISearchBar = UISearchBar()
    var dicColsure: DicColsure? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        let mainView = SeekView(frame: self.view.bounds)
        self.view = mainView
        mainView.touchStr = {
            (str: String) -> () in
            let share = Manager.shared()
            share.fetchLatestWeather(str: str) { (resDic) in
                print(resDic)
                DispatchQueue.main.async {
                    self.dismiss(animated: false) {
                        self.dicColsure!(resDic)
                    }
                }

            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
