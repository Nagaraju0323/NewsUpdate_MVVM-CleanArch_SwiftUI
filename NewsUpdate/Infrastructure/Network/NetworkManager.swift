//
//  NetworkManager.swift
//  NewsUpdate
//
//  Created by Nagaraju on 17/12/24.
//
import Foundation

//MARK: -NetworkManager

class NetworkManager {
    
    var featchreponse:featchResposeProtocol
    var featchdata:featchDataProtocol
    init(featchreponse: featchResposeProtocol = featchRespose(), featchdata: featchDataProtocol = featchData()) {
        self.featchreponse = featchreponse
        self.featchdata = featchdata
    }
    func featchReqest<T:Decodable>(_ endpoint:Endpoint) async throws -> T {
        
        guard let url = URL(string:endpoint.fullUrl) else {
            throw NetworkError.invalidURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data,resonse) = try await URLSession.shared.data(for: urlRequest)
        
        try featchreponse.featchResponseStatus(data, resonse)
        return try featchdata.featchData(T.self, data)
        
    }
}
//MARK: - HTTPURLResponse
protocol featchResposeProtocol {
    func featchResponseStatus(_ data:Data?,_ urlResponse:URLResponse?) throws
}

class featchRespose:featchResposeProtocol {
    
    func featchResponseStatus(_ data:Data?,_ urlResponse:URLResponse?) throws {
        guard let response = urlResponse as? HTTPURLResponse else {
            throw NetworkError.requestFailed(statusCode: 0)
        }
        
        switch response.statusCode {
        case 200...299:
            if data == nil {
                throw NetworkError.noData
            }
        case 400...499, 500...599:
            throw NetworkError.requestFailed(statusCode: response.statusCode)
        default:
            throw NetworkError.requestFailed(statusCode: response.statusCode)
        }
    }
}

//MARK: - JsonDecoding
protocol featchDataProtocol {
    
    func featchData<T:Decodable>(_ type:T.Type,_ data:Data) throws -> T
}

class featchData:featchDataProtocol {
    
    func featchData<T:Decodable>(_ type:T.Type,_ data:Data) throws -> T {
        do {
            let decodeResponse = try JSONDecoder().decode(type.self, from: data)
            return decodeResponse
        }catch {
            throw NetworkError.decodingError
        }
    }
}
