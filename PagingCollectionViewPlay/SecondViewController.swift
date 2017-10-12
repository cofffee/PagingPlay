//
//  SecondViewController.swift
//  PagingCollectionViewPlay
//
//  Created by Remigio, Kevin (Contractor) on 10/12/17.
//  Copyright © 2017 Remigio, Kevin (Contractor). All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var color: UIColor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if color == nil {
            view.backgroundColor = UIColor.white
        } else {
            view.backgroundColor = color
        }
    }

}
