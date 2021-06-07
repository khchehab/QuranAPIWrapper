//
//  RequestHelper.swift
//  Created by Khaled Chehab on 07/06/2021.
//

import Foundation

struct RequestHelper {
    private init() {}
    
    static func constructURL(withResource resource: Endpoint, andResourceId resourceId: Int? = nil, andAdditionalResource additionalResource: Endpoint? = nil, andParameter parameter: Parameter? = nil, withValueOf parameterValue: String? = nil) -> URL? {
        return URL(string: "\(QuranAPIConstants.baseUrl)\(QuranAPIConstants.version)/\(resource)\(resourceId == nil ? "" : "/\(resourceId!)")\(additionalResource == nil ? "" : "/\(additionalResource!)")\(parameter == nil ? "" : "?\(parameter!)=\(parameterValue!)")")
    }
}
