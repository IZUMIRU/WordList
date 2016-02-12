//
//  AddViewController.swift
//  WordList
//
//  Created by 森泉亮介 on 2016/02/11.
//  Copyright © 2016年 森泉亮介. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    
    //NSUserDefaultsを配列から読み込ませる
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.arrayForKey("WORD") != nil {
            wordArray = saveData.arrayForKey("WORD")!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //保存ボタンを押された時のメソッド
    //まずwordDictionaryという辞書に値を入れる
    //その辞書を配列にappend(追加)する
    //保存完了後、アラート表示
    
    @IBAction func saveWord() {
        let wordDictionary =
            ["english":englishTextField.text, "japanese":japaneseTextField.text]
        
        wordArray.append(String(wordDictionary))
        saveData.setObject(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        self.presentViewController(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text  = ""
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
