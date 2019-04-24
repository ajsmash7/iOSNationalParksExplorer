//
//  NationalParkService.swift
//  NationalParksExplorer
//
//  Created by AJMac on 4/24/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation

class NationalParkService {
    
    func fetchParks(for state: String, completion: @escaping ([NationalPark]?, Error?) -> Void) {
        
        let components: URLComponents = {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.nps.gov"
            components.path = "/api/v1/parks"
            components.queryItems = [ URLQueryItem(name: "stateCode", value: state), ]
            
            return components
        }()
        
        let url = components.url
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if let results = data {
                let decoder = JSONDecoder()
                print(data)
                do {
                    let results = try decoder.decode(NationalParkResult.self, from: results)
                    completion(results.data, nil)
                } catch {
                    print(error)
                    completion(nil, NationalParkServiceError.RequestError)
                }
            } else {
                print(error)
                completion(nil, NationalParkServiceError.RequestError)
            }
        }
        task.resume()
    }
    
    enum NationalParkServiceError: Error {
        case RequestError
        case ResponseParsingError
        
    }
}
