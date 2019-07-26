//
//  ViewController.swift
//  LocalNotification
//
//  Created by 香川紗穂 on 2019/07/25.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

import UIKit
//追加　通知の機能を読み込む
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldContent: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

//    ボタンがクリックされた時に....
    @IBAction func didClickButton(_ sender: UIButton) {
//   ①通知のオブジェクト作成（インスタンス化）
        let content = UNMutableNotificationContent()
        
        
        
        
//   ②通知のオブジェクト... タイトル、内容、音の設定
//        （オプショナルバインディング）
        if let text = textFieldTitle.text{
//        （これだと、ムリやりはがしてnilだったらエラー出る）
//         （content.title = textFieldTitle.text!）
            content.title = text
        }
       // 内容の設定
        if let text = textFieldContent.text{
            content.body = text
        }
       //通知音の設定
        content.sound = .default
        
        
        
//    ③通知時間のオブジェクト作成
        var notificationTime = DateComponents()

        
        
//    ④時間の設定
//        hourの設定
        notificationTime.hour = Calendar.current.component(.hour, from: datePicker.date)
//        minutesの設定
        notificationTime.minute = Calendar.current.component(.minute, from: datePicker.date)
        
        
//    ⑤するためにまず！！トリガーを作成
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        
//    ⑤トリガーをもとに 通知のリクエストを登録
//        トリガーの作成
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
//        トリガーの登録
        UNUserNotificationCenter.current().add(request,withCompletionHandler: nil)
    }
    
}

