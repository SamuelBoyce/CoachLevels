//
//  CoachLevelTableViewController.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 2/13/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import UIKit

class CoachLevelTableViewController: UITableViewController {
    var presenter: ViewToPresenterProtocol?
    var levels: [CoachLevel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        
        tableView.register(UINib(nibName: String(describing: CoachLevelViewCell.self), bundle: nil), forCellReuseIdentifier: CoachLevelViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        presenter?.updateView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let thisCell = tableView.dequeueReusableCell(withIdentifier: CoachLevelViewCell.reuseIdentifier) as? CoachLevelViewCell else {
            return UITableViewCell()
        }
        let thisLevel = levels[indexPath.row]
        
        thisCell.formatForCoachLevel(level: thisLevel)
        thisCell.backgroundImage.image = UIImage(named: "placeholder")
        thisCell.downloadImage()
        
        return thisCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Set the height of a row such that three cards are visible and perhaps the top of the 4th card
        let topBar = (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0) + (navigationController?.navigationBar.frame.height ?? 0)
        let offsetAdjust: CGFloat = 44.0
        let screenHeight = tableView.bounds.height - topBar - offsetAdjust
        return screenHeight / 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CoachLevelViewCell else {
            return
        }
        cell.haltDownload()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CoachLevelTableViewController: PresenterToViewProtocol {
    func showCoachLevels(levels: CoachLevels) {
        self.levels = levels.achievements
        title = levels.overview.title
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Levels", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
