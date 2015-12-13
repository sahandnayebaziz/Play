//
//  HomeViewController.swift
//  Play
//
//  Created by Sahand Nayebaziz on 12/12/15.
//  Copyright © 2015 Sahand Nayebaziz. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = PlayColors.lightGray
        
        // view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "clearResponder"))
        // implement this as a notification
        
        let title = HomeTitleView()
        view.addSubview(title)
        title.snp_makeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(200)
            make.top.equalTo(view.snp_top).offset(40)
        }
        
        let code = HomeCodeView()
        view.addSubview(code)
        code.snp_makeConstraints { make in
            make.width.equalTo(view.snp_width).offset(-440)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(title.snp_bottom).offset(80)
            make.bottom.equalTo(view.snp_bottom).offset(-80)
        }
    }
}
