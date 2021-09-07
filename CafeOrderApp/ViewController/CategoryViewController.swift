//
//  CategoryViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/26.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var beverageTableView: UITableView!
    
    var text : String = ""
    var bigIndex : Int = 0
    var beverageFiltered : [Beverage] = []
//    var beverage = Beverage.infos
//    var beverageCategory = BeverageCategory.categoryInfos
//    var beverageDetailFiltered: [Beverage] = []
//    var index: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageTableView.register(UINib(nibName:"beverageCell", bundle: nil), forCellReuseIdentifier: "beverageCell")
        
        categoryTitle.textColor = UIColor.black
        categoryTitle.font = UIFont.systemFont(ofSize: 25)

        self.categoryTitle.text = text
        
        beverageTableView.delegate = self
        beverageTableView.dataSource = self
        
        beverageTableView.separatorStyle = .none
        
        beverageFiltered = Beverage.infos.filter{$0.categoryId == bigIndex}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return beverageFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = beverageTableView.dequeueReusableCell(withIdentifier: "beverageCell", for: indexPath) as! beverageCell
        
        cell.beverageTitle.text = beverageFiltered[indexPath.row].beverageTitle
        cell.beverageSubTitle.text = beverageFiltered[indexPath.row].beveargeSubTitle
        cell.beverageImage.image = beverageFiltered[indexPath.row].beveageImage
        
        cell.beverageImage.layer.cornerRadius = 30
        cell.beverageImage.clipsToBounds = true
    
        cell.beverageTitle.textColor = UIColor.black
        cell.beverageTitle.font = UIFont.systemFont(ofSize: 15)
        
        cell.beverageSubTitle.textColor = UIColor.systemGray
        cell.beverageSubTitle.font = UIFont.systemFont(ofSize: 12)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
//        beverageDetailFiltered = Beverage.infos.filter{$0.categoryId == bigIndex && $0.beverageId == beverage[indexPath.row].beverageId}
        
//        print(beverageDetailFiltered)
        
        guard let moveToBeverage = storyboard?.instantiateViewController(withIdentifier: "beverageViewController") as? beverageViewController
        else {
            return
            }
//        moveToBeverage.index = [bigIndex, beverage[indexPath.row].beverageId]
        moveToBeverage.beverageName = beverageFiltered[indexPath.row].beverageTitle
        moveToBeverage.beverageEngName = beverageFiltered[indexPath.row].beveargeSubTitle
        moveToBeverage.beverageDetail = beverageFiltered[indexPath.row].beverageContent
        moveToBeverage.beverageFee = beverageFiltered[indexPath.row].beveragePrice
        moveToBeverage.beveragePhoto = beverageFiltered[indexPath.row].beveageImage
        
        self.navigationController?.pushViewController(moveToBeverage, animated: true)
    }
}

