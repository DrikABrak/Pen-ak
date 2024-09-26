//
//  SupaService.swift
//  Peñak
//
//  Created by Cedric Trespeuch on 23/08/2024.
//

import Foundation
import Supabase

@Observable
class SupaService {
    
    private let api : SupaAPI
    
    var peñak: [Pena] = []
    
    public init(api: SupaAPI) {
        self.api = api
    }
        
    func getPeñak() async {
        do {
            self.peñak = try await api.client.from("penak").select().execute().value
        } catch {
            print(error)
            self.peñak = []
        }
    }
}

//import Observation
