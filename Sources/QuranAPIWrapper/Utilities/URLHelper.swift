//
//  URLHelper.swift
//  Created by Khaled Chehab on 09/06/2021.
//

import Foundation

class Urlable {
    private let urlBuilder: URLBuilder
    
    fileprivate init(_ urlBuilder: URLBuilder) {
        self.urlBuilder = urlBuilder
    }
    
    func url() -> URL? {
        return urlBuilder.build()
    }
}

class ChapterURL: Urlable {
    override private init(_ urlBuilder: URLBuilder) {
        super.init(urlBuilder)
    }
    
    static func chapterList(withLanguage language: String?) -> ChapterURL {
        return ChapterURL(URLBuilder()
                            .add(resource: .chapters)
                            .add(queryString: .language, withValue: language))
    }
    
    static func chapter(withId id: Int, andLanguage language: String?) -> ChapterURL {
        return ChapterURL(URLBuilder()
                            .add(resource: .chapters)
                            .add(resourceId: id)
                            .add(queryString: .language, withValue: language))
    }
    
    static func chapterInfo(withId id: Int, andLanguage language: String?) -> ChapterURL {
        return ChapterURL(URLBuilder()
                            .add(resource: .chapters)
                            .add(resourceId: id)
                            .add(resource: .info)
                            .add(queryString: .language, withValue: language))
    }
}

class JuzURL: Urlable {
    override private init(_ urlBuilder: URLBuilder) {
        super.init(urlBuilder)
    }
    
    static func juzList() -> JuzURL {
        return JuzURL(URLBuilder()
                        .add(resource: .juzs))
    }
}
