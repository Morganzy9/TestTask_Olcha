//
//  PostManager.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import Foundation

protocol PostManagerDelegate: AnyObject {
    func didFetchPost(_ manager: PostManager, _ post: [Post])
    func didFetchUsers(_ manager: PostManager, _ users: [User])
    func didFailWithError(_ error: Error)
}

struct PostManager {
    let baseURL = "https://jsonplaceholder.typicode.com/"
    weak var delegate: PostManagerDelegate?
    
    func fetchPosts() {
        let urlPostsString = baseURL + "posts"
        let urlUsersString = baseURL + "users"
        fetch(with: urlPostsString, parseFunction: parsePosts) { (posts: [Post]?) in
            if let posts = posts {
                self.delegate?.didFetchPost(self, posts)
            }
        }
        
        fetch(with: urlUsersString, parseFunction: parseUsers) { (users: [User]?) in
            if let users = users {
                self.delegate?.didFetchUsers(self, users)
            }
        }
    }
    
    private func fetch<T>(with urlString: String, parseFunction: @escaping (Data) -> T?, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {  data, response, error in
            
            if let error = error {
                self.delegate?.didFailWithError(error)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            if let parsedData = parseFunction(safeData) {
                completion(parsedData)
            }
        }.resume()
    }
    
    private func parsePosts(_ data: Data) -> [Post]? {
        do {
            let decodedData = try JSONDecoder().decode([Post].self, from: data)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
    
    private func parseUsers(_ data: Data) -> [User]? {
        do {
            let decodedData = try JSONDecoder().decode([User].self, from: data)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
