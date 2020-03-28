//
//  ViewController.swift
//  RefreshKit
//
//  Created by Kalanhall@163.com on 03/25/2020.
//  Copyright (c) 2020 Kalanhall@163.com. All rights reserved.
//

import UIKit
import RefreshKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        // 默认
//        let header = DefaultRefreshHeader.header()
//        header.imageView.isHidden = true
//        header.indicator.alpha = 0
//        header.tintColor = .red
//        header.textLabel.font = UIFont.systemFont(ofSize: 12)
//        header.imageRenderingWithTintColor = true
////        header.refreshHeight = 60
//        header.layer.borderWidth = 1
//        self.tableView.handleRefreshHeader(with: header, container: self) { [weak self] in
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self?.tableView.switchRefreshHeader(to: .normal(.none, 0))
//            }
//        }
//
//        self.tableView.handleRefreshFooter(container:self) { [weak self] in
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self?.tableView.switchRefreshFooter(to: .normal)
//            }
//        };
        
        // 自定义
        let header = CustomRefreshHeader(frame: CGRect(x: 0,y: 0,width: self.view.bounds.width,height: 50))
        header.layer.borderWidth = 1
        self.tableView.handleRefreshHeader(with: header,container:self) { [weak self] in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self?.tableView.switchRefreshHeader(to: .normal(.none, 0.0))
                }
        };

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.tableView.switchRefreshHeader(to: .refreshing)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

