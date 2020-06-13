//
//  SongDetailViewController.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 12/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    @IBOutlet weak var view_container: UIView!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var view_detailSubView: UIView!
    @IBOutlet weak var img_artwork: UIImageView!
    @IBOutlet weak var lbl_artistName: UILabel!
    @IBOutlet weak var lbl_trackPrice: UILabel!
    @IBOutlet weak var lbl_releaseDate: UILabel!
    
    var songDetailData: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.lbl_title.text = self.songDetailData?.trackName
        self.lbl_artistName.text = self.songDetailData?.artistName
        self.lbl_trackPrice.text = ("$ \(self.songDetailData?.trackPrice ?? 0)")
        self.lbl_releaseDate.text = self.songDetailData?.releaseDate
        self.img_artwork.downloaded(from: songDetailData?.artworkUrl100 ?? "")
        self.view_detailSubView.setBorderWidth(1, withColor: .clear, CornerRadius: 40)
        self.img_artwork.setBorderWidth(1, withColor: .clear, CornerRadius: 40)
    }
    @IBAction func actionBackBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
