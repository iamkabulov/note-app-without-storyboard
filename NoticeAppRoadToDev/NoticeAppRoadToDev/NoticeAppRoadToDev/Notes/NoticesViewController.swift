//
//  NoticesViewController.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 25.12.2022.
//

import Foundation
import UIKit

class NoticesViewController: UIViewController, NoteViewControllerDelegate {

    private let noteViewController = NoteViewController(note: "")

    var note: NotesData!
    var notes = [NotesData.init("Первая заметка")]
    
    lazy var createButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonTapped))
        barButtonItem.tintColor = .systemBlue
        return barButtonItem
    }()

    var tableView = UITableView()
    var navBarItem = UINavigationItem()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        noteViewController.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @objc func createButtonTapped() {
        let vc = NoteViewController(note: "")
        navigationController?.pushViewController(vc, animated: true)
    }

    func didTappedSaveButton(note: String) {
        UserDefaults.standard.set(note, forKey: NotesData.Keys.note2.rawValue)
    }
}



extension NoticesViewController {
    private func setup() {

        title = "Items"
        navigationItem.rightBarButtonItem = createButton
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NoticeCell.self, forCellReuseIdentifier: NoticeCell.reuseId)
        tableView.rowHeight = NoticeCell.rowHeight

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension NoticesViewController: UINavigationBarDelegate {
    
}

extension NoticesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.reuseId, for: indexPath) as! NoticeCell
        cell.selectionStyle = .none
        cell.noteLabel.text = notes[indexPath.row].notes
        return cell
    }
}

extension NoticesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NoteViewController(note: notes[indexPath.row].notes)
        navigationController?.pushViewController(vc, animated: true)

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func saveNote() {
    }


    func loadNotes() {
        UserDefaults.standard.stringArray(forKey: NotesData.Keys.notes.rawValue)
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
}
