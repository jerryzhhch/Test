//
//  SortingHatViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/4/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

class SortingHatViewController: UIViewController {

    let rootView = SortingHatView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = rootView
    }

}
