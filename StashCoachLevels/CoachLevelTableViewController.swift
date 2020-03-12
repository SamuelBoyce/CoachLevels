//
//  CoachLevelTableViewController.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 2/13/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import UIKit

class CoachLevelTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: CoachLevelViewCell.self), bundle: nil), forCellReuseIdentifier: CoachLevelViewCell.reuseIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let thisCell = tableView.dequeueReusableCell(withIdentifier: CoachLevelViewCell.reuseIdentifier) else {
            return UITableViewCell()
        }
        
        thisCell.backgroundColor = .red
        return thisCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height - (navigationController?.navigationBar.frame.height ?? 0)
        return screenHeight/3
    }
}
