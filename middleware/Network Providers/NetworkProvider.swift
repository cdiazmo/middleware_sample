//
//  NetworkProvider.swift
//  MiddlewareSampleProject
//
//  Created by Carlos Diaz on 9/7/22.
//

import Foundation
import Middleware

class NetworkProvider
{
    
}

extension NetworkProvider: NetworkProtocol
{
    func sendRequest<T>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> where T : Decodable {
        guard let url = URL(string: endpoint.url) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        for header in endpoint.header ?? [:]
        {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        

        if let (data, _) = try? await URLSession.shared.data(for: request),
            let result = try? JSONDecoder().decode(responseModel, from: data)
        {
            return .success(result)
        }
        else
        {
            return .failure(.decode)
        }

    }
}
