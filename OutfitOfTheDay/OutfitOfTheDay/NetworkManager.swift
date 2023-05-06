//
//  NetworkManager.swift
//  OutfitOfTheDay
//
//  Created by Mya Bridgeforth on 5/4/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    var userName = ""
    var url = "http://34.118.253.68"
    var headShared: [String] = []
    var topShared: [String] = []
    var bottomShared: [String] = []
    var shoesShared: [String] = []
    var outfitsShared: [OutfitObjects] = []
    
    func loginIn(username: String, password: String, completion: @escaping (LoginResponse) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/login/")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "username": username,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(LoginResponse.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print("Error when trying to login")
                }
            }
        }
        task.resume()
        
    }
    
    
    
    func signUp(username: String, password: String, completion: @escaping (LoginResponse) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/register/")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "username": username,
            "password": password
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(LoginResponse.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print("Error when trying to sign up")
                }
            }
        }
        task.resume()
        
    }
    
    
    func uploadClothing(type: String, userName: String, imageData: String, completion: @escaping (AddClothingResponse) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/clothing/create/")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "classification": type,
            "username": userName,
            "image_data": imageData
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(AddClothingResponse.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error)
                    print("Error when trying to add clothing")
                }
            }
        }
        task.resume()
        
    }
    
    
    func getAllPictures(userName: String, type: String, completion: @escaping (GetAllPictures) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/clothing/filter/")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "username": userName,
            "classification": type
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(GetAllPictures.self, from: data)
                    
                    
                    let substrings = response.assets.split(separator: " ").map({ String($0) })
                    
                    if type == "headwear" {
                        NetworkManager.shared.headShared.append(contentsOf: substrings)
                    }
                    else if type == "top" {
                        NetworkManager.shared.topShared.append(contentsOf: substrings)
                    }
                    else if type == "bottom" {
                        NetworkManager.shared.bottomShared.append(contentsOf: substrings)
                    }
                    else {
                        NetworkManager.shared.shoesShared.append(contentsOf: substrings)
                    }
                    
                    completion(response)
                }
                catch (let error) {
                    print(error)
                    print("Error when trying to POST all pictures")
                }
            }
        }
        task.resume()
        
    }
    
    
    
    

    func createOutfit(head: String, top: String, bottom: String, shoes: String, name: String, completion: @escaping (CreateOutfit) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/outfit/create/")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
//            CHANGE THIS TO THE RIGHT BODY WITH BACKEND
            "name": name,
            "headwear_id": head,
            "top_id": top,
            "bottom_id": bottom,
            "shoes_id": shoes,
            "username": NetworkManager.shared.userName
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(CreateOutfit.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print("Error when trying to create outfit")
                }
            }
        }
        task.resume()
        
    }
    
    
    
    
    func viewOutfits(username: String, completion: @escaping (ViewOutfits) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/outfit/list/")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "username": username
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ViewOutfits.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print("Error when trying to create outfit")
                }
            }
        }
        task.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func deleteOutfit(name: String, completion: @escaping (DeleteOutfit) -> Void) {
        
        var request = URLRequest(url: URL(string: url + "/outfit/<int:id>/")!)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
//            CHANGE THIS TO THE RIGHT BODY WITH BACKEND
            "name??????": name,
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(DeleteOutfit.self, from: data)
                    completion(response)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print("Error when trying to DELETE outfit")
                }
            }
        }
        task.resume()
        
    }
}
