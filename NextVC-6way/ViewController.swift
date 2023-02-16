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

class ViewController: UIViewController, SevenViewControllerDelegate {
    
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
        
        // MARK: - 스토리보드의 간접세그로 연결 후 화면이동 및 데이터 전달
        if segue.identifier == "ThirdVC" {
            // UIViewController(구체적이지 않은 타입) --> ThirdViewController 타입 캐스팅
            let thirdVC = segue.destination as! ThirdViewController  // 종착지 설정
            
            // 현재 텍스트 필드에 적혀있는 텍스트를 thirdVC의 strData로 전달!
            thirdVC.strData = thirdTextField.text
            
        // MARK: - 스토리보드의 직접세그로 연결 후 화면이동 및 데이터 전달
        // 직접적으로 연결했기 때문에 간접 세그에서 연견한 방식인 performSegue 호출없이 사용가능
        } else if segue.identifier == "FourthVC" {
            // UIViewController(구체적이지 않은 타입) --> ThirdViewController 타입 캐스팅
            let fourthVC = segue.destination as! FourthViewController  // 종착지 설정
            
            // 현재 텍스트 필드에 적혀있는 텍스트를 fourthVC의 strData로 전달!
            fourthVC.strData = fourthTextField.text
        }
    }
    
    // 스토리보드 직접세그로 연결 후 전달
    // 클로저로 전달
    // 노티피케이션 전달
    // 델리게이트 전달
    
    @IBAction func nextButtonsTapped(_ sender: UIButton) {
        switch sender.tag {
            
        // MARK: - 코드로 프로퍼티를 통해 데이터 전달 및 화면이동
        case 0:
            // FirstVC의 객체를 생성해줍니다.
            let firstVC = FirstViewController()
            // 현재 텍스트 필드에 적혀있는 텍스트를 FirstVC의 strData로 전달!
            firstVC.strData = firstTextField.text
            
            // 네이게이션의 push를 통한 화면 전환
            navigationController?.pushViewController(firstVC, animated: true)
            return
            
        // MARK: - 스토리보드로 뷰 컨트롤러를 만들어 화면이동 및 데이터 전달
        case 1:
            // 정해준 스토리보드의 Identifier를 사용하여 ViewController를 불러와 줍시다.
            // 타입 캐스팅으로 UIViewController(구체적이지 않은 타입) -> SecondViewController 형변환을 해줘야 합니다.
            guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else { return }
            
            // 현재 텍스트 필드에 적혀있는 텍스트를 secondVC의 strData로 전달!
            secondVC.strData = secondTextField.text
            
            // 네이게이션의 push를 통한 화면 전환
            navigationController?.pushViewController(secondVC, animated: true)
            return
            
        // MARK: - 스토리보드의 간접세그로 연결 후 화면이동 및 데이터 전달
        case 2:
            // 화면을 이동하기 위해 performSegue를 불러준다.
            performSegue(withIdentifier: "ThirdVC", sender: self)
            return
            

        // MARK: - 클로저로 데이터 전달
        // B -> A로 컨트롤러를 전환 시 클로저를 사용하여 데이터를 받아오고 행동을 정의함
        // A -> B 이동은 직접 객체의 프로퍼티로 접근하여 데이터를 넘겨는게 훨씬 간단하다.
        case 4:
            let fifthtVC = FifthViewController()
            // 현재 텍스트 필드에 적혀있는 텍스트를 FifthtVC의 strData로 전달!
            fifthtVC.strData = fifthTextField.text
            fifthtVC.modalPresentationStyle = .fullScreen
            present(fifthtVC, animated: true)
            
            // 클로저는 어떠한 행동과 데이터를 담아서 전달시키므로 이와같이 text 및 color도 변경 가능
            fifthtVC.closure = { text in
                self.fifthTextField.text = text
                self.fifthTextField.textColor = .red
            }
            return
            
        // MARK: - 노티피케이션 전달
        case 5:
            let sixthVC = SixthViewController()
            sixthVC.strData = sixthTextField.text ?? ""
            sixthVC.modalPresentationStyle = .fullScreen
            // addObserver는 일종에 관제소다.
            // Post로 알람이 오게 되면 관제소에서 관측을하여 받은 데이터를 갖고 notificationButtonTapped을 통해 작업을 수행시킨다.
            // 즉, 관측소에서 알람을 받으면 정의된 함수를 실행 시켜줌.
            NotificationCenter.default.addObserver(self, selector: #selector(notificationButtonTapped(_:)), name: NSNotification.Name("Notification"), object: nil)
            
            present(sixthVC, animated: true)
        
        // MARK: - 델리게이트 전달
        case 6:
            let seventhVC = SeventhViewController()
            seventhVC.strData = seventhTextField.text ?? ""
            seventhVC.modalPresentationStyle = .fullScreen
            // ⭐️ 대리자를 현재 뷰컨트롤러로 지정해줍니다.
            seventhVC.delegate = self
            
            present(seventhVC, animated: true)
        default: break
        }
    }
    
    // #selector로 관제소에서 post를 관측 시 이 동작을 실행시킨다.
    @objc func notificationButtonTapped(_ notification: Notification) {
        let notificationData = notification.object as? String
        
        sixthTextField.text = notificationData
        sixthTextField.textColor = .red
    }
    
    // 델리게이트 실행 시 데이터를 갖고 작업을 수행
    func getTextFieldData(_ viewController: SeventhViewController, data: String) {
        seventhTextField.text = data
        seventhTextField.textColor = .red
    }
}

