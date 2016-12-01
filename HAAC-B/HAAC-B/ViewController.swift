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
    
    var articles: [Article] = []
    let segmentTitles = ["Business Insider", "Time", "CNN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        tableView.delegate = self
        tableView.dataSource = self
        
        let frame = CGRect(x: 5, y: 75, width: view.frame.width - 10, height: 40)
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(segmentTitles)
        segmentedControl.delegate = self
        
        view.addSubview(segmentedControl)
        
    }
    
    func load() {
        APIRequestManager.shared.getData { (allArticles: [Article]?) in
            guard let allArticles = allArticles else { return }
            DispatchQueue.main.async {
                self.articles = allArticles
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.articles.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleCellIdentifier, for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        
        //        APIRequestManager.shared.getImage(imageString: articlesArr[indexPath.row].urlToImage) { (data: Data?) in
        //            guard let validData = data else { return }
        //            DispatchQueue.main.async {
        //                cell.imageView?.image = UIImage(data: validData)
        //                dump(validData)
        //            }
        //        }
        
        //        APIRequestManager.shared.getImage2(imageString: articlesArr[indexPath.row].urlToImage) { (data: Data?) in
        //            guard let validData = data else { return }
        //            DispatchQueue.main.async {
        //                cell.imageView?.image = UIImage(data: validData)
        //                dump(validData)
        //            }
        //        }
        //
        Alamofire.download(articles[indexPath.row].urlToImage).responseData { response in
            if let data = response.result.value {
                DispatchQueue.main.async {
                    dump(data)
                    cell.imageView?.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        UIApplication.shared.open(URL(string: article.url)!)
        
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
