//
//  ViewController.swift
//  middleware
//
//  Created by Carlos Diaz on 9/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!

    @IBOutlet weak var generateChuckNorrisJokeButton: UIButton!
    {
        didSet
        {
            generateChuckNorrisJokeButton.addTarget(self, action: #selector(getChuckNorrisJoke), for: .touchUpInside)
        }
    }

    @IBOutlet weak var generateDadJokeButton: UIButton!
    {
        didSet
        {
            generateDadJokeButton.addTarget(self, action: #selector(getDadJoke), for: .touchUpInside)
        }
    }
    
    private let jokeDataProvider = JokesDataProvider()

    @objc private func getChuckNorrisJoke() {
        Task {
            jokeLabel.text = await jokeDataProvider.getChuckNorrisJoke()
        }
    }
    
    @objc private func getDadJoke() {
        Task {
            jokeLabel.text = await jokeDataProvider.getDadJoke()
        }
    }
}

