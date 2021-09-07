//
//  TabBarViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/08/09.
//

import UIKit
import XLPagerTabStrip
import PagingKit

class TabBarViewController: UIViewController {
    
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
                    menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
                } else if let vc = segue.destination as? PagingContentViewController {
                    contentViewController = vc
                    vc.dataSource = self
                    vc.delegate = self
                }
    }
    
    lazy var firstLoad: (() -> Void)? = {
        [weak self, menuViewController, contentViewController] in
        menuViewController?.reloadData()
        contentViewController?.reloadData()
        self?.firstLoad = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstLoad?()
    }
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
           let vc = UIViewController()
            vc.view.backgroundColor = color
            return vc
        }
        
//        var dataSource = [(menuTitle: "test1", vc: viewController(.red)), (menuTitle: "test2", vc: viewController(.blue)), (menuTitle: "test3", vc: viewController(.yellow))]

    var dataSource = [(menu: String, Content: UIViewController)](){
        didSet{
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }
    
    fileprivate func makeDataSourse() -> [(menu: String, Content: UIViewController)] {
        let menuArray = ["전체 메뉴", "나만의 메뉴"]
        
        return menuArray.map {
            let title = $0
            
            switch title {
            case "전체 메뉴":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
                return (menu: title, Content: vc)
            case "나만의 메뉴":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "myMenuViewController") as! myMenuViewController
                return (menu: title, Content: vc)
            default:
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
                return (menu: title, Content: vc)
            }
        }
    }
    

    override func viewDidLoad() {
        
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
//        menuViewController.reloadData()
//        contentViewController.reloadData()
        
        menuViewController.cellAlignment = .center
        
        dataSource = makeDataSourse()
        
        super.viewDidLoad()
    }
}

extension TabBarViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 150
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
}

extension TabBarViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].Content
    }
}
extension TabBarViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}
extension TabBarViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}


