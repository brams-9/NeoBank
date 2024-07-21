//
//  BaseAPIResponse.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 20/07/24.
//

import Foundation

struct BaseAPIResponse<T: Codable>: Codable {
    let data: T
}
