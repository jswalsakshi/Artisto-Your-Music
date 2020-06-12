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
    @IBOutlet weak var lbl_genre: UILabel!
    @IBOutlet weak var lbl_genreName: UILabel!
    
    var songDetailData: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.view_detailSubView.setBorderWidth(5, withColor: .black, CornerRadius: 20)
    }
}
