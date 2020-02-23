//
//  StoryboardUtils.swift
//  Signer
//
//  Created by Samruddhi on 23/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

class StoryboardUtil {
    static func instantiateView<ViewController: UIViewController>(_ storyboardID: String,
                                                                  _ viewStoryboardID: String) -> ViewController {
        guard let view = UIStoryboard(name: storyboardID,
                                      bundle: nil).instantiateViewController(withIdentifier:
                                        viewStoryboardID) as? ViewController else {
            fatalError("Failed to initaite for \(storyboardID) and \(viewStoryboardID)")
        }
        return view
    }
}
