//
//  EmulatingCase.swift
//  HackComponents
//
//  Created by Max Pavlov on 22/12/2019.
//  Copyright © 2019 Pavlov Max. All rights reserved.
//

/// Класс модели эмулирующего варианта отображения в плейграунде
final class EmulatingCase {

	/// Название кейса
	let title: String

	/// Блок отображения
	let actionBlock: (() -> Void)

	/// Номер секции в TableView
	let section: Int

	init(with title: String,
		 in section: Int,
		 actionBlock: @escaping (() -> Void)) {
		self.title = title
		self.section = section
		self.actionBlock = actionBlock
	}
}
