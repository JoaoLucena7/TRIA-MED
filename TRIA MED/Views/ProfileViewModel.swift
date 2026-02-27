//
//  ProfileViewModel.swift
//  TRIA MED
//
//  Created by Joao felipe Lucena on 27/02/26.
//

import Foundation
import SwiftUI

final class StorageViewModel: ObservableObject {
    @Published var docsCount: Int = 6
    @Published var midiasCount: Int = 4
    
    let maxDocs: Int = 20
    let maxMidias: Int = 30
    
    var docsProgress: Double {
        guard maxDocs > 0 else { return 0 }
        return min(1.0, Double(docsCount) / Double(maxDocs))
    }
    
    var midiasProgress: Double {
        guard maxMidias > 0 else { return 0 }
        return min(1.0, Double(midiasCount) / Double(maxMidias))
    }
    
    
    private var totalCapacity: Double {
        Double(maxDocs + maxMidias)
    }
    
    var docsWidthFractionInUnifiedBar: Double {
        guard totalCapacity > 0 else { return 0 }
        return (Double(maxDocs) / totalCapacity) * docsProgress
    }
    
    var midiasWidthFractionInUnifiedBar: Double {
        guard totalCapacity > 0 else { return 0 }
        return (Double(maxMidias) / totalCapacity) * midiasProgress
    }
    
    func addDoc() { docsCount += 1 }
    func addMidia() { midiasCount += 1 }
}



