//
//  Post.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
