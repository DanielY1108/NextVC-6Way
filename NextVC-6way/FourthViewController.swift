//
//  FourthViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

// MARK: - 스토리보드의 직접세그로 연결 후 화면이동 및 데이터 전달
class FourthViewController: UIViewController {
    
    @IBOutlet weak var fourthLabel: UILabel!
    
    // 데이터를 받기 위해 변수를 생성해줘야 합니다.
    var strData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 받은 데이터를 label에 업데이트
        fourthLabel.text = strData
    }
}
