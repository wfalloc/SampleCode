//
//  ScrollViewInScrollViewController.swift
//  SampleCode
//
//  Created by klwx on 2017/6/2.
//  Copyright © 2017年 wufan. All rights reserved.
//

import UIKit

let screenSize = UIScreen.main.bounds.size
let ban_H: CGFloat = 200.0
let scrollViewInScrollViewID = "scrollViewInScrollViewID"

class ScrollViewInScrollViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {

    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: screenSize.width, height: screenSize.height - 64.0))
        scrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height + ban_H - 44.0 - 64.0)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
        
        let bannerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: ban_H))
        bannerView.backgroundColor = UIColor(white: 100/255.0, alpha: 1)
        scrollView.addSubview(bannerView)
        
        return scrollView
    } ()
    
    lazy var subScrollView: UIScrollView = {
        let sub_W = screenSize.height - 64.0 - 44.0
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: ban_H, width: screenSize.width, height: sub_W))
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: screenSize.width * 3, height: sub_W)
        
        for i in 0...2 {
            let tableView = UITableView(frame: CGRect(x: screenSize.width * CGFloat(i), y: 0, width: screenSize.width, height: sub_W), style: .plain)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isScrollEnabled = false
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: scrollViewInScrollViewID)
            scrollView.addSubview(tableView)
        }
        
        return scrollView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ScrollView In ScrollView"
        view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(subScrollView)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerActive(pan:)))
        pan.delegate = self
        view.addGestureRecognizer(pan)
    }
    
    // MARK: - GestureRecognizer
    func panGestureRecognizerActive(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began: break
        case .changed: break
        case .ended: break
        default: break
        }
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
    
    // MARK: - UITableViewDataSource, Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: scrollViewInScrollViewID, for: indexPath)
        cell.textLabel?.text = "cell num - \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
