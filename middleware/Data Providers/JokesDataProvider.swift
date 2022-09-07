//
//  JokesDataProvider.swift
//  MiddlewareSampleProject
//
//  Created by Carlos Diaz on 9/7/22.
//

import Foundation
import Middleware

protocol JokesDataProviderProtocol
{
    func getDadJoke() async -> String?
    func getChuckNorrisJoke() async -> String?
}

class JokesDataProvider
{
    private var chuckNorrisJokesDataSource: JokeDataSource?
    
    private var dadJokesDataSource: DadJokeDataSource?
    
    private let networkProvider = NetworkProvider()

    init()
    {
        chuckNorrisJokesDataSource = JokeDataSource(networkProvider: networkProvider)
        dadJokesDataSource = DadJokeDataSource(networkProvider: networkProvider)
    }
}

extension JokesDataProvider : JokesDataProviderProtocol
{
    func getDadJoke() async -> String? {
        return await dadJokesDataSource?.getData()?.value
    }
    
    func getChuckNorrisJoke() async -> String? {
        return await chuckNorrisJokesDataSource?.getData()?.value
    }
}



