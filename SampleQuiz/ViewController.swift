//
//  ViewController.swift
//  SampleQuiz
//
//  Created by 遠山　聡美 on 2017/12/28.
//  Copyright © 2017年 Simple. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBAction func tapSystemSound(_ sender: Any) {
        AudioServicesPlayAlertSoundWithCompletion(1027) {
            //サウンドが鳴り終わった後に行う処理
        }
    }
    
    @IBAction func tapCastomSound(_ sender: Any) {
        //指定するサウンドファイルの再生時間が30秒以下であること
        let soundUrl = Bundle.main.url(forResource: "taiko01", withExtension: "mp3")
        
        //サウンドIDを登録するための変数を準備
        var soundId: SystemSoundID = 0
        //サウンドファイルを登録してサウンドIDを取得 「&」は参照渡し
        AudioServicesCreateSystemSoundID(soundUrl as! CFURL, &soundId)
        AudioServicesPlayAlertSoundWithCompletion(soundId){
            //サウンドが鳴り終わった後に行う処理
        }
    }
    
    @IBAction func tapVibration(_ sender: Any) {
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate)  {
            //バイブレーションがなり終わった後におこなう処理
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

