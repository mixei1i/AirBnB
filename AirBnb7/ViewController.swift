//
//  ViewController.swift
//  AirBnb7
//
//  Created by Admin on 9/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    

    @IBOutlet weak var roundImage: UIImageView!
    @IBOutlet weak var RoundButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .white
    
        roundImage.layer.cornerRadius = 22
        roundImage.layer.masksToBounds = true   
        
        RoundButton.layer.cornerRadius = 22
        RoundButton.layer.masksToBounds = true
    
    }


}

class ViewController2: UIViewController {
    @IBOutlet weak var redButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        redButton.layer.cornerRadius = 10
//        redButton.layer.masksToBounds = true
    }


}

class ViewController3: UIViewController {

    @IBOutlet weak var blackButton3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        blackButton3.layer.cornerRadius = 10
        blackButton3.layer.masksToBounds = true
    }


}

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }


}

class ViewController5: UIViewController,  UITableViewDelegate, UITableViewDataSource

{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("you tape me")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Show profile \n kkk"
        // cell.textLabel?.text = "PPPP"
        cell.imageView?.image = .init(imageLiteralResourceName: "5.1")
        
        return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSecond", for: indexPath)
           // cell.textLabel?.text = "Show profile \n kkk"
            cell.textLabel?.text = "Earn maney from extra space"
            cell.imageView?.image = .init(imageLiteralResourceName: "Earn")
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTherd", for: indexPath)
            // cell.textLabel?.text = "Show profile \n kkk"
            cell.textLabel?.text = properties[indexPath.row]
             //cell.imageView?.image = .init(imageLiteralResourceName: "person")
             
             return cell
            }
         
    }

    
    @IBOutlet var tableview: UITableView!
    
    let properties = ["eferfer", "eferfer","Personal informatio",
    "payment and payouts", "Notifications", "Travel for work", "List your space", "Host an experience", "Invite friends", "Siri settings", "How Airbnb works", "Safety Center", " Connect Neighborhood Support  ?", "Get help ?", "Log out"]
    
     override func viewDidLoad() {
            super.viewDidLoad()
            
            
        tableview.delegate = self
        tableview.dataSource = self
        }

    }
