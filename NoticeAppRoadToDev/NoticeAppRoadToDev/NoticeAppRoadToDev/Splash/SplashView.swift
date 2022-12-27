//
//  SplashView.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 25.12.2022.
//

import Foundation
import UIKit

class SplashView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init coder: has not been implemented")
    }
}

extension SplashView {

    func style() {
    }

    func layout() {
    }
}

// MARK: - UITextFieldDelegate
extension SplashView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
