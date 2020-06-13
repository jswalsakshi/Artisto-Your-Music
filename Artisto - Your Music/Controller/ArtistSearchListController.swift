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
        self.setupUI()
        self.hideUnhideSearchBtn()
        self.registerForCellNib()
    }
    
    private func setupUI() {
        self.btn_search.setBorderWidth(1, withColor: .clear, CornerRadius: 5)
    }
    
    
    @IBAction func actionSearchBtnPressed(_ sender: Any) {
        self.dismissKeyboard()
        self.callAPIforSongList()
    }
    @IBAction func actIonSearchBtnPressed(_ sender: Any) {
        self.dismissKeyboard()
        self.callAPIforSongList()
    }
}

private typealias SearchBtnHandler = ArtistSearchListController
extension SearchBtnHandler {
    private func hideUnhideSearchBtn() {
        if self.results.count > 0 {
            self.btn_search.isHidden = true
        } else {
            self.btn_search.isHidden = false
        }
    }
}

private typealias TableViewHandler = ArtistSearchListController
extension TableViewHandler: UITableViewDelegate, UITableViewDataSource {
    
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
        return 145
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

private typealias APIHandler = ArtistSearchListController
extension APIHandler {
    func callAPIforSongList() {
        guard let artistName = self.textField_search.text, !artistName.isEmpty else {
            return self.showToast(message: "Please Enter Artist Name", font: .systemFont(ofSize: 12.0))
        }
        SessionManager.sharedInstance.getServerData(ViewController: self, searchArtist: artistName) { (true, error, response, data) in
            self.results.removeAll()
            let listData = response?.results
            listData?.forEach({ (order) in
                self.results.append(order)
            })
            self.hideUnhideSearchBtn()
            self.table_songList.reloadData()
        }
    }
}
