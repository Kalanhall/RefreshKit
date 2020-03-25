//
//  CustomRefreshHeader.swift
//  RefreshKit_Example
//
//  Created by Logic on 2020/3/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import RefreshKit

class CustomRefreshHeader : UIView, RefreshableHeader{
    
    let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.frame = CGRect(x: 0, y: 0, width: 27, height: 10)
        imageView.center = CGPoint(x: self.bounds.width/2.0, y: self.bounds.height/2.0)
        imageView.image = UIImage(named: "loading15")
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - RefreshableHeader
    func heightForHeader() -> CGFloat {
        return 50.0
    }
    
    //监听百分比变化
    func percentUpdateDuringScrolling(_ percent:CGFloat){
        imageView.isHidden = (percent == 0)
        let adjustPercent = max(min(1.0, percent),0.0)
        let scale = 0.2 + (1.0 - 0.2) * adjustPercent;
        imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        let mappedIndex = Int(adjustPercent * 15)
        let imageName = mappedIndex < 10 ? "loading0\(mappedIndex)" : "loading\(mappedIndex)"
        let image = UIImage(named: imageName)
        imageView.image = image
    }
    
    // 松手即将刷新的状态
    func didBeginRefreshingState(){
        imageView.image = nil
        let images = (0...29).map{return $0 < 10 ? "loading0\($0)" : "loading\($0)"}
        imageView.animationImages = images.map{return UIImage(named:$0)!}
        imageView.animationDuration = Double(images.count) * 0.04
        imageView.startAnimating()
    }
    
    // 刷新结束，将要隐藏header
    func didBeginHideAnimation(_ result:RefreshResult){}
    
    // 刷新结束，完全隐藏header
    func didCompleteHideAnimation(_ result:RefreshResult){
        imageView.animationImages = nil
        imageView.stopAnimating()
        imageView.image = UIImage(named: "loading15")
    }
}
