//
//  User.swift
//  GithubClient-MVVM
//
//  Created by 千葉大志 on 2018/03/25.
//  Copyright © 2018年 bati. All rights reserved.
//

import Foundation

final class User {
    let id: Int
    let name: String
    let iconUrl: String
    let webURL: String
    
    init(attributes: [String: Any]) {
        id = attributes["id"] as! Int
        name = attributes["login"] as! String
        iconUrl = attributes["avatar_url"] as! String
        webURL = attributes["html_url"] as! String
    }
}
