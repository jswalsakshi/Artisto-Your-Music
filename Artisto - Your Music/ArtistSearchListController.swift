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
    @IBOutlet weak var constraint_headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var constraint_searchViewHeight: NSLayoutConstraint!
    @IBOutlet weak var textField_search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    
    var results: [Result] = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_search.isHidden = false
        self.registerForCellNib()
    }
    @IBAction func actionSearchBtnPressed(_ sender: Any) {
        self.callAPIforSongList()
    }
    @IBAction func actIonSearchBtnPressed(_ sender: Any) {
        self.callAPIforSongList()
    }
}

extension ArtistSearchListController: UITableViewDelegate, UITableViewDataSource {
    
    private func registerForCellNib() {
        self.table_songList.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        guard let dataObject = self.results[safe: indexPath.row] else {
            return cell
        }
        cell.configCellData(songData: dataObject)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songDetailvc = self.storyboard?.instantiateViewController(identifier: "SongDetailViewController") as! SongDetailViewController
        guard let dataObject = self.results[safe: indexPath.row] else {
            return
        }
        songDetailvc.songDetailData = dataObject
        self.navigationController?.pushViewController(songDetailvc, animated: true)
    }
}

extension ArtistSearchListController {
    func callAPIforSongList() {
        SessionManager.sharedInstance.getServerData(ViewController: self, searchArtist: self.textField_search.text ?? "") { (true, error, response, data) in
            let listData = response?.results
            listData?.forEach({ (order) in
                self.results.append(order)
            })
            self.btn_search.isHidden = true
            self.table_songList.reloadData()
        }
    }
}
