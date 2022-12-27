//
//  NoteView.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 26.12.2022.
//

import Foundation
import UIKit

class NoteView: UIView {

    let noteTextField = UITextField()

    init(note: String) {
        super.init(frame: .zero)
        style()
        layout()
        noteTextField.text = note
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        style()
//        layout()
//    }

    required init?(coder: NSCoder) {
        fatalError("init coder: has not been implemented")
    }
}

extension NoteView {

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = .secondarySystemBackground

        noteTextField.translatesAutoresizingMaskIntoConstraints = false
        noteTextField.placeholder = "Enter your note"
        noteTextField.delegate = self
    }

    func layout() {
        addSubview(noteTextField)

        //stack
        NSLayoutConstraint.activate([
            noteTextField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            noteTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            noteTextField.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: noteTextField.bottomAnchor, multiplier: 1)
        ])



    }
}

// MARK: - UITextFieldDelegate
extension NoteView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        noteTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

