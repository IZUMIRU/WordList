//
//  QuestionViewController.swift
//  WordList
//
//  Created by 森泉亮介 on 2016/02/11.
//  Copyright © 2016年 森泉亮介. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    //回答したか・次の問題にいくかの判定
    var isAnswered: Bool = false
    //ユーザーデフォルトからとる配列
    var wordArray: [AnyObject] = []
    //シャッフルされた配列
    var shuffledWordArray: [AnyObject] = []
    //現在の回答数
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }
    
    //viewが現れた時に呼ばれる
    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        
        //問題をシャッフルする
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
    }
    
    
    //次へを押した時のメソッド
    @IBAction func nextButtonPushed() {
        //回答したか、していないか
        if isAnswered {
            
            //次の問題へ
            nowNumber++
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffledWordArray.count {
                
                //次の問題を表示する
                questionLabel.text = shuffledWordArray[nowNumber]["engllish"] as? String
                
                //isAnsweredをfalseにする
                isAnswered = false
                
                //ボタンのタイトルを変更する
                nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
                
            } else {
                //これ以上表示する問題はないので、FinishViewに画面遷移
                self.performSegueWithIdentifier("toFinishView", sender: nil)
            }
            
        } else {
            //答えを表示する
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            
            //isAnsweredをtrueにする
            isAnswered = true
            
            //ボタンのタイトルを変更する
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //配列をランダムにシャッフルするメソッド
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(rand()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
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
