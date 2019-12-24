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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green

        let mainView = SelectView(frame: self.view.bounds)
        mainView.addTouchClosure = {
            let seekViewController = SeekViewController()
            self.present(seekViewController, animated: false, completion: nil)
        }
        self.view = mainView

        print(mainView.selectTableView)
        mainView.selectTableView.delegate = self;
        mainView.selectTableView.dataSource = self;

        mainView.selectTableView.register(UITableViewCell.self, forCellReuseIdentifier:selectCellIdentifier)
        
    }
}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: selectCellIdentifier)
        cell?.backgroundColor = UIColor.init(white: 0, alpha: 0.55)
        cell?.textLabel?.text = "JKWJKJWKJWKJWKJWKJWKJWKW测试数据\(indexPath.row)"
        cell?.textLabel?.textColor = .white
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

   
}
