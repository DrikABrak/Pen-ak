//
//  SupaAPI.swift
//  Peñak
//
//  Created by Cedric Trespeuch on 19/09/2024.
//

import Foundation
import Supabase

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case network(_ error: Error?)
    case invalidError
}

public final class SupaAPI {
    
    public init() {}

    let client: SupabaseClient = SupabaseClient(supabaseURL: URL(string: "https://ipzabqlvaayfafvkgrde.supabase.co")!,
                                                supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlwemFicWx2YWF5ZmFmdmtncmRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ0MjAwMTYsImV4cCI6MjAzOTk5NjAxNn0.pKpGnNhR3DH9OQ8SXSDE9A_ghcdbgfPoxrfma5jxcjM")

    
//    func request<T: Decodable>(type: EndPointType) async throws -> T {
//        guard let url = type.url else { throw NetworkError.invalidURL }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = type.method.rawValue
//
//        if let body = type.body {
//            request.httpBody = try? JSONEncoder().encode(body)
//        }
//
//        request.allHTTPHeaderFields = type.headers
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.invalidResponse }
//
//        return try JSONDecoder().decode(T.self, from: data)
//    }
//
//    static var commonHeaders: [String: String]? {
//        ["accept" : "application/json"]
//    }
}
