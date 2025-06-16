//
//  ErrorType.swift
//  LessonProject
//
//  Created by Hiroshi Egami on 2025/06/16.
//

/// エラー管理するEnumです。
enum ErrorType: Error {
    /// パラメータエラー
    case parameterError
    /// Jsonでコードに失敗した時のエラー
    case jsonDecodingError
    /// ライブラリから帰ってくるErrorを保持
    case systemError(Error)
    /// Http 400  番台のエラー
    case httpError(Int)
    /// Http 500番台のエラー
    case serverError(Int)
    /// 判断できないエラーについてunKnowとする。便宜上、エラーをとして扱わなければならないものが対象
    case unknow
}

extension ErrorType {
    /// タイトル: AlertViewControllerとかで、エラーの内容を出手する際に使用する
    var title: String {
        switch self {
        case .parameterError:
            return "パラメータエラー"
        case .jsonDecodingError:
            return "JSONデコードエラー"
        case .systemError:
            return "システムエラー"
        case .httpError:
            return "通信エラー"
        case .serverError:
            return "通信エラー"
        case .unknow:
            return "不明なエラー"
        }
    }
    
    /// 詳細なメッセージを表示
    var description: String {
        switch self {
        case .parameterError:
            return "パラメータが不正です。"
        case .jsonDecodingError:
            return "JSONデコードに失敗しました。"
        case .systemError(let error):
            return "\(error.localizedDescription)"
        case let .httpError(statusCode):
            return "通信に失敗しました。\n後でやり直してください"
        case let .serverError(statusCode):
            return "サーバメンテナンス中です。\n後でやり直してください"
        case .unknow:
            return "不明なエラー"
        }
    }
}
