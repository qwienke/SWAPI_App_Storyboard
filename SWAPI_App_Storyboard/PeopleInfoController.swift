//
//  PeopleInfoController.swift
//  SWAPI_App_Storyboard
//
//  Created by Quinn Wienke on 2/1/24.
//

import Foundation

class PeopleInfoController {
    enum getPeopleInfoError: Error, LocalizedError {
        case itemNotFound
    }
    
    
    func fetchPeopleInfo() async throws ->  GetPeopleInfo {
        var urlComponents = URLComponents(string:
                                            "https://swapi.dev/api/people")!
        urlComponents.queryItems = [
            "name": "Rey Skywalker"
        ].map { URLQueryItem(name: $0.key, value: $0.value) }
        
        let (data, response) = try await URLSession.shared.data(from:
                                                                    urlComponents.url!)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            print("error 404")
            throw getPeopleInfoError.itemNotFound
        }
        
        let jsonDecoder = JSONDecoder()
        let personInfo = try jsonDecoder.decode(GetPeopleInfo.self,
                                                from: data)
        print(personInfo)
        return (personInfo)
    }
}
