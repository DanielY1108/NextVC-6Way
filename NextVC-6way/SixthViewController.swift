//
//  SixthViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

class SixthViewController: UIViewController {
    
    lazy var sixthTextFiled: UITextField = {
        let tf = UITextField(frame: CGRect(x: self.view.frame.width/2-150,
                                          y: self.view.frame.height/2-20,
                                          width: 300, height: 40))
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 24)
        return tf
    }()
    
    lazy var sixthButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width/2-40,
                                          y: self.view.frame.height/2+40,
                                          width: 80, height: 50))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("전달", for: .normal)
        button.addTarget(self, action: #selector(sixthButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 데이터를 받기 위해 변수를 생성해줘야 합니다.
    var strData: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(sixthTextFiled)
        self.view.addSubview(sixthButton)
        self.view.backgroundColor = .lightGray
        
        // (A -> B 전달) 프로퍼티로 데이터를 받아 label에 업데이트
        sixthTextFiled.text = strData ?? ""
    }
    
    @objc func sixthButtonTapped(_ sender: UIButton) {
        // 데이터의 전달 확인을 위해 문자 "from Notication" 를 추가
        let text = "\(sixthTextFiled.text ?? "") from Notication"

        // 노티피케이션 Post는 데이터를 추가할 수 있고 알람을 보낸다.
        // 알람을 보내서 작업을 수행하라고 지시하는 시점이다.
        NotificationCenter.default.post(name: Notification.Name("Notification"), object: text)
        
        self.navigationController?.popViewController(animated: true)
    }
}
