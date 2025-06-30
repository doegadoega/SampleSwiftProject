//
//  String+File.swift
//  LessonProject
//
//  Created by Hiroshi Egami on 2025/06/25.
//

import Foundation

/// Temporary領域に保存されているファイルパスを管理
extension String {
    /// String (ファイル名)に対して、temporary領域に保存されているイメージのファイルパスを取得する。
    var temporaryDirectoryImageFilePath: String? {
        // temporary領域のパスを取得
        let tmpDictory = NSHomeDirectory() + "/tmp"
        let filePath = tmpDictory + "/\(self).jpg"
        
        debugPrint(filePath)
     
        return filePath
    }
    
    /// ファイル名に対してtemporary領域に保存されているイメージのURLを取得する。
    var temporaryDirectoryImageFileURL: URL? {
        guard let path = self.temporaryDirectoryImageFilePath
        else {
            return nil
        }
        
        return URL(fileURLWithPath: path)
    }
}
