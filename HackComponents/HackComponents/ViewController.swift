//
//  ViewController.swift
//  HackComponents
//
//  Created by Max Pavlov on 22/12/2019.
//  Copyright © 2019 Pavlov Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Properties

	/// Варианты отображения для TableView
	var emulatingCases: [EmulatingCase] = []

	/// TableView на весь экран с вариантами отображения модуля
	let mainTableView = UITableView(frame: .zero, style: .grouped)

	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		Debugger.log(type: .magic, logString: nil)
		emulatingCasesCreate()
		setupMainTableView()
		// Do any additional setup after loading the view.
	}

	// MARK: - Setup TableView

	private func setupMainTableView() {
		mainTableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(mainTableView)
		NSLayoutConstraint.activate([
			mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
			mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
		mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlaygroundTableViewCell")
		mainTableView.dataSource = self
		mainTableView.delegate = self
	}

	// MARK: - Setup EmulatingCases

	private func emulatingCasesCreate() {
		emulatingCases = [
			EmulatingCase(with: TextSamles.short.text, in: 0,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),
			EmulatingCase(with: TextSamles.short.text, in: 0,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),
			EmulatingCase(with: TextSamles.short.text, in: 0,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),

			EmulatingCase(with: TextSamles.short.text, in: 1,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),
			EmulatingCase(with: TextSamles.short.text, in: 1,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),

			EmulatingCase(with: TextSamles.short.text, in: 2,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),
			EmulatingCase(with: TextSamles.short.text, in: 2,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),

			EmulatingCase(with: TextSamles.short.text, in: 3,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),
			EmulatingCase(with: TextSamles.short.text, in: 3,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) }),

			EmulatingCase(with: TextSamles.short.text, in: 4,
						  actionBlock: { Debugger.log(type: .magic, logString: nil) })
		]
	}

	private func getHeaderTitle(forSection section: Int) -> String {
		switch section {
		case 0:
			return "Стандартные кейсы отображения"
		case 1:
			return "Кейсы отображения без продуктов"
		case 2:
			return "Нестандартные кейсы отображения"
		case 3:
			return "Исключительные кейсы"
		case 4:
			return "В помощь для дебага"
		default:
			return ""
		}
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return (emulatingCases.last?.section ?? 0) + 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return emulatingCases.filter { $0.section == section }.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = mainTableView.dequeueReusableCell(withIdentifier: "PlaygroundTableViewCell",
													 for: indexPath) as UITableViewCell
		cell.textLabel?.text = emulatingCases.filter { $0.section == indexPath.section }[indexPath.row].title
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		emulatingCases.filter { $0.section == indexPath.section }[indexPath.row].actionBlock()
		tableView.deselectRow(at: indexPath, animated: true)
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return getHeaderTitle(forSection: section)
	}
}
