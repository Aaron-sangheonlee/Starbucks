//
//  beverageViewController.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/27.
//

import UIKit

class beverageViewController: UIViewController {

    @IBOutlet var beverageDetailImage: UIImageView!
    @IBOutlet weak var beverageTitle: UILabel!
    @IBOutlet weak var beverageSubTitle: UILabel!
    @IBOutlet weak var beverageContent: UILabel!
    @IBOutlet weak var beveragePrice: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var beverageImage: UIImageView!
    
    var index: [Int] = []
    var beverageName: String = ""
    var beverageEngName: String = ""
    var beverageDetail: String = ""
    var beverageFee: String = ""
    var beveragePhoto: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation Bar 투명하게
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        //주문하기 버튼
        self.orderButton.setTitle("주문하기", for: .normal)
        self.orderButton.setTitleColor(.white, for: .normal)
        self.orderButton.backgroundColor = UIColor.systemGreen
        self.orderButton.layer.cornerRadius = 10
        
        self.beverageTitle.text = beverageName
        self.beverageSubTitle.text = beverageEngName
        self.beverageContent.text = beverageDetail
        self.beveragePrice.text = beverageFee
        self.beverageImage.image = beveragePhoto
        
        self.beverageTitle.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.beverageTitle.textColor = UIColor.black
        
        self.beverageSubTitle.font = UIFont.systemFont(ofSize: 15)
        self.beverageSubTitle.textColor = UIColor.systemGray4
        
        self.beverageContent.font = UIFont.systemFont(ofSize: 18)
        self.beverageContent.textColor = UIColor.systemGray
        
        //라벨 자동 줄 조절
        self.beverageContent.numberOfLines = 4
        self.beverageContent.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        self.beveragePrice.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.beveragePrice.textColor = UIColor.black
        
        
        
        
//        let button = UIButton(type: .custom)
//        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
    }
    
    @IBAction func orderButtonAction(_ sender: Any) {
        guard let moveToOrder = storyboard?.instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController
        else{
            return
        }
        
        moveToOrder.text = beverageName
        moveToOrder.beverageEngTitle = beverageEngName
        moveToOrder.beverageContent = beverageDetail
        moveToOrder.beverageDollar = beverageFee
        
        
        self.present(moveToOrder, animated: true, completion: nil)
        
        
    }
    
//    @objc func buttonDidTap(){
//
//        guard let moveToOrder = storyboard?.instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController
//        else {
//            return
//        }
        
        
        //self.present(moveToOrder, animated: true, completion: nil)
        
        
        
}


