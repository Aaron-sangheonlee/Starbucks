//
//  myMenuViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/27.
//

import UIKit

class myMenuViewController: UIViewController {
    
    @IBOutlet weak var myMenuTableView: UITableView!
    @IBOutlet weak var orderLabel: UILabel!
    
    func saveAllData() {
        let data = myMenuList.map{
            [
                "title" : $0.beverageTitle, //0번부터 저장
                "subtitle" : $0.beveargeSubTitle,
                "content" : $0.beverageContent,
                "price": $0.beveragePrice
            ]
        }
    
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "items") //키, value 설정
        userDefaults.synchronize() //동기화
    }
    
    func loadAllData(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "items") as? [[String: AnyObject]]
        else{
            return
            }
        print(data.description)
        print(type(of: data))
        
        myMenuList = data.map {
            var beverageTitle = $0["title"] as? String
            var beveargeSubTitle = $0["subtitle"] as? String
            var beverageContent = $0["content"] as? String
            var beveragePrice = $0["price"] as? String
            
            return MyList(beverageTitle: beverageTitle!, beveargeSubTitle:beveargeSubTitle!, beverageContent:beverageContent!, beveragePrice:beveragePrice!)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMenuTableView.delegate = self
        myMenuTableView.dataSource = self
        
        myMenuTableView.register(UINib(nibName: "myMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "myMenuCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(myMenuList)
        loadAllData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        saveAllData()
    }
}

extension myMenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return myMenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  myMenuTableView.dequeueReusableCell(withIdentifier: "myMenuCell") as! myMenuTableViewCell
        
        print(myMenuList)
        
        cell.beverageTitle.text = myMenuList[indexPath.row].beverageTitle
        print(cell.beverageTitle.text)
        cell.beverageEngTitle.text = myMenuList[indexPath.row].beveargeSubTitle
        cell.beveragePrice.text = myMenuList[indexPath.row].beveragePrice
        
        cell.beverageTitle.textColor = .black
        cell.beverageTitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        cell.beverageEngTitle.textColor = .systemGray4
        cell.beverageEngTitle.font = UIFont.systemFont(ofSize: 12)
        
        cell.beveragePrice.textColor = .black
        cell.beveragePrice.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        cell.myMenuButton.isSelected = true
        cell.myMenuButton.setImage(UIImage(named: "suit.heart.fill"), for: .selected)
        
        if cell.myMenuButton.isSelected {
            cell.myMenuButton.setImage(UIImage(named: "suit.heart.fill"), for: .selected)
            cell.myMenuButton.isSelected = false
        } else {
            cell.myMenuButton.setImage(UIImage(named: "suit.heart"), for: .normal)
            
            myMenuList.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        cell.orderButton.setTitle("주문하기", for: .normal)
        cell.orderButton.backgroundColor = .systemGreen
        cell.orderButton.setTitleColor(.white, for: .normal)
    
        return cell
    }
    
    
}

