//
//  SortingHatView.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/7/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation
import UIKit

class SortingHatView: UIView {

    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.backgroundColor = .orange
    }
}
