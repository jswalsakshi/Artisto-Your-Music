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
    
    func getServerData(searchArtist: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
                   print("Invalid URL")
                   return
               }
               
               let request = URLRequest(url: url)
               
               URLSession.shared.dataTask(with: request) { data, response, error in
                   // step 4
                   if let data = data {
                       if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                           // we have good data – go back to the main thread
                           DispatchQueue.main.async {
                               // update our UI
//                               self.results = decodedResponse.results!
//                               print(self.results)
                           }
                           
                           // everything is good, so we can exit
                           return
                       }
                   }
                   
                   // if we're still here it means there was a problem
                   print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
               }.resume()
    }
}
