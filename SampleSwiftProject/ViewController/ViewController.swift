//
//  ViewController.swift
//  SampleSwiftProject
//
//  Created by Hiroshi Egami on 2025/05/31.
//

import UIKit

class ViewController: UIViewController {
    /// ログイン画面へ遷移
    @IBAction func gotoLoginVC(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showLogin",
                          sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//// FIXME: あとで、ViewController+Segue.swiftに分割する
//extension ViewController {
//    /// Segueが呼ばれると、このちらのライフサイクルも呼ばれる
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Segueの識別子を確認
//        if segue.identifier == "showLogin" {
//            // 遷移先のViewControllerを取得
//            if let loginVC = segue.destination as? LoginViewController {
//                // 必要なデータを渡す場合はここで設定
//                // 例: loginVC.someProperty = someValue
//            }
//        }
//    }
//    
//    /// ViewControllerに戻ってきた時の処理
//    @IBAction func backToViewController(segue: UIStoryboardSegue) {
//        
//    }
//}
