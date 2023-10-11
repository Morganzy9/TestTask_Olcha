//
//  SavedPostsManager.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/11/23.
//

import UIKit

class SavedPostsManager {
    
    static let shared = SavedPostsManager()
    
    init(){}
    
    var savedUsers: [User] {
        get {
            if let data = UserDefaults.standard.data(forKey: "savedUsers"),
               let user = try? JSONDecoder().decode([User].self, from: data) {
                return user
            } else {
                return []
            }
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "savedUsers")
            }
        }
    }
    var savedPosts: [Post] {
        get {
            if let data = UserDefaults.standard.data(forKey: "savedPosts"),
               let post = try? JSONDecoder().decode([Post].self, from: data) {
                return post
            } else {
                return []
            }
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "savedPosts")
            }
        }
    }
    
    func addUserAndPost(_ user: User,_ post: Post) {
//        USER
        var currentUser = savedUsers
        currentUser.append(user)
        savedUsers = currentUser
//        POST
        var currentPost = savedPosts
        currentPost.append(post)
        savedPosts = currentPost
    }

    func removeUserAndPost(at index: Int) {
//        USER
        var currentUser = savedUsers
        currentUser.remove(at: index)
        savedUsers = currentUser
//        POST
        var currentPost = savedPosts
        currentPost.remove(at: index)
        savedPosts = currentPost
    }
    
    
}
