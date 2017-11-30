//
//  ViewController.swift
//  TestingRx
//
//  Created by Julian Caicedo on 30.11.17.
//  Copyright © 2017 JulianCaicedo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var colorSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        // Bind UI
        bindUI()
    }
    
    func bindUI() {
        Observable.combineLatest(
            colorSwitch.rx.isOn,
            textField.rx.text,
            resultSelector: { colorOn, currentName in
                let output: String = "Tipped: \(currentName!)"
                if colorOn {
                    let a1 = [ NSAttributedStringKey.foregroundColor: UIColor.green ]
                    return NSAttributedString(string: output, attributes: a1)
                } else {
                    return NSAttributedString(string: output)
                }
        })
        .bind(to: nameLabel.rx.attributedText)
        .disposed(by: disposeBag)
    }
    
}
