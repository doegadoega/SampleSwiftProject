//
//  UserDefaultsKeyType.swift
//  LessonProject
//
//  Created by Hiroshi Egami on 2025/06/15.
//

import Foundation

/// UserDefaultで管理する値とKeyを管理します。
enum UserDefaultsKeyType: String {
    /// gourmetAPI: GourmetAPIのGetした内容をString型で保存
    case gourmetAPI = "gourmetAPI"
}

extension UserDefaultsKeyType {
    /// UserDefaultsKeyTypeで定義したKeyに対して、文字列で値を返す。
    func getStringValue() -> String? {
        return UserDefaults.standard.string(forKey: self.rawValue)
    }

    /// UserDefaultに文字列を保存。保存に成功した場合、true、失敗した場合 falseを返す
    func setStringValue(string: String?) -> Bool {
        guard let string = string
        else {
            debugPrint("💥💥 UserDefaultsKeyTypeで文字列の保存に失敗しました。値にNilが入っています。 💥💥")
            return false
        }
        // UserDefaultに文字列を保存
        UserDefaults.standard.set(string, forKey: self.rawValue)
        // UserDefaultsを保存した内容を反映する処理
        UserDefaults.standard.synchronize()
                
        return true
    }
    
    /// UserDefaultに値（Any）を保存
    func setValue(value: Any?) {
        // UserDefaultに値（Any）を保存
        UserDefaults.standard.set(value, forKey: self.rawValue)
        // UserDefaultsを保存した内容を反映する処理
        UserDefaults.standard.synchronize()
    }
}
