//
//  Network.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 14.09.2023.
//

import Foundation


func fetchPosts() async throws -> Post {
    
    let endpoint = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
    
    guard let url = URL(string: endpoint) else { throw postError.invalidURL }
    
    let (data, responce) = try await URLSession.shared.data(from: url)
    
    guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else { throw postError.invalidResponce }
    
    print(data)
    let myResponce = String(data: data, encoding: .utf8)
    print(myResponce ?? "Responce unknow")
    data.prettyPrintJSONString()
    
    do {
        let jsonDecoder = JSONDecoder()
        let encoderData = try jsonDecoder.decode(Post.self, from: data)
        return encoderData
    } catch {
        throw postError.invalidData
    }
}
  
enum postError: Error {
    case invalidURL
    case invalidResponce
    case invalidData
}

extension Data {
    
    func prettyPrintJSONString() {
        guard
            let jsonObject = try?
                JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try?
                JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData, encoding: .utf8) else { print("Failed to read JSON Object.")
            return
        }
//        print(prettyJSONString)
    }
}