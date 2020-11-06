//
//  NetworkManager.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/29.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager : NSObject{
    
    static let shared: NetworkManager = {
        return NetworkManager()
    }()
    
    var request: Alamofire.Request?
    let retryLimit = 3
    
    override init(){
        super.init()
    }
    
    func authorize(_ url: String, parameters: [String: Any]?, completion: @escaping (Result<Data, ErrorResponse>) -> Void) {
        request?.cancel()
        request = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            if let data = response.data {
                completion(.success(data))
            } else {
                completion(.failure(ErrorResponse(error_message: "데이터 처리중 문제가 발생했습니다.")))
            }
        }
    }
    
    func request<T>(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.queryString, interceptor: RequestInterceptor? = nil, completion: @escaping (Result<T, ErrorResponse>) -> Void) where T: Codable {

        let headers: HTTPHeaders = [
            "Request-Client-Type" : "S01010",
            "Content-Type" : "application/json",
            "Accept" : "application/json",
        ]
        
        let urlString = url
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: encodedString)!



        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: interceptor ?? self).validate().responseData( completionHandler: {response in
        switch response.result {
            case .success(let res):
                if let code = response.response?.statusCode{
                switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            // TODO: json 디코딩 실패.
                            debugPrint("response decoding error : \(error)")
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                        }
                    default:
                        debugPrint("알수 없는 응답입니다.")
                    }
                }
            case .failure(let error):
                if let data = response.data {
                    let resultJson = JSON(data)
                    if let errorMessage = resultJson["error"]["error_message"].rawString() {
                        completion(.failure(ErrorResponse(error_message: errorMessage)))
                    }
                } else {
                    debugPrint(error)
                    completion(.failure(ErrorResponse(error_message: "통신 오류가 발생했습니다.")))
                }

            }
        })
    }
}
