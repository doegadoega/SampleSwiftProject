//
//  ViewController.swift
//  LessonProject
//
//  Created by Hiroshi Egami on 2025/06/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getGourmetAPI()
    }

    /// 課題：iOSSDKを使って通信モジュールを作ってみる。
    /// ホットペッパーグルメのグルメサーチAPIから情報を取得する
    private func getGourmetAPI() {
        debugPrint("start getGourmetAPI")
        
        let urlString = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6e933c6b4a0b50e7&format=json&large_service_area=SS10"
        
        guard let url = URL(string: urlString)
        else {
            debugPrint(" Url is Nil! ")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // エラーの情報を取得
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
                         
            guard let response = response as? HTTPURLResponse,
                  let data
            else {
                return
            }

            debugPrint(response.description)
            if response.statusCode == 200 {
                // Lession1は完了
                debugPrint("通信成功！")
                
                // 文字列を取得
                if let string = String(data: data, encoding: .utf8) {
                    // Lession2は完了?
                    debugPrint(string)
                }
            } else {
                debugPrint("通信失敗")
            }
            
        }
        task.resume()
    }
}

