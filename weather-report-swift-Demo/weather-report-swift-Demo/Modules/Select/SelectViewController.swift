//
//  SelectViewController.swift
//  weather-report-swift-Demo
//
//  Created by 姜凯文 on 2019/12/23.
//  Copyright © 2019 姜凯文. All rights reserved.
//

import UIKit

let selectCellIdentifier = "SelectCellIdentifier"

class SelectViewController: UIViewController {
    let tmpMutArr: NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        
        let mainView = SelectView(frame: self.view.bounds)
        mainView.addTouchClosure = {
            let seekViewController = SeekViewController()
            seekViewController.dicColsure = {
                (tmpDic) -> () in
                print("SDSDSDSDSD")
                print(tmpDic)
                self.tmpMutArr.add(tmpDic)
                mainView.selectTableView.reloadData()
            }
            self.present(seekViewController, animated: false, completion: nil)
        }
        self.view = mainView

        print(mainView.selectTableView)
        mainView.selectTableView.delegate = self;
        mainView.selectTableView.dataSource = self;

        mainView.selectTableView.register(SelectTableViewCell.self, forCellReuseIdentifier:selectCellIdentifier)
        
    }
}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmpMutArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SelectTableViewCell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier, for: indexPath) as! SelectTableViewCell
        cell.updataData(resDic: tmpMutArr[indexPath.row] as! [String : String])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kDeviceHeight * 0.1175
    }

   
}
