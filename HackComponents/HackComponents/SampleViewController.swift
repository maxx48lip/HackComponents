//
//  SampleViewController.swift
//  HackComponents
//
//  Created by Max Pavlov on 23/12/2019.
//  Copyright © 2019 Pavlov Max. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

	// MARK: - Properties

	/// TableView на весь экран с вариантами отображения модуля
	let mainTableView = UITableView(frame: .zero, style: .grouped)

	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavBar()
		setupMainTableView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

	// MARK: - Private methods

	/// Сетапим НавБар
	private func setupNavBar() {
		title = "Настройки"
		navigationController?.navigationBar.barStyle = .blackTranslucent

		let settingsIcon = UIImage(named: "Settings")
		let settingsButton = UIBarButtonItem(image: settingsIcon, style: .plain, target: self, action: #selector(popBack))
		settingsButton.tintColor = .white
		navigationItem.rightBarButtonItem = settingsButton

		let backIcon = UIImage(named: "ChevronLeft")
		let backButton = UIBarButtonItem(image: backIcon, style: .plain, target: self, action: #selector(popBack))
		backButton.tintColor = .white
		navigationItem.leftBarButtonItem = backButton
		navigationController?.navigationBar.barTintColor = ColorPallete.trueBlack
		UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
															NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-Bold",
																								size: 18)!]
	}

	/// Действие - вернуться на предыдущий контроллер
	@objc private func popBack() {
		navigationController?.popViewController(animated: true)
	}

	/// Сетапим TableView
	private func setupMainTableView() {
		mainTableView.rowHeight = UITableView.automaticDimension
		mainTableView.estimatedRowHeight = 300
		mainTableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(mainTableView)
		NSLayoutConstraint.activate([
			mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
			mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
		mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SampleTableViewCell")
		mainTableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "SecondCell")
		mainTableView.dataSource = self
		mainTableView.delegate = self
		mainTableView.backgroundColor = ColorPallete.trueBlack
	}
}

extension SampleViewController: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = SwitchTableViewCell(style: .default, reuseIdentifier: "SampleTableViewCell")
		cell.titleLabel.text = "Первая тестовая настройка пользователя"
		cell.titleLabel.numberOfLines = 2
		cell.descriptionLabel.text = "Довольно длинное описание настройки пользователя в несколько строк"
		cell.descriptionLabel.numberOfLines = 2
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
			return 110
	}
}
