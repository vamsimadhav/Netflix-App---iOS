//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Vamsi on 04/12/22.
//

import Foundation

struct Constants {
    let BASE_URL = "https://api.themoviedb.org/"
    let API_KEY = "dc347cb4b2fe10416fec5193dc37c4f1"
}

enum ApiError : Error {
    case failedToGetData
}

public class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(callback : @escaping (Result<[Title],Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants().BASE_URL)3/trending/movie/day?api_key=\(Constants().API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                callback(.success(results.results))
                
            }catch {
                callback(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(callback : @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants().BASE_URL)3/movie/popular?api_key=\(Constants().API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                callback(.success(results.results))
                
            }catch {
                callback(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcommingMovies(callback : @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants().BASE_URL)3/movie/upcoming?api_key=\(Constants().API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                callback(.success(results.results))
                
            }catch {
                callback(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(callback : @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(Constants().BASE_URL)3/movie/top_rated?api_key=\(Constants().API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                callback(.success(results.results))
                
            }catch {
                callback(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(callback : @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string: "\(Constants().BASE_URL)3/tv/top_rated?api_key=\(Constants().API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                callback(.success(results.results))
                
            }catch {
                callback(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
}
