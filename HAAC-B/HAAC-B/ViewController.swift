//
//  ViewController.swift
//  HAAC-B
//
//  Created by Ana Ma on 12/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit
import Alamofire
import TwicketSegmentedControl

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articleCellIdentifier = "articleCellIdentifier"

    var articles: [(Article, UIImage)] = []
    
    let segmentTitles = ["Business Insider", "Time", "CNN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 150
        
        let frame = CGRect(x: 5, y: 75, width: view.frame.width - 10, height: 40)
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(segmentTitles)
        segmentedControl.delegate = self
        
        view.addSubview(segmentedControl)
        
    }
    
    func load() {
        APIRequestManager.shared.getData { (allArticles: [(Article, UIImage)]?) in
            guard let allArticles = allArticles else { return }
            self.articles = allArticles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleCellIdentifier, for: indexPath) as! articleTableViewCell
        cell.articletitleLabel.text = self.articles[indexPath.row].0.title
//        cell.articleImageView.image = self.articles[indexPath.row].1
        
        DispatchQueue.main.async {
            let url = NSURL(string:self.articles[indexPath.row].0.urlToImage)
            let data = NSData(contentsOf:url! as URL)
            if data != nil {
                cell.articleImageView.image = UIImage(data:data! as Data)
            }
        }
        return cell
    }

    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        UIApplication.shared.open(URL(string: article.0.url)!)
    }
}

extension ViewController: TwicketSegmentedControlDelegate {
    func didSelect(_ segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            APIRequestManager.shared.source = "business-insider"
            load()
        case 1:
            APIRequestManager.shared.source = "time"
            load()
        case 2:
            APIRequestManager.shared.source = "cnn"
            load()
        default:
            print("Never reaches this point.")
        }
    }
}
