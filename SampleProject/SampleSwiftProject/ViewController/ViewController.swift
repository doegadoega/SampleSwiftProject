//
//  ViewController.swift
//  SampleSwiftProject
//
//  Created by Hiroshi Egami on 2025/05/31.
//

import UIKit

class ViewController: UIViewController {
    var titleString: String = "test"
    
    var items = [String]()
    
    /// ログイン画面へ遷移
    @IBAction func gotoLoginVC(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showLogin",
                          sender: self)
        
//        let storyboard = UIStoryboard(name: "Login", bundle: nil)
//        
//        guard let loginVC = storyboard.instantiateInitialViewController() as? LoginViewController
//        else {
//            debugPrint("LoginViewControllerに遷移できませんでした")
//            return
//        }
//        loginVC.titleString = self.titleString
//        
//        self.present(loginVC, animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.getItem()
    }
    
    private func getItem() -> [String] {
        // 通信処理が行われた
        
        // モデルを受領
        
        return [String]()
    }
}

/// FIXME: あとで、ViewController+Segue.swiftに分割する
extension ViewController {
    /// Segueが呼ばれると、このちらのライフサイクルも呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segueの識別子を確認
        if segue.identifier == "showLogin" {
            // 遷移先のViewControllerを取得
                        
            if let loginVC = segue.destination as? LoginViewController {
                // 必要なデータを渡す場合はここで設定
                // LoginVC 側にインターフェースとなるオブジェクトを配置
                // 例: loginVC.someProperty = someValue
                loginVC.titleString = self.titleString
            }
        }
    }
        
    /// ViewControllerに戻ってきた時の処理
    @IBAction func backToViewController(segue: UIStoryboardSegue) {
        // ViewControllerのことです
        if let vc = segue.source as? LoginViewController,
            let string = vc.titleString {
            debugPrint("ViewController きた")
            self.titleString = string
            
            debugPrint(self.titleString)
        }
        
        // みんな大好きガードレット
        guard let vc = segue.source as? LoginViewController,
              let string = vc.titleString
        else {
            return
        }
        debugPrint("ViewController きた２")
        debugPrint(string)
    }
}
