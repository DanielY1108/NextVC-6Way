//
//  FifthViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

// MARK: - 클로저로 데이터 전달
class FifthViewController: UIViewController {
    
    lazy var fifthTextFiled: UITextField = {
        let tf = UITextField(frame: CGRect(x: self.view.frame.width/2-150,
                                          y: self.view.frame.height/2-20,
                                          width: 300, height: 40))
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 24)
        return tf
    }()
    
    lazy var fifthButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.view.frame.width/2-40,
                                          y: self.view.frame.height/2+40,
                                          width: 80, height: 50))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("전달", for: .normal)
        button.addTarget(self, action: #selector(fifthButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 데이터를 받기 위해 변수를 생성해줘야 합니다.
    var strData: String?
    
    // String을 갖고 어떠한 행동을 담기위해 클로저를 생성
    var closure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(fifthTextFiled)
        self.view.addSubview(fifthButton)
        self.view.backgroundColor = .lightGray
        
        // (A -> B 전달) 프로퍼티로 데이터를 받아 label에 업데이트
        fifthTextFiled.text = strData ?? ""
    }
    
    
    @objc func fifthButtonTapped(_ sender: UIButton) {
        // 데이터의 전달 확인을 위해 문자 "from ClosureVC" 를 추가
        let text = "\(fifthTextFiled.text ?? "") from ClosureVC"
        
        // 클로저의 input부분에 데이터를 담아줍니다. (B -> A 전달)
        closure?(text)
        dismiss(animated: true)
    }
}
