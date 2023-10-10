//
//  PostManager.swift
//  TestTask_Olcha
//
//  Created by Ислам Пулатов on 10/10/23.
//

import Foundation

protocol PostManagerDelegate: AnyObject {
    func didFetchPost(_ manager: PostManager,_ post: [Post])
    func didFailWithError(_ error: Error)
}

struct PostManager {
    
    let postURL = "https://jsonplaceholder.typicode.com/"
    
    weak var delegate: PostManagerDelegate?
    
    func fetchPosts() {
        let urlString = postURL + "posts"
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                delegate?.didFailWithError(error)
                return
            }
            
            guard let safeData = data else { return }
            
            guard let posts = parseJson(safeData) else { return }

            delegate?.didFetchPost(self, posts)
            
        }.resume()
        
    }
    
    private func parseJson(_ data: Data) -> [Post]? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([Post].self, from: data)
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }

}
