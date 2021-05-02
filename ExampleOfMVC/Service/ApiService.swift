//
//  ApiService.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.
//

import Foundation

class ApiService: NSObject {
    
    static let shared = ApiService() //Create shared instance - Singleton
    
    
    func fetchCourses(urlString: String, completion: @escaping (BookCollection?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
        
            //HANDLE ERROR
            if let err = err {
                completion(nil, err)
                print("Failed to fetch books:", err)
                return
            }
            
            //HANDLE RESPONSE
            guard let jsonData = data else { return }
            
            //Decode can throw, try decoding in --> Do,Try,Catch,Block
            do {
                let books = try JSONDecoder().decode(BookCollection.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(books, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }
    
    
}
