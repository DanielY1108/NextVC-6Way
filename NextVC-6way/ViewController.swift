//
//  ViewController.swift
//  NextVC-6way
//
//  Created by JINSEOK on 2023/02/15.
//

import UIKit

enum Buttons: Int {
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
}

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var sixthTextField: UITextField!
    @IBOutlet weak var seventhTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 스토리보드로 뷰컨트롤러 만들어서 전달
    // 스토리보드 간접세그로 연결 후 전달
    // 스토리보드 직접세그로 연결 후 전달
    // 클로저로 전달
    // 노티피케이션 전달
    // 델리게이트 전달
    
    @IBAction func nextButtonsTapped(_ sender: UIButton) {
        switch sender.tag {
            
            // 코드로 전달
        case Buttons.first.rawValue:
            let firstVC = FirstViewController()
            // 현재 텍스트 필드에 적혀있는 텍스트를 firstVC의 strData로 전달!
            firstVC.strData = firstTextField.text
            // 네이게이션의 push를 통한 화면 전환
            navigationController?.pushViewController(firstVC, animated: true)
            return
            
        default: break
        }
    }
    
}



//    @IBAction func secondButtonTapped(_ sender: UIButton) {
//
//    }
//
//    @IBAction func thirdButtonTapped(_ sender: UIButton) {
//
//    }
//
//    @IBAction func fourthButtonTapped(_ sender: UIButton) {
//
//    }
//
//    @IBAction func fifthButtonTapped(_ sender: UIButton) {
//
//    }
//
//    @IBAction func sixthButtonTapped(_ sender: UIButton) {
//
//    }
//
//    @IBAction func delegateButtonTapped(_ sender: UIButton) {
//
//    }

