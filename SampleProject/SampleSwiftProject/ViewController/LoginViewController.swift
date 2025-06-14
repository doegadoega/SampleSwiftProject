//
//  LoginViewController.swift
//  SampleSwiftProject
//
//  Created by Hiroshi Egami on 2025/06/03.
//

import UIKit

/// ログインを想定した画面
class LoginViewController: UIViewController {
    /// タイトルを定義
    var titleString: String? = nil
    var descripotionString: String? = nil
    
    /// ログインタイトル
    @IBOutlet private weak var loginTitleLabel: UILabel! {
        didSet {
            loginTitleLabel.text = "ログイン"
        }
    }
    /// ログインIDテキストフィールド
    @IBOutlet private weak var loginTextTextField: UITextField! {
        didSet {
            loginTextTextField.placeholder = "ログインIDを入力してください"
        }
    }
    /// パスワードタイトル
    @IBOutlet private weak var passwordTitleLabel: UILabel! {
        didSet {
            passwordTitleLabel.text = "パスワード"
        }
    }
    /// パスワードテキスト
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = "パスワードを入力してください"
            passwordTextField.textContentType = .password
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let string = self.titleString {
            debugPrint("titleString = \(string)")
            self.titleString = "Loginからきたよ。"
        }
    }

}
