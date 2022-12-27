//
//  LocalState.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 25.12.2022.
//

import Foundation

public class LocalState {
    public enum Keys: String {
        case hasOnboarded
    }

    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
}
