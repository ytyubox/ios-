//
//  ViewController.swift
//  ios核心动画高级技巧
//
//  Created by 游宗諭 on 2020/6/5.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        layerView.center = view.center
    }
    let layerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(layerView)
        view.backgroundColor = .gray
        layerView.center = view.center
        layerView.backgroundColor = .white
    }


}

