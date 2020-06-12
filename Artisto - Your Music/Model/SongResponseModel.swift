//
//  SongResponseModel.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 10/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [Result]?
}

struct Result: Codable {
    var trackId: Int?
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var primaryGenreName: String?
}
