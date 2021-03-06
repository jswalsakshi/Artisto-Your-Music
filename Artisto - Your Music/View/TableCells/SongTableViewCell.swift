//
//  SongTableViewCell.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 10/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view_container: UIView!
    @IBOutlet weak var img_artwork: UIImageView!
    @IBOutlet weak var lbl_trackTitle: UILabel!
    @IBOutlet weak var lbl_artist: UILabel!
    @IBOutlet weak var lbl_artistName: UILabel!
    @IBOutlet weak var lbl_genre: UILabel!
    @IBOutlet weak var lbl_genreName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCellData(songData: Result) {
        self.setUpUI(songData: songData)
    }
    
    private func setUpUI(songData: Result) {
        self.view_container.setBorderWidth(1, withColor: .gray, CornerRadius: 30)
        self.img_artwork.makeCircular()
        self.img_artwork.downloaded(from: songData.artworkUrl100!)
        self.lbl_trackTitle.text = songData.trackName
        self.lbl_artistName.text = songData.artistName
        self.lbl_genreName.text = songData.primaryGenreName
    }
    
}
