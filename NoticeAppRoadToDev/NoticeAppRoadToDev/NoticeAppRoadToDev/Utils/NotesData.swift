//
//  NotesData.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 26.12.2022.
//

import Foundation

class NotesData {

    public enum Keys: String {
        case notes
        case note2
    }

    init(_ note: String = "") {
        self.notes = note
    }

    public var notes: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.notes.rawValue) ?? ""
        }
        set(newValue) {
            return UserDefaults.standard.set(newValue, forKey: Keys.notes.rawValue)
        }
    }
}
