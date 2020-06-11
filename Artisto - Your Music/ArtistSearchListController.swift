//
//  ArtistSearchListController.swift
//  Artisto - Your Music
//
//  Created by Sakshi Jaiswal on 11/06/20.
//  Copyright © 2020 Sakshi Jaiswal. All rights reserved.
//

import UIKit

class ArtistSearchListController: UIViewController {
    @IBOutlet weak var table_songList: UITableView!
    
    var results = [Result] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerForCellNib()
    }
}

extension ArtistSearchListController: UITableViewDelegate, UITableViewDataSource {
    
    private func registerForCellNib() {
        self.table_songList.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
