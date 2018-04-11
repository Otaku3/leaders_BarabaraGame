//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by 大林拓実 on 2018/04/11.
//  Copyright © 2018年 Life is tech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView!    //上の画像
    @IBOutlet var imgView2: UIImageView!    //中の画像
    @IBOutlet var imgView3: UIImageView!    //下の画像
    
    @IBOutlet var resultLabel: UILabel!     //スコア表示
    
    var timer: Timer!   //画像を動かすためのタイマー
    var score: Int = 1000   //スコア
    let defaults: UserDefaults = UserDefaults.standard  //スコア保存用の変数
    
    let width: CGFloat = UIScreen.main.bounds.size.width    //画面幅
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]  //画像の位置の配列
    
    var dx: [CGFloat] = [1.0, 0.5, -1.0]    //画像を動かす幅の配列
    
    func start(){
        //結果ラベルを見えなくする
        resultLabel.isHidden = true
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func up(){
        for i in 0..<3 {
            //端に来たら動かす向きを逆にする
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i]   //画像の位置をdx分ずらす
        }
        imgView1.center.x = positionX[0]    //上の画像をずらした位置に移動させる
        imgView2.center.x = positionX[1]    //中の画像をずらした位置に移動させる
        imgView3.center.x = positionX[2]    //下の画像をずらした位置に移動させる
    }
    
    @IBAction func stop(){
        if timer.isValid == true{   //タイマーが動いていたら
            timer.invalidate()  //タイマーを止める（無効にする）
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2]     //画像の位置を画面幅の中心にする
        self.start()    //startメソッドを呼び出す

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
