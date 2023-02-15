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
    
    // 세그웨이로 데이터를 전달하고 싶을땐 "prepare"함수를 이용해야 한다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // MARK: - 스토리보드의 간접세그로 연결 후 화면 이동 및 데이터 전달
        if segue.identifier == "ThirdVC" {
            // UIViewController(구체적이지 않은 타입) --> ThirdViewController 타입 캐스팅
            let thirdVC = segue.destination as! ThirdViewController  // 종착지 설정
            
            // 현재 텍스트 필드에 적혀있는 텍스트를 thirdVC의 strData로 전달!
            thirdVC.strData = thirdTextField.text
        }
    }
    
    // 스토리보드 직접세그로 연결 후 전달
    // 클로저로 전달
    // 노티피케이션 전달
    // 델리게이트 전달
    
    @IBAction func nextButtonsTapped(_ sender: UIButton) {
        switch sender.tag {
            
        // MARK: - 코드로 데이터 전달 및 화면 이동
        case Buttons.first.rawValue:
            // FirstVC의 객체를 생성해줍니다.
            let firstVC = FirstViewController()
            // 현재 텍스트 필드에 적혀있는 텍스트를 FirstVC의 strData로 전달!
            firstVC.strData = firstTextField.text
            
            // 네이게이션의 push를 통한 화면 전환
            navigationController?.pushViewController(firstVC, animated: true)
            return
            
        // MARK: - 스토리보드로 뷰 컨트롤러를 만들어 화면 이동 및 데이터 전달
        case Buttons.second.rawValue:
            // 정해준 스토리보드의 Identifier를 사용하여 ViewController를 불러와 줍시다.
            // 타입 캐스팅으로 UIViewController(구체적이지 않은 타입) -> SecondViewController 형변환을 해줘야 합니다.
            guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else { return }
            
            // 현재 텍스트 필드에 적혀있는 텍스트를 secondVC의 strData로 전달!
            secondVC.strData = secondTextField.text
            
            // 네이게이션의 push를 통한 화면 전환
            navigationController?.pushViewController(secondVC, animated: true)
            return
            
        // MARK: - 스토리보드의 간접세그로 연결 후 화면 이동 및 데이터 전달
        case Buttons.third.rawValue:
            
            performSegue(withIdentifier: "ThirdVC", sender: self)
            
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

