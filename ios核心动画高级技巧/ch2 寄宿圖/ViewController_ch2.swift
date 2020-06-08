//
//  ViewController_ch2.swift
//  ios核心动画高级技巧
//
//  Created by 游宗諭 on 2020/6/5.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
private let frame = CGRect(x: 0, y: 0, width: 200, height: 200)

class ViewController_ch2: UIViewController {
    private static func makeNewlayer() -> UIView{
        UIView(frame: frame)
    }
    var layerView = makeNewlayer(){
        didSet {
            oldValue.removeFromSuperview()
            view.addSubview(layerView)
            layerView.center = view.center
            layerView.backgroundColor = .lightGray
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
        ("1", setIndexTo1),
        ("2", setIndexTo2),
        ("3", setIndexTo3),
        ("4", setIndexTo4),
        ("5", setIndexTo5),
        ("6", setIndexTo6),
        ]
    }
    private func setIndexTo1() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = image.cgImage
    }
    private func setIndexTo2() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = image.cgImage
        layerView.contentMode = .scaleAspectFit
    }
    private func setIndexTo3() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = image.cgImage
        layerView.layer.contentsGravity = .resizeAspect
    }
    private func setIndexTo4() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = image.cgImage
        layerView.layer.contentsGravity = .center
        layerView.layer.contentsScale = image.scale
        // reminder: 教學上的雪人的背景是透明的，但是我們的不是，所以會看起來變大
    }
    private func setIndexTo5() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = image.cgImage
        layerView.layer.contentsGravity = .center
        layerView.layer.contentsScale = image.scale
        layerView.layer.masksToBounds = true
    }
    private func setIndexTo6() {
        layerView = Self.makeNewlayer()
        layerView.layer.contents = image.cgImage
        layerView.layer.contentsGravity = .resizeAspect
        layerView.layer.masksToBounds = true
        layerView.layer.contentsRect = CGRect(
            x: 0,
            y: 0,
            width: 0.5,
            height: 0.5)
    }
}



private let image = UIImage(named: "snowman")!
