//
//  ViewController.swift
//  QConstraintsDemo
//
//  Created by qishouhui on 2019/6/1.
//  Copyright © 2019 qishouhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let redImageV = UIImageView()
        redImageV.backgroundColor = .red
//        view .addSubview(redImageV) //forget this,OK
//
//        redImageV.translatesAutoresizingMaskIntoConstraints = false //forget this,OK

//        view .addConstraint(NSLayoutConstraint.init(item: redImageV, attribute:.centerX, relatedBy:.equal, toItem:view, attribute: .centerX, multiplier: 1.0, constant: 0))
//
//        view .addConstraint(NSLayoutConstraint.init(item: redImageV, attribute:.centerY, relatedBy:.equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0))
//
//        redImageV .addConstraint(NSLayoutConstraint.init(item: redImageV, attribute:.width, relatedBy:.equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 100))
//
//        redImageV .addConstraint(NSLayoutConstraint.init(item: redImageV, attribute:.height, relatedBy:.equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100))
        redImageV.centerXCEqual(view: view, type: .centerX, m: 1.0, a: 0.0)
        redImageV.centerYCEqual(view: view, type: .centerY, m: 1.0, a: 0.0)
        redImageV.widthCEqual (W: 100)
        redImageV.heightCEqual(H: 100)
        
        let blueButton = UIButton()
        blueButton.backgroundColor = .blue

        //        view .addSubview( blueButton) //forget this ,OK
        blueButton.topCEqual(view: redImageV, type: .bottom, m: 1.0, a: 100)
        blueButton.leftCEqual(view: view, type: .left, m: 1.0, a: 200)
        blueButton.widthCEqual(view: view, type: .width, m: 0.5, a: 0.0)
        blueButton.heightCEqual(view: redImageV, type: .height, m: 2.0, a: 0.0)
        
        
    }


}

