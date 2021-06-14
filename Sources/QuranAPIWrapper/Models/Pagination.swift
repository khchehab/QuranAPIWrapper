//
//  Pagination.swift
//  Created by Khaled Chehab on 14/06/2021.
//

import Foundation

struct Pagination: Decodable {
    let perPage: Int
    let currentPage: Int
    let nextPage: Int
    let totalPages: Int
    let totalRecords: Int
}
