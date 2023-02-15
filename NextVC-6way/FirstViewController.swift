//
//  FirstViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

// 코드로 화면 이동 및 데이터 전달
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
     
        // 받은 데이터를 if let 바인딩으로 옵셔널을 벗긴다음 label에 업데이트
        if let safeStrData = strData {
            firstLable.text = safeStrData
        }
    }
}
