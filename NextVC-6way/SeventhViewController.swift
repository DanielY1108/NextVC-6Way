//
//  SeventhViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/16.
//

import UIKit

// MARK: - 델리게이트 전달
// 프로토콜을 동작을 정의할 함수와 함께 만들어 줍니다.
protocol SevenViewControllerDelegate: AnyObject {
    func getTextFieldData(_ viewController: SeventhViewController, data: String)
}

class SeventhViewController: UIViewController {

    lazy var sevnethTextFiled: UITextField = {
        let tf = UITextField(frame: CGRect(x: self.view.frame.width/2-150,
                                          y: self.view.frame.height/2-20,
                                          width: 300, height: 40))
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 24)
        return tf
    }()
    
    lazy var sevnethButton: UIButton = {
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
    
    // 델리게이트로 변수를 만들어 줍니다.
    var delegate: SevenViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(sevnethTextFiled)
        self.view.addSubview(sevnethButton)
        self.view.backgroundColor = .lightGray
        
        // (A -> B 전달) 프로퍼티로 데이터를 받아 label에 업데이트
        sevnethTextFiled.text = strData ?? ""
    }
    
    @objc func sixthButtonTapped(_ sender: UIButton) {
        // 데이터의 전달 확인을 위해 문자 "from Delegate"" 를 추가
        let text = "\(sevnethTextFiled.text ?? "") from Delegate"
        
        // 텍스트를 갖고 데이터를 전담합니다.
        self.delegate?.getTextFieldData(self, data: text)
        dismiss(animated: true)
    }
}
