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
    var name: Variable<String> = Variable("Try it! 👆")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.becomeFirstResponder()
        
        name.asObservable()
            .bind(to: self.nameLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateText()
    }
    
    func updateText() {
        self.name.value = textField.text == nil || textField.text == "" ? "It works! 😉" : textField.text!
    }
    
}
