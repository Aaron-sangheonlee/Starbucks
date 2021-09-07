//
//  ViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    var beverage: [Beverage] = Beverage.infos
    var beverageCategory: [BeverageCategory] = BeverageCategory.categoryInfos
    
    @IBOutlet weak var beverageTableView: UITableView!
    @IBOutlet weak var orderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageTableView.delegate = self
        beverageTableView.dataSource = self
        //닙 등록
        beverageTableView.register(UINib(nibName:"beverageCell", bundle: nil), forCellReuseIdentifier: "beverageCell")
        
        beverageTableView.separatorStyle = .none
//        UITabBar.appearance().tintColor = UIColor.systemGreen
//        tabBarItem.image = UIImage(named: "allMenu")
//        tabBarItem.selectedImage = UIImage(named: "allMenuSelected")
//        tabBarItem.title = "전체 메뉴"
//
        self.navigationController?.navigationBar.tintColor = .systemGreen
        self.navigationController?.navigationItem.title = "Cafe"
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moveToCategory = segue.destination as? CategoryViewController else { return }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beverageCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = beverageTableView.dequeueReusableCell(withIdentifier: "beverageCell", for: indexPath) as! beverageCell
        
        cell.beverageTitle.text = beverageCategory[indexPath.row].beverageCategoryTitle
        cell.beverageSubTitle.text = beverageCategory[indexPath.row].beverageCategorySubTitle
        cell.beverageImage.image = beverageCategory[indexPath.row].beverageCategoryImage
        
        cell.beverageImage.layer.cornerRadius = 30
        cell.beverageTitle.textColor = UIColor.black
        cell.beverageTitle.font = UIFont.systemFont(ofSize: 18)
        
        cell.beverageSubTitle.textColor = UIColor.gray
        cell.beverageSubTitle.font = UIFont.systemFont(ofSize: 12)
    
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "moveToCategory") as! CategoryViewController
        
        vc.text = beverageCategory[indexPath.row].beverageCategoryTitle
        vc.bigIndex = beverageCategory[indexPath.row].categoryId
        
        performSegue(withIdentifier: "moveToCategory", sender: self)
    }
}

    

