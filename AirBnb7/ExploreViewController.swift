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
        searchButton.layer.cornerRadius = 22
        searchButton.layer.masksToBounds = true
        
    }
    
}

class ExploreNearbyTableViewCell: UITableViewCell {
    
}

//class Places: UITableViewCell {
//
//}

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



class CarouselCollectionViewCellPlaces: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func configPlaces(with item: (imageName: String, title: String, desc: String), textColor: UIColor) {
    
        
        self.labelTitle.textColor = textColor
        self.labelDescription.textColor = textColor
        self.labelTitle.text = item.title
        self.labelDescription.text = item.desc
        self.imgView.image = UIImage(named: item.imageName)
    }
    
}




class ExploreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let travelItems = [(imageName: "1.1", title: "Unique stays", desc: "Space that are more then just a place to sleep."),
                       (imageName: "1.2", title: "Online experieces", desc: "unique activities we can do together."),
                       (imageName: "1.3", title: "Entrie homes", desc: "Comfortable private places, whith room for frien or family")]

    
    let exploreItems = [(imageName: "2.1", title: "Lern to make soup ",desc: "dumplings in Shanghai"),
                        (imageName: "2.22", title: "Explore feminism with", desc: "street art and graffiti"),
                        (imageName: "2.33", title: "Go backstage with a New York ", desc: "magician"),
                        (imageName: "2.4", title: "Craft cocktails and talk", desc: "gender with a bartender")]
    
    let geoItems = [(imageName: "3.11", title: "Stay informed",desc: "For guest"),
                    (imageName: "3.22", title: "Stay informed",desc: "For guest"),]
                        

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        if section == 0 {
            header.config(title: "Where are you going?")
        } else {
            header.config(title: "Section 2")
        }
        return header.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 52
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreNearbyTableViewCell", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableViewCell", for: indexPath) as! CarouselTableViewCell
            cell.config(backgroundColor: UIColor.white, items: travelItems)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableViewCell", for: indexPath) as! CarouselTableViewCell
            cell.config(backgroundColor: UIColor.black, items: exploreItems)
            return cell
        }
        else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableViewCell", for: indexPath) as! CarouselTableViewCell
        cell.config(backgroundColor: UIColor.white, items: geoItems)
        return cell
    }

  }
    
}
