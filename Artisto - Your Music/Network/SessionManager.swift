//
//  SessionManager.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 11/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class SessionManager: NSObject {
    
    static let sharedInstance = SessionManager()
    
    func getServerData(ViewController viewController: UIViewController,
                       searchArtist: String,
                       completionHandler: @escaping
        (_ success: Bool,_ error: Error?, _ response: Response?, _ data: Data?) -> Void) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchArtist)&attribute=artistTerm") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    DispatchQueue.main.async {
                        completionHandler(true, error, decodedResponse, data)
                        
                    }
                    return
                }
            }
            print("Failed to load Data: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
