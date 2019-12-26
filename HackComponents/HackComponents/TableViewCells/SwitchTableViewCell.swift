//
//  SwitchTableViewCell.swift
//  HackComponents
//
//  Created by Max Pavlov on 25/12/2019.
//  Copyright © 2019 Pavlov Max. All rights reserved.
//

import UIKit

/// Ячейка с свитчем
final class SwitchTableViewCell: UITableViewCell {

	// MARK: - Properties

	/// Свитч
	let switcher: UISwitch = {
		let switcher = UISwitch()
		switcher.translatesAutoresizingMaskIntoConstraints = false
		return switcher
	}()

	/// Лейбл заголовка
	let titleLabel: UILabel = {
		let titleLabel = UILabel()
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.textColor = ColorPallete.trueWhite
		titleLabel.font = UIFont.systemFont(ofSize: 16)

		return titleLabel
	}()

	/// Лейбл описания
	let descriptionLabel: UILabel = {
		let descriptionLabel = UILabel()
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.textColor = ColorPallete.trueDarkGray
		descriptionLabel.font = UIFont.systemFont(ofSize: 14)
		return descriptionLabel
	}()

	// MARK: - Initializers

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super .init(style: style, reuseIdentifier: reuseIdentifier)
		contentView.backgroundColor = ColorPallete.trueBlack
		selectionStyle = .none
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Private methods
	
	private func setupConstraints() {
		contentView.addSubview(switcher)
		contentView.addSubview(titleLabel)
		contentView.addSubview(descriptionLabel)

		switcher.setContentCompressionResistancePriority(.required, for: .horizontal)
		NSLayoutConstraint.activate([
			switcher.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			switcher.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),

			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
			titleLabel.rightAnchor.constraint(equalTo: switcher.leftAnchor, constant: -16),

			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
			descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
			descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)])
	}

}
