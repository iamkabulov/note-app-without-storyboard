//
//  NoteViewController.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 26.12.2022.
//

import Foundation
import UIKit

protocol NoteViewControllerDelegate: AnyObject {
    func didTappedSaveButton(note: String)
}

class NoteViewController: UIViewController {
    lazy var noteView = NoteView(note: self.note)
    let note: String
    weak var delegate: NoteViewControllerDelegate?
    lazy var saveButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        barButtonItem.tintColor = .systemBlue
        return barButtonItem
    }()

    @objc func saveButtonTapped() {
//        delegate?.didTappedSaveButton(note: noteView.noteTextField.text!)
        navigationController?.popViewController(animated: true)
        UserDefaults.standard.set(noteView.noteTextField.text!, forKey: NotesData.Keys.notes.rawValue)
    }
    

    init(note: String) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension NoteViewController {

    func style() {
        noteView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.rightBarButtonItem = saveButton
        title = "Item"
    }

    func layout() {
        view.addSubview(noteView)

        NSLayoutConstraint.activate([
            noteView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            noteView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: noteView.trailingAnchor, multiplier: 1)
        ])
    }
}
