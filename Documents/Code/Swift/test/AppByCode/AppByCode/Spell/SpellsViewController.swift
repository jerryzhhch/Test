//
//  SpellsViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/4/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

class SpellsViewController: UIViewController {

    let rootView = SpellsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = rootView
    }

}
