//
//  String+base64.swift
//  LessonProject
//
//  Created by Hiroshi Egami on 2025/06/25.
//

import Foundation

/// 文字列をBase64でエンコードする
extension String {
    /// 文字列をBase64でエンコードする / ImageURLをBase64でエンコードし、保存ファイル名とする
    var base64Encoded: String? {
        guard let dataUtf8 = self.data(using: .utf8) else {
            return nil
        }
        return dataUtf8.base64EncodedString()
    }
    
    /// 文字列をBase64でデコードする / ImageURLをBase64でデコードし、URLに戻す
    /// - Returns: デコードされた文字列
    var base64Decoded: String? {
        guard let data = Data(base64Encoded: self),
            let decodeString = String(data: data, encoding: .utf8) else {
            return nil
        }
        return decodeString
    }
}
