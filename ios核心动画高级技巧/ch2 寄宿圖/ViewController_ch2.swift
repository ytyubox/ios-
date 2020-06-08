//
//  ViewController_ch2.swift
//  ios核心动画高级技巧
//
//  Created by 游宗諭 on 2020/6/5.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
let frame = CGRect(x: 0, y: 0, width: 200, height: 200)

class ViewController_ch2: UIViewController {
    static func makeNewlayer() -> UIView{
         UIView(frame: frame)
    }
    var layerView = makeNewlayer(){
        didSet {
            oldValue.removeFromSuperview()
            view.addSubview(layerView)
            layerView.center = view.center
            layerView.backgroundColor = .white
        }
    }
    lazy var segmentedControl = UISegmentedControl(items:
        works.map(\.0)
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(layerView)
        view.addSubview(segmentedControl)
        segmentedControl.frame = CGRect(x: 0, y: 100, width: 0, height: 0)
        segmentedControl.sizeToFit()
        segmentedControl.addTarget(
            self,
            action: #selector(didSelectSegmented),
            for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        view.backgroundColor = .gray
        
        setIndexTo1()
    }
    @objc private func didSelectSegmented(_ sender: UISegmentedControl) {
        let doer = works[sender.selectedSegmentIndex].1
        doer()
    }
    
    typealias Pair = (String,()->Void)
    private var works:[Pair] { [
        ("1",setIndexTo0),
        ("2",setIndexTo1),
        ("3",setIndexTo2),
        ]
    }
    private func setIndexTo0() {
        layerView = Self.makeNewlayer()
      layerView.layer.contents = UIImage(named: "snowman")?.cgImage
    }
    private func setIndexTo1() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = UIImage(named: "snowman")?.cgImage
        layerView.contentMode = .scaleAspectFit
    }
    private func setIndexTo2() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = UIImage(named: "snowman")?.cgImage
        layerView.layer.contentsGravity = .resizeAspect
    }
}



