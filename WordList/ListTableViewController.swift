//
//  ListTableViewController.swift
//  WordList
//
//  Created by 森泉亮介 on 2016/02/11.
//  Copyright © 2016年 森泉亮介. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    //wordArrayを追加する
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableViewControllerからTableViewCellを使えるようにする
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //saveDataというNSUserDefaults(メモリ)を追加する
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    //TableViewで基本となる3つのメソッドを追加する
    
    //numberOfSectionsInTableView：セクションの数を設定する（セクションとはTableViewにおいてひとつのまとまりのこと）
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //numberOfRowsInSection：セルの個数を指定する（RowとはTableViewにおいてひとつのセルのこと）
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }

    
    //cellForRowAtIndexPath：セルの中身の表示の仕方を設定する
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        
        //wordArrayを取り出す
        let nowIndexPathDictionary: (AnyObject) = wordArray[indexPath.row]
        
        //ラベルに代入する
        cell.englishLabel.text = nowIndexPathDictionary["english"] as? String
        cell.japaneseLabel.text = nowIndexPathDictionary["japanese"] as? String

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
