//
//  professionalViewController.swift
//  HighEnder
//
//  Created by 白田光 on 2016/11/19.
//  Copyright © 2016年 白田光. All rights reserved.
//

import UIKit
import AVFoundation

class professionalViewController: UIViewController,AVAudioPlayerDelegate {

    
    @IBOutlet weak var myTabBtn: UIButton!
    @IBOutlet weak var myShiftBtn: UIButton!
    @IBOutlet weak var myEnterBtn: UIButton!
    @IBOutlet weak var myCtrlBtn: UIButton!
    
    //Tab押した時
    @IBAction func tabPushed(_ sender: Any) {
        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[0] as URL);
        pushedAudioPlayer.play()
    }
    //Tab離した時
    @IBAction func tabReleased(_ sender: Any) {
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[0] as URL);
        releasedAudioPlayer.play()
    }
    
    //ctrl押した時
    @IBAction func ctrlPushed(_ sender: Any) {
        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[1] as URL);
        pushedAudioPlayer.play()
    }
    //ctrl離した時
    @IBAction func ctrlReleased(_ sender: Any) {
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[1] as URL);
        releasedAudioPlayer.play()
    }
    
    //enter押した時
    @IBAction func enterPushed(_ sender: Any) {
        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[2] as URL)
        pushedAudioPlayer.play()
    }
    //enter離した時
    @IBAction func enterReleased(_ sender: Any) {
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[2] as URL);
        releasedAudioPlayer.play()
    }
    
    //shift押した時
    @IBAction func shiftPushed(_ sender: Any) {
        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[3] as URL);
        pushedAudioPlayer.play()
    }
    //shift離した時
    @IBAction func shiftReleased(_ sender: Any) {
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[3] as URL);
        releasedAudioPlayer.play()
    }
    
    
    
    //押された時
    private let sound0 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/TabStart", ofType: "mp3")!)
    private let sound1 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/CtrlStart", ofType: "mp3")!)
    private let sound2 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/RFEnterStart", ofType: "mp3")!)
    private let sound3 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/ShiftStart", ofType: "mp3")!)
    
    //離された時
    private let sound4 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/TabEnd", ofType: "mp3")!)
    private let sound5 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/CtrlEnd", ofType: "mp3")!)
    private let sound6 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/RFEnterEnd", ofType: "mp3")!)
    private let sound7 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/ShiftEnd", ofType: "mp3")!)
    
    
    //NSURLの配列を作る
    private var pushedsoundListArray :Array<NSURL>  = []
    private var releasedsoundListArray :Array<NSURL>  = []
    
    //オーディオプレイヤー
    private var pushedAudioPlayer = AVAudioPlayer()
    private var releasedAudioPlayer = AVAudioPlayer()
    
    private let image0:UIImage = UIImage(named:"./asset/tab.png")!
    private let image1:UIImage = UIImage(named:"./asset/ctrl.png")!
    private let image2:UIImage = UIImage(named:"./asset/Enter.png")!
    private let image3:UIImage = UIImage(named:"./asset/shift.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //音追加
        pushedsoundListArray.append(sound0)
        pushedsoundListArray.append(sound1)
        pushedsoundListArray.append(sound2)
        pushedsoundListArray.append(sound3)
        
        releasedsoundListArray.append(sound4)
        releasedsoundListArray.append(sound5)
        releasedsoundListArray.append(sound6)
        releasedsoundListArray.append(sound7)
        
        //画像の設定
        myTabBtn.setImage(image0, for: UIControlState())
        myCtrlBtn.setImage(image1, for: UIControlState())
        myEnterBtn.setImage(image2, for: UIControlState())
        myShiftBtn.setImage(image3, for: UIControlState())
        
        //プレイヤーに音追加
        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[0] as URL);
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[0] as URL);
        
        //再生準備
        pushedAudioPlayer.prepareToPlay()
        releasedAudioPlayer.prepareToPlay()
        
        //Delegateの追加
        pushedAudioPlayer.delegate = self
        releasedAudioPlayer.delegate = self
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
