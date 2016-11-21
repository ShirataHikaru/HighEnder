//
//  ViewController.swift
//  HighEnder
//
//  Created by 白田光 on 2016/11/19.
//  Copyright © 2016年 白田光. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate,UIPickerViewDelegate {

    var pushedCount:Int = 0
    var urawaza:Int = 0
    
    let ud = UserDefaults.standard
    
    @IBAction func toProView(_ sender: UIBarButtonItem) {
        urawaza += 1
        if(urawaza == 10){
            // インスタンス生成　styleはActionSheet.
            let myAlert = UIAlertController(title: "隠しコマンド起動", message: "隠しモードに移動しますか？", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            // アクションを生成.
            let myAction_1 = UIAlertAction(title: "yes", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in
                //画面遷移させたい
                self.performSegue(withIdentifier: "toProView", sender: self)
            })
            
            let myAction_2 = UIAlertAction(title: "yes", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in
                //画面遷移させたい
                self.performSegue(withIdentifier: "toProView", sender: self)
            })
            
            // アクションを追加.
            myAlert.addAction(myAction_1)
            myAlert.addAction(myAction_2)
            
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    //ボタン
    @IBOutlet weak var mySoundBtn: UIButton!
        //押された瞬間
    @IBAction func mySoundBtnPushed(_ sender: Any) {
        pushedAudioPlayer.play()
    }
    
    //離された瞬間
    @IBAction func mySoundBtnReleased(_ sender: Any) {
        releasedAudioPlayer.play()
        pushedCount += 1
        self.navigationItem.title = "\(pushedCount)回押されたEnter"
        //key:countで,押された回数を保存
        ud.set(pushedCount, forKey: "count")
    }
    
    
    //ピッカービュー
    @IBOutlet weak var myPickerView: UIPickerView!
    
    //オーディオプレイヤー
    private var pushedAudioPlayer = AVAudioPlayer()
    private var releasedAudioPlayer = AVAudioPlayer()
    
    let myValues:[String] = ["Realforce","HHKB","ただのキーボード"]
    
    // UIImage のインスタンスを設定
    private let image0:UIImage = UIImage(named:"./asset/realforce.png")!
    private let image1:UIImage = UIImage(named:"./asset/happyhacking.png")!
    private let image2:UIImage = UIImage(named:"./asset/yasui.png")!
    
    // UIImage の配列を作る
    private var imageListArray :Array<UIImage> = []
    
    //サウンドファイルのインスタンスを設定
    //押された時
    private let sound0 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/RFEnterStart", ofType: "mp3")!)
    private let sound1 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/HHStart", ofType: "mp3")!)
    private let sound2 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/kbStart", ofType: "mp3")!)
    
    //離された時
    private let sound3 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/RFEnterEnd", ofType: "mp3")!)
    private let sound4 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/HHEnd", ofType: "mp3")!)
    private let sound5 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "./asset/kbEnd", ofType: "mp3")!)
    
    
    //NSURLの配列を作る
    private var pushedsoundListArray :Array<NSURL>  = []
    private var releasedsoundListArray :Array<NSURL>  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mySoundBtn.setImage(image0, for: UIControlState())
        
        imageListArray.append(image0)
        imageListArray.append(image1)
        imageListArray.append(image2)
        
        pushedsoundListArray.append(sound0)
        pushedsoundListArray.append(sound1)
        pushedsoundListArray.append(sound2)
        
        releasedsoundListArray.append(sound3)
        releasedsoundListArray.append(sound4)
        releasedsoundListArray.append(sound5)

        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[0] as URL);
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[0] as URL);
        
        pushedAudioPlayer.prepareToPlay()
        releasedAudioPlayer.prepareToPlay()
        
        pushedAudioPlayer.delegate = self
        releasedAudioPlayer.delegate = self
        
        myPickerView.delegate = self
        
        if ud.bool(forKey: "firstLaunch") {
            // 初回起動時の処理
            pushedCount = 0
            ud.set(pushedCount, forKey: "count")
            
            // 2回目以降の起動では「firstLaunch」のkeyをfalseに
            ud.set(false, forKey: "firstLaunch")
        }else{
            pushedCount = ud.object(forKey: "count") as! Int
        }
        
        urawaza = 0
        self.navigationItem.title = "\(pushedCount)回押されたEnter"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        urawaza = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //pickerに表示する行数を返すデータソースメソッド.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    
    //pickerに表示する値を返すデリゲートメソッド.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myValues[row]
    }
    
    
    //pickerが選択された際に呼ばれるデリゲートメソッド.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mySoundBtn.setImage(imageListArray[row], for: UIControlState())
        pushedAudioPlayer = try! AVAudioPlayer(contentsOf: pushedsoundListArray[row] as URL);
        releasedAudioPlayer = try! AVAudioPlayer(contentsOf: releasedsoundListArray[row] as URL);
    }
    
    

}

