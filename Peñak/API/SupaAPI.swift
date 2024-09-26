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

    let client: SupabaseClient = SupabaseClient(supabaseURL: URL(string: "URL_SUPABASE")!,
                                                supabaseKey: "KEY_SUPABASE")
}
