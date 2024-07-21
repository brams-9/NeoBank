//
//  ProductListAPIService.swift
//  DigitalBank
//
//  Created by Rahman Bramantya on 20/07/24.
//

import Foundation

protocol ProductListRestAPIServiceProtocol {
    func fetchProductListData() async -> Result<[ProductGroupListResponse], Error>
}

enum ProductListServiceError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

class ProductListRestAPIService: ProductListRestAPIServiceProtocol {
    var urlSession: URLSession
    init(urlSession: URLSession) {
        self.urlSession = urlSession
        
    }
    func fetchProductListData() async -> Result<[ProductGroupListResponse], Error> {
        let urlString = "https://60c18a34-89cf-4554-b241-cd3cdfcc93ff.mock.pstmn.io/interview/deposits/list"
                guard let url = URL(string: urlString) else {
                    return .failure(ProductListServiceError.invalidURL)
                }
                
                do {
                    let (data, _) = try await urlSession.data(from: url)
                    
                    let playlistData = try JSONDecoder().decode(BaseAPIResponse<[ProductGroupListResponse]>.self, from: data)
                    
                    return .success(playlistData.data)
                } catch let error as DecodingError {
                    return .failure(ProductListServiceError.decodingError(error))
                } catch {
                    return .failure(ProductListServiceError.networkError(error))
                }
            }
}
