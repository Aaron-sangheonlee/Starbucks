//
//  FoodViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/28.
//

import UIKit

class FoodViewController: UIViewController {
    
    var beverage: [Beverage] = Beverage.infos
    var beverageCategory: [BeverageCategory] = BeverageCategory.categoryInfos
    
    @IBOutlet weak var allMenuButton: UIButton!
    @IBOutlet weak var myMenuButton: UIButton!
    @IBOutlet weak var beverageButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var beverageTableView: UITableView!
    
    @IBAction func bevergeActionButton(_ sender: Any) {
        
    }
    @IBAction func foodActionButton(_ sender: Any) {
        
        
        
    }
    @IBAction func allMenuActionButton(_ sender: Any) {
    }
    @IBAction func myMenuActionButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageTableView.delegate = self
        beverageTableView.dataSource = self
        
        beverageTableView.register(UINib(nibName:"beverageTableViewCell", bundle: nil), forCellReuseIdentifier: "beverageTableViewCell")
        
        allMenuButton.setTitle("전체 메뉴", for: .normal)
        allMenuButton.setTitleColor(.gray, for: .normal)
        allMenuButton.setTitleColor(.black, for: .selected)
        
        myMenuButton.setTitle("나만의 메뉴", for: .normal)
        myMenuButton.setTitleColor(.gray, for: .normal)
        myMenuButton.setTitleColor(.black, for: .selected)
        
        beverageButton.setTitle("음료", for: .normal)
        beverageButton.setTitleColor(.gray, for: .normal)
        beverageButton.setTitleColor(.black, for: .selected)
        
        foodButton.setTitle("푸드", for: .normal)
        foodButton.setTitleColor(.gray, for: .normal)
        foodButton.setTitleColor(.black, for: .selected)
    }
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beverageCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = beverageTableView.dequeueReusableCell(withIdentifier: "beverageTableViewCell", for: indexPath) as! beverageTableViewCell
        
        cell.beverageCategoryTitle.text = beverageCategory[indexPath.row].beverageCategoryTitle
        cell.beverageCategorySubTitle.text = beverageCategory[indexPath.row].beverageCategorySubTitle
        
        cell.beverageCategoryTitle.tintColor = UIColor.black
        cell.beverageCategoryTitle.font = UIFont.systemFont(ofSize: 18)
        
        cell.beverageCategorySubTitle.tintColor = UIColor.systemGray
        cell.beverageCategorySubTitle.font = UIFont.systemFont(ofSize: 12)
    
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        
        vc.text = beverageCategory[indexPath.row].beverageCategoryTitle
        vc.bigIndex = beverageCategory[indexPath.row].categoryId
        
        
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
    
    }
