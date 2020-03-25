//
//  APIError.swift
//  GithubClient-MVVM
//
//  Created by 千葉大志 on 2018/03/25.
//  Copyright © 2018年 bati. All rights reserved.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case unknown
    case invalidURL
    case invalidResponse
    
    var description: String {
        switch self {
        case .unknown: return "不明なエラーです"
        case .invalidURL: return "無効なURLです"
        case .invalidResponse: return "フォーマットが無効なレスポンスを受け取りました"
        }
    }
}
