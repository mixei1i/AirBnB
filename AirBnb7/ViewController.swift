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
        
        redButton.layer.cornerRadius = 10
        redButton.layer.masksToBounds = true
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

class ViewController5: UIViewController {
//TableViewTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // view.backgroundColor = .green
    }


}



