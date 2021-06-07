//
//  Constants.swift
//  Created by Khaled Chehab on 06/06/2021.
//

import Foundation

struct Constants {
    private init() {}
    
    struct QuranAPI {
        private init() {}
        
        static let baseUrl = "https://api.quran.com/api"
        static let version = "/v4"
        
        // TODO later on when the wrapper is more modularized, move these constants to enums so that they can be sent as parameters to a private
        // wrapper api call (endpoints and parameters)
        struct Endpoints {
            private init() {}
            
            static let chapters = "/chapters"
            static let juzs = "/juzs"
            static let resources = "/resources"
            static let recitations = "/recitations"
            
            static let info = "/info"
        }
        
        struct Parameters {
            private init() {}
            
            static let language = "language"
        }
    }
}
