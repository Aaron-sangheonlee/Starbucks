//
//  OrderViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/27.
//

import UIKit

var myMenuList = [MyList]()

class OrderViewController: UIViewController{
    
   
    
    var text: String = ""
    var notice: String = "환경을 위해 일회용컵 사용 줄이기에 동참해 주세요"
    var size: String = "사이즈"
    var cup: String = "컵 선택"
    
    @IBOutlet weak var beverageTitle: UILabel!
    @IBOutlet weak var noticeLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var tallSizeButton: UIButton!
    @IBOutlet weak var grandeSizeButton: UIButton!
    @IBOutlet weak var ventiSizeButton: UIButton!
    @IBOutlet weak var cupLabel: UILabel!
    @IBOutlet weak var hereCupButton: UIButton!
    @IBOutlet weak var myCupButton: UIButton!
    @IBOutlet weak var togoCupButton: UIButton!
    @IBOutlet weak var beverageStepper: UIStepper!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var prices: UILabel!
    
    @IBOutlet weak var addMyMenuButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    
    
    var beverageEngTitle: String = ""
    var beverageContent: String = ""
    var beverageDollar: String = ""
    var beverageQty: Int = 0
    
    let heartButton = UIButton(type: .custom)
    
    @IBAction func changeValue(_ sender: UIStepper) {
        
        beverageQty = Int(beverageStepper.value)
        
        quantity.text = " 개수 : \(beverageQty) "
        
        calculate()
    }
    
    func calculate(){
        
        beverageDollar = beverageDollar.replacingOccurrences(of: ",", with: "")
        beverageDollar = beverageDollar.replacingOccurrences(of: "원", with: "")
        
        let filtered = Int(beverageDollar)!
        
        let sum = filtered * beverageQty
        
        prices.text = "\(sum) 원"
    }
    
    @objc
    func heartDidTap(){
        
        let items: MyList = MyList(beverageTitle: text, beveargeSubTitle: beverageEngTitle, beverageContent: beverageContent, beveragePrice: beverageDollar)
        
        addMyMenuButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        addMyMenuButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        
        if addMyMenuButton.isSelected {
        
            addMyMenuButton.setImage(UIImage(named: "suit.heart.fill"), for: .selected)
            addMyMenuButton.isSelected = false
        } else {
            addMyMenuButton.setImage(UIImage(named: "suit.heart"), for: .normal)
            
            myMenuList.append(items)
            print(myMenuList)
            
            addMyMenuButton.isSelected = true
        }
    }
        
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
        
        quantity.text = " 개수 : 0 "
        prices.text = "0 원"
        
        self.beverageTitle.text = text
        self.noticeLabel.text = notice
        self.sizeLabel.text = size
        self.cupLabel.text = cup
        
        noticeLabel.font = UIFont.systemFont(ofSize: 15)
        noticeLabel.textColor = UIColor.white
        noticeLabel.backgroundColor = UIColor.systemGreen
        
        beverageTitle.font = UIFont.systemFont(ofSize: 20)
        
        sizeLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        cupLabel.font = UIFont.boldSystemFont(ofSize: 22)
        /*
        tallSizeButton.setImage(UIImage(named: "cupSizeTall"), for: .normal)
        grandeSizeButton.setImage(UIImage(named: "cupSizeGrande"), for: .normal)
        ventiSizeButton.setImage(UIImage(named: "cupSizeVenti"), for: .normal)
         */
        
        self.orderButton.setTitle("주문하기", for: .normal)
        self.orderButton.setTitleColor(.white, for: .normal)
        self.orderButton.backgroundColor = UIColor.systemGreen
        
        addMyMenuButton.setImage(UIImage(named: "suit.heart"), for: .normal)

        addMyMenuButton.addTarget(self, action: #selector(heartDidTap), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        addMyMenuButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        
        loadAllData()
        print(myMenuList)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveAllData()
    }
}
