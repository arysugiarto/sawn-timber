//
//  CalculatorViewModels.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import Foundation
import CoreData

class CalculatorViewModel: ObservableObject {
    private let context: NSManagedObjectContext
    
    // Published biar UI otomatis update kalau ada perubahan
    @Published var histories: [CalculationHistoryEntity] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchHistories()
    }
    
    // MARK: - Perhitungan
    func volumeSmalian(_ d1: Double, _ d2: Double, _ length: Double) -> Double {
        let r1 = d1 / 200.0
        let r2 = d2 / 200.0
        return Double.pi * length * (r1 * r1 + r2 * r2) / 2.0
    }
    
    func volumeHuber(_ d: Double, _ length: Double) -> Double {
        let r = d / 200.0
        return Double.pi * r * r * length
    }
    
    func volumeBrereton(_ b1: Double, _ b2: Double, _ b3: Double, _ b4: Double, _ length: Double) -> Double {
        let d1 = (b1 + b2) / 2.0
        let d2 = (b3 + b4) / 2.0
        let r1 = d1 / 200.0
        let r2 = d2 / 200.0
        return Double.pi * length * (r1 * r1 + r2 * r2) / 2.0
    }
    
    func volumeSawnPerBoard(_ width: Double, _ thickness: Double, _ length: Double) -> Double {
        return (width / 100.0) * (thickness / 100.0) * length
    }
    
    func conversionPercent(_ sawn: Double, _ log: Double) -> Double {
        return log > 0 ? (sawn / log) * 100.0 : 0.0
    }
    
    // MARK: - Core Data Operations
    func saveCalculation(volumeLog: Double, volumeSawn: Double, conversion: Double, totalPrice: Double) {
        let history = CalculationHistoryEntity(context: context)
        history.id = UUID()
        history.date = Date()
        history.volumeLog = volumeLog
        history.volumeSawn = volumeSawn
        history.conversion = conversion
        history.totalPrice = totalPrice
        
        do {
            try context.save()
            fetchHistories()
        } catch {
            print("❌ Error saving history: \(error)")
        }
    }
    
    func fetchHistories() {
        let request: NSFetchRequest<CalculationHistoryEntity> = CalculationHistoryEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CalculationHistoryEntity.date, ascending: false)]
        
        do {
            histories = try context.fetch(request)
        } catch {
            print("❌ Error fetching histories: \(error)")
            histories = []
        }
    }
    
    func deleteHistory(_ history: CalculationHistoryEntity) {
        context.delete(history)
        do {
            try context.save()
            fetchHistories()
        } catch {
            print("❌ Error deleting history: \(error)")
        }
    }
}
