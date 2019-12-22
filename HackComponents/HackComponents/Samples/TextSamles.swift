//
//  TextSamles.swift
//  HackComponents
//
//  Created by Max Pavlov on 22/12/2019.
//  Copyright © 2019 Pavlov Max. All rights reserved.
//

/// Примеры текста
enum TextSamles {
	case short
	case medium
	case long

	var text: String {
		switch self {
		case .short:
			return "Sample text"
		case .medium:
			return """
			Lorem ipsum dolor sit amet, consectetur
			adipiscing elit sed do
			"""
		case .long:
			return """
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, \
			sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \
			Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
			"""
		}
	}

}
