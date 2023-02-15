//
//  SecondViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

// MARK: - 스토리보드로 뷰 컨트롤러를 만들어 화면이동 및 데이터 전달
class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    
    // 데이터를 받기 위해 변수를 생성해줘야 합니다.
    var strData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 받은 데이터를 if let 바인딩으로 옵셔널을 벗긴 후 label에 업데이트
        if let safeStrData = strData {
            secondLabel.text = safeStrData
        }
    }
}
