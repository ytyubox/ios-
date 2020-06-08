//
//  ViewController_ch2.swift
//  ios核心动画高级技巧
//
//  Created by 游宗諭 on 2020/6/5.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
class ViewController_ch2: UIViewController {
    let layerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    let segmentedControl = UISegmentedControl(items:
        [
            "1",
            "2",
            "3"
        ]
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(layerView)
        view.addSubview(segmentedControl)
        segmentedControl.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        segmentedControl.addTarget(
            self,
            action: #selector(didSelectSegmented),
            for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        view.backgroundColor = .gray
        layerView.center = view.center
        layerView.backgroundColor = .white
        setIndexTo1()
    }
    @objc private func didSelectSegmented(_ sender: UISegmentedControl) {
        let doer = works[sender.selectedSegmentIndex]
        doer()
    }
    
    private var works:[() -> Void] { [
        setIndexTo1,
        setIndexTo2,
        ]
    }
    private func setIndexTo1() {
        layerView.layer.contents = UIImage(named: "snowman")?.cgImage
        layerView.contentMode = .scaleAspectFit
    }
    private func setIndexTo2() {
        layerView.layer.contents = UIImage(named: "snowman")?.cgImage
        layerView.layer.contentsGravity = .resizeAspect
    }
}



