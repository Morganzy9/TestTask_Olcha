//
//  MainViewController + UITableView.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/8/23.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()    
        cell.textLabel?.text = "Ola"
        return cell
    }
    
}
