//
//  PreviewTransitionTableViewController.swift
//  HAAC-B
//
//  Created by Ana Ma on 12/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//
/*
import UIKit
import Alamofire
import SwiftyJSON

class PreviewTransitionTableViewController: PTTableViewController {
    
    var articleCellIdentifier = "articleCellIdentifier"
    
    var articlesArr: [Article] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIRequestManager.shared.getData(source: "business-insider") { (allArticles) in
            guard let validArticles = allArticles else { return }
            DispatchQueue.main.async {
                self.articlesArr = validArticles
                self.tableView.reloadData()
                //                dump(self.articlesArr)
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.articlesArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleCellIdentifier, for: indexPath)
        cell.textLabel?.text = articlesArr[indexPath.row].title
        
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
        Alamofire.download(articlesArr[indexPath.row].urlToImage).responseData { response in
            if let data = response.result.value {
                DispatchQueue.main.async {
                    dump(data)
                    cell.imageView?.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
*/
