//
//  data class.swift
//  CafeOrderApp
//
//  Created by 이상헌 on 2021/07/25.
//

import Foundation
import UIKit

struct Beverage {
    
    var categoryId : Int
    var beverageId: Int
    var beverageTitle: String
    var beveargeSubTitle: String
    var beverageContent: String
    var beveragePrice: String
    var beveageImage: UIImage?
    
    static let infos: [Beverage] =
        [
            Beverage.init(categoryId : 0, beverageId: 0, beverageTitle: "아이스크림 블랜딩 콜드 브루", beveargeSubTitle: "Ice Cream Blending Cold Brew", beverageContent: "콜드 브루와 바닐라빈이 콕콕 박힌 아이스크림이 블랜딩 되어 진하고 부드러운 콜드 브루 풍미를 느낄 수 있는 콜드 브루", beveragePrice: "6,600원", beveageImage: UIImage(named: "Ice Cream Blending Cold Brew")),
            Beverage.init(categoryId : 0,beverageId: 1, beverageTitle: "아이스 유자 & 유스베리 티", beveargeSubTitle: "Iced Yuja & Youthberry Tea", beverageContent: "달콤 쌉싸름한 유자와 새콤한 유스베리가 만나 상큼함과 은은한 티의 풍미를 함께 즐길 수 있는 음료", beveragePrice: "5,900원", beveageImage: UIImage(named: "Iced Yuja & Youthberry Tea")),
            Beverage.init(categoryId : 0,beverageId: 2, beverageTitle: "유자 & 유스베리 티", beveargeSubTitle: "Yuja & Youthberry Tea", beverageContent: "달콤 쌉싸름한 유자와 새콤한 유스베리가 만나 상큼함과 은은한 티의 풍미를 함께 즐길 수 있는 음료", beveragePrice: "5,900원", beveageImage: UIImage(named: "Yuja & Youthberry Tea")),
            Beverage.init(categoryId : 0,beverageId: 3, beverageTitle: "트윙클 스타 핑크 블랜디드", beveargeSubTitle: "Twinkle Star Pink Blended", beverageContent: "세가지 종류의 그레이프 & 피치의 달콤함과 패션 탱고티의 새콤함이 입안 한 가득 풍부한 과일의 풍미를 선사하는 블랜디드", beveragePrice: "6,300원", beveageImage: UIImage(named: "Twinkle Star Pink Blended")),
            Beverage.init(categoryId : 1,beverageId: 4, beverageTitle: "아이스 카페 아메리카노", beveargeSubTitle: "Iced Caffe Americano", beverageContent: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피", beveragePrice: "4,100원", beveageImage: UIImage(named: "Iced Caffe Americano")),
            Beverage.init(categoryId : 1,beverageId: 5, beverageTitle: "아이스 카페 라떼", beveargeSubTitle: "Iced Caffe Latte", beverageContent: "풍부하고 진한 농도의 에스프레소가 시원한 우유와 얼음을 만나 고소함과 시원함을 즐길 수 있는 대표적인 커피 라떼", beveragePrice: "4,600원", beveageImage: UIImage(named: "Iced Caffe Latte")),
            Beverage.init(categoryId : 1,beverageId: 6, beverageTitle: "아이스크림 블랜딩 콜드 브루", beveargeSubTitle: "Ice Cream Blending Cold Brew", beverageContent: "콜드 브루와 바닐라빈이 콕콕 박힌 아이스크림이 블랜딩 되어 진하고 부드러운 콜드 브루 풍미를 느낄 수 있는 콜드 브루", beveragePrice: "6,600원", beveageImage: UIImage(named: "Ice Cream Blending Cold Brew")),
            Beverage.init(categoryId : 1,beverageId: 7, beverageTitle: "콜드 브루", beveargeSubTitle: "Cold Brew", beverageContent: "스타벅스 바리스타의 정성으로 탄생한 콜드 브루! 콜드 브루 전용 원두를 차가운 물로 14시간동안 추출하여 한정된 양만 제공됩니다. 깊은 풍미의 새로운 커피 경험을 즐겨보세요", beveragePrice: "4,500원", beveageImage: UIImage(named: "Cold Brew")),
            Beverage.init(categoryId : 1,beverageId: 8, beverageTitle: "카페 아메리카노", beveargeSubTitle: "Caffe Americano", beverageContent: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피", beveragePrice: "4,100원", beveageImage: UIImage(named: "Caffe Americano")),
            Beverage.init(categoryId : 1,beverageId: 9, beverageTitle: "아이스 자몽 허니 블랙 티", beveargeSubTitle: "Iced Grapefruit Honey Black Tea", beverageContent: "새콤한 자몽과 달콤한 꿀이 깊고 그윽한 풍미의 스타벅스 티바나 블랙 티의 조화", beveragePrice: "5,300원", beveageImage: UIImage(named: "Iced Grapefruit Honey Black Tea"))
        ]
               
    
    
}

struct BeverageCategory {
    
    var categoryId : Int
    var beverageCategoryTitle: String = ""
    var beverageCategorySubTitle: String?
    var beverageCategoryImage: UIImage?

    static let categoryInfos: [BeverageCategory] =
        [
            BeverageCategory.init(categoryId: 0, beverageCategoryTitle: "New", beverageCategorySubTitle: "", beverageCategoryImage: UIImage(named: "Ice Cream Blending Cold Brew")),
            BeverageCategory.init(categoryId: 1, beverageCategoryTitle: "추천", beverageCategorySubTitle: "Recommended", beverageCategoryImage: UIImage(named: "Iced Caffe Americano"))
        ]
}

struct MyList {

    var beverageTitle: String
    var beveargeSubTitle: String
    var beverageContent: String
    var beveragePrice: String
    
    
    init(beverageTitle: String, beveargeSubTitle: String, beverageContent: String, beveragePrice: String)  {
        self.beverageTitle = beverageTitle
        self.beveargeSubTitle = beveargeSubTitle
        self.beverageContent = beverageContent
        self.beveragePrice = beveragePrice
    }
    
}
