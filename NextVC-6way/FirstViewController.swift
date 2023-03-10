//
//  FirstViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

// MARK: - 코드로 프로퍼티를 통해 데이터 전달 및 화면이동
class FirstViewController: UIViewController {
    
    lazy var firstLable: UILabel = {
        let label = UILabel(frame: CGRect(x: self.view.frame.width/2-200,
                                          y: self.view.frame.height/2-25,
                                          width: 400, height: 50))
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    // 데이터를 받기 위해 변수를 생성해줘야 합니다.
    var strData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(firstLable)
        self.view.backgroundColor = .white
        
        // 프로퍼티로 데이터를 받아와 label에 업데이트
        firstLable.text = strData ?? ""
    }
}

