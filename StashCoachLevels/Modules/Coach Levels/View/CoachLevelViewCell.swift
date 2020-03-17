//
//  CoachLevelViewCell.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 2/13/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import UIKit

class CoachLevelViewCell: UITableViewCell {
    static let reuseIdentifier: String = String(describing: self)
    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var levelFrameView: UIView!
    
    //This construction will prevent cells from downloading the incorrect image as they are recycled. It's not ideal, however, as it will lead to many more image downloads than needed as a new one is started every time the cell is dequeued. An ideal solution would have image caching so that only one download task happened per Level. Even better would be to have a queue that held all of the data tasks as cells are scrolled, this way incomplete tasks could be suspended and resumed as their corresponding cells left and re-entered the tableview.
    var dataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 1.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 25.0, left: 30.0, bottom: 0.0, right: 30.0))
        levelFrameView.layer.masksToBounds = true
        levelFrameView.layer.cornerRadius = levelFrameView.bounds.width / 2
        levelFrameView.alpha = 0.90
    }
    
    func formatForCoachLevel(level: CoachLevel) {
        levelLabel.text = level.level
        progressLabel.text = "\(level.progress)pts"
        totalLabel.text = "\(level.total)pts"
        progressBar.progress = Float(level.progress) / Float(level.total)
        
        contentView.alpha = level.accessible ? 1.0 : 0.5
        
        if let url = URL(string: level.imageUrl) {
            dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
                DispatchQueue.main.async {
                    if let data = data { self.imageView!.image = UIImage(data: data) }
                }
            })
        }
    }
    
    func downloadImage() {
        dataTask?.resume()
    }
    
    func haltDownload() {
        dataTask?.cancel()
    }
}
