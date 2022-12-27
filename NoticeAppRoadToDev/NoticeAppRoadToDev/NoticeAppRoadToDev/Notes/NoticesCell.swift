//
//  NoticesCell.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 26.12.2022.
//

import Foundation
import UIKit

class NoticeCell: UITableViewCell {

    let noteLabel = UILabel()
    static let reuseId = "CellId"
    static let rowHeight: CGFloat = 112
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoticeCell {
    func setup() {
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        noteLabel.adjustsFontForContentSizeCategory = true
        contentView.addSubview(noteLabel)
    }

    func layout() {
        NSLayoutConstraint.activate([
            noteLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            noteLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
        ])
    }
}
