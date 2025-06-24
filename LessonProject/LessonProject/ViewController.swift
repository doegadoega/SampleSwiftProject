//
//  ViewController.swift
//  LessonProject
//
//  Created by Hiroshi Egami on 2025/06/13.
//

import UIKit

class ViewController: UIViewController {
    
    var model: [String: Any]?
    var errorType: ErrorType?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                self.model = try await self.getGourmetAPI()
                if let model = self.model,
                    let results = model["results"] as? [String: Any],
                   let shops = results["shop"] as? [[String: Any]],
                   let shop = shops.first {
                    // Lesson6 完了
                    debugPrint(shop["logo_image"] ?? "ロゴないよー")
                    
                    // Lesson7
                    try await self.saveShopImage(shop: shop)
                } else {
                    debugPrint("modelの取得に失敗")
                }
            }
            catch let error as ErrorType {
                self.errorType = error
            }
            catch {
                self.errorType = .systemError(error)
            }
        }
    }

    /// 課題：iOSSDKを使って通信モジュールを作ってみる。
    /// ホットペッパーグルメのグルメサーチAPIから情報を取得するs
    private func getGourmetAPI() async throws -> [String: Any] {
        debugPrint("start getGourmetAPI")
        
        let urlString = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=6e933c6b4a0b50e7&format=json&large_service_area=SS10"
        
        guard let url = URL(string: urlString)
        else {
            debugPrint(" URL is nil! ")
            throw ErrorType.unknow
        }
        
        let request = URLRequest(url: url)
        let task = try await URLSession.shared.data(for: request)
        
        guard let response = task.1 as? HTTPURLResponse
        else {
            throw ErrorType.unknow
        }
        
        let data = task.0
        
        debugPrint(response.description)
        switch response.statusCode {
        case 200..<400:
            debugPrint("HTTP Status Code: 2xx")
            
            // 文字列を取得
            if let string = String(data: data, encoding: .utf8),
               UserDefaultsKeyType.gourmetAPI.setStringValue(string: string) {
                // Lesson2は完了?
                debugPrint(string)
                
                // Lesson4完了
                guard let gourmetAPIString = UserDefaultsKeyType.gourmetAPI.getStringValue()
                else {
                    throw ErrorType.unknow
                }
                
                let result = self.convertToDictionary(gourmetAPIString: gourmetAPIString)
                switch result {
                case let .success(dictionary):
                    return dictionary
                case let .failure(error):
                    debugPrint(error.localizedDescription)
                    throw error
                }
            } else {
                throw ErrorType.unknow
            }
        case 400..<500: // Http通信エラー
            throw ErrorType.httpError(response.statusCode)
        case 500..<600: // メンテナンスエラー
            throw ErrorType.serverError(response.statusCode)
        default:
            throw ErrorType.unknow
        }
    }
        
    /// Lesson5 完了
    /// 受けっとた文字列を、Dicationary型に変換する
    private func convertToDictionary(gourmetAPIString: String) -> Result<[String: Any], ErrorType> {
        // Dataを、JsonシリアライザーにてDictionary型に変換します
        do {
            // UserDefaultsから取り出した、gourmetAPIStringをData型に変換
            guard let gourmetAPIData = gourmetAPIString.data(using: .utf8)
            else {
                debugPrint("Data型へのキャスト失敗")
                return Result.failure(ErrorType.parameterError)
            }
            
            guard let dictionary = try JSONSerialization.jsonObject(with: gourmetAPIData, options: .fragmentsAllowed) as? [String: Any]
            else {
                debugPrint("Data型へのキャスト失敗")
                return Result.failure(ErrorType.parameterError)
            }
            
            debugPrint("*** success decode ***")
            debugPrint(dictionary)
            
            if let results = dictionary["results"] as? [String: Any],
               let shops = results["shop"] as? [[String: Any]],
               !shops.isEmpty {
                
                debugPrint(shops[0])
                debugPrint(shops.first ?? [:])
            } else {
                debugPrint("ショップ取れませんでした")
            }
            
            return Result.success(dictionary)
        } catch {
            debugPrint(error.localizedDescription)
            return Result.failure(ErrorType.jsonDecodingError)
        }
    }
    
    /// ショップの画像を保存します
    private func saveShopImage(shop: [String: Any]?) async throws {
        guard let shop = shop,
              let imageURLString = shop["logo_image"] as? String,
              let imageURL = URL(string: imageURLString)
        else {
            throw ErrorType.parameterError
        }
        
        let task = try await URLSession.shared.data(for: URLRequest(url: imageURL))
        
        guard let response = task.1 as? HTTPURLResponse
        else {
            throw ErrorType.unknow
        }
        
        let data = task.0
        
        debugPrint(response.description)
        switch response.statusCode {
        case 200..<400:
            debugPrint("HTTP Status Code: 2xx")
            // 文字列を取得
            let image = UIImage(data: data)
            do {
                let tmpDictory = NSHomeDirectory() + "/tmp"
                
                let filePath = tmpDictory + "/\(UUID()).png"
                debugPrint(filePath)
                
                // Lesson8
                let fileURL = URL(filePath: filePath)
                try data.write(to: fileURL, options: .atomic)
            } catch {
                throw ErrorType.systemError(error)
            }
        case 400..<500: // Http通信エラー
            throw ErrorType.httpError(response.statusCode)
        case 500..<600: // メンテナンスエラー
            throw ErrorType.serverError(response.statusCode)
        default:
            throw ErrorType.unknow
        }
    }
}

