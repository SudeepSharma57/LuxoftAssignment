//
//  ViewController.swift
//  TestProjectLuxSoft
//
//  Created by Sudeep Sharma on 14/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var finalMsgLbls: [UILabel]!
    @IBOutlet weak var amountTF: UITextField!
    
    var amountsOfA = [Int](), amountsOfB = [Int](), amountsOfC = [Int](), amountsOfD = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        amountTF.delegate = self
    }

    
    @IBAction func paidByBtnAction(_ sender: UIButton) {
        var enteredAmount:Int = Int(amountTF.text!) ?? 0
        var devidedPart = enteredAmount/4
        enteredAmount -= devidedPart
        switch sender.tag{
        case 100:
            amountsOfA.append(enteredAmount)
            amountsOfB.append(-devidedPart)
            amountsOfC.append(-devidedPart)
            amountsOfD.append(-devidedPart)
        case 200:
            amountsOfB.append(enteredAmount)
            amountsOfA.append(-devidedPart)
            amountsOfC.append(-devidedPart)
            amountsOfD.append(-devidedPart)
        case 300:
            amountsOfC.append(enteredAmount)
            amountsOfA.append(-devidedPart)
            amountsOfB.append(-devidedPart)
            amountsOfD.append(-devidedPart)
        default:
            amountsOfD.append(enteredAmount)
            amountsOfA.append(-devidedPart)
            amountsOfB.append(-devidedPart)
            amountsOfC.append(-devidedPart)
        }

        for index in 0..<amountsOfA.count{
            let amountofA = amountsOfA[index]
            let amountofB = amountsOfB[index]
            let amountofC = amountsOfC[index]
            let amountofD = amountsOfD[index]
            
            if amountofA > 0 {
                var str = "A owns "
                if amountofB < 0{
                    str.append("B \(abs(amountofB))")
                }
                if amountofC < 0{
                    str.append("and owns C \(abs(amountofC))")
                }
                if amountofD < 0{
                    str.append("and owns D \(abs(amountofD))")
                }
                finalMsgLbls[0].text = str
            }
            if amountofB > 0 {
                var str = "B owns "
                if amountofA < 0{
                    str.append("A \(abs(amountofA))")
                }
                if amountofC < 0{
                    str.append("and owns C \(abs(amountofC))")
                }
                if amountofD < 0{
                    str.append("and owns D \(abs(amountofD))")
                }
                finalMsgLbls[1].text = str
            }
            if amountofC > 0 {
                var str = "C owns "
                if amountofA < 0{
                    str.append("A \(abs(amountofA))")
                }
                if amountofB < 0{
                    str.append("and owns B \(abs(amountofB))")
                }
                if amountofD < 0{
                    str.append("and owns D \(abs(amountofD))")
                }
                finalMsgLbls[2].text = str
            }
            if amountofD > 0 {
                var str = "D owns "
                if amountofA < 0{
                    str.append("A \(abs(amountofA))")
                }
                if amountofB < 0{
                    str.append("and owns B \(abs(amountofB))")
                }
                if amountofC < 0{
                    str.append("and owns C \(abs(amountofC))")
                }
                finalMsgLbls[3].text = str
            }
        }
        
    }
}


extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

