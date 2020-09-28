//
//  ExploreViewController.swift
//  AirBnb7
//
//  Created by Admin on 9/28/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var searchButton: UIButton!
    
    func config(title: String) {
        self.searchButton.setTitle(title, for: .normal)
    }
    
    
}

class ExploreNearbyTableViewCell: UITableViewCell {
    
}

class CarouselTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [(imageName: String, title: String, desc: String)]()

    override func awakeFromNib() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func config(backgroundColor: UIColor, items: [(imageName: String, title: String, desc: String)]) {
        self.collectionView.backgroundColor = backgroundColor
        self.items = items
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        var textColor = UIColor.black
        if self.collectionView.backgroundColor == UIColor.black {
            textColor = UIColor.white
        }
        cell.config(with: self.items[indexPath.row], textColor: textColor)
        return cell
    }
    
}

class CarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func config(with item: (imageName: String, title: String, desc: String), textColor: UIColor) {
        self.labelTitle.textColor = textColor
        self.labelDescription.textColor = textColor
        self.labelTitle.text = item.title
        self.labelDescription.text = item.desc
        self.imgView.image = UIImage(named: item.imageName)
    }
    
}


class ExploreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let travelItems = [(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Travel 1", desc: "Description 1")]
    
    let exploreItems = [(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1"),(imageName: "169ECA6F-44B0-4C23-AA5E-699AC75D0F65", title: "Explore 1", desc: "Description 1")]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        if section == 0 {
            header.config(title: "Section 1")
        } else {
            header.config(title: "Section 2")
        }
        return header.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreNearbyTableViewCell", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableViewCell", for: indexPath) as! CarouselTableViewCell
            cell.config(backgroundColor: UIColor.green, items: travelItems)
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableViewCell", for: indexPath) as! CarouselTableViewCell
            cell.config(backgroundColor: UIColor.black, items: exploreItems)
            return cell
        }
    }

}
