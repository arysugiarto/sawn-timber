//
//  HistoryScreen.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

//

import SwiftUI

struct HistoryScreen: View {
    @ObservedObject var vm: CalculatorViewModel
    
    var body: some View {
        NavigationView {
            List {
                if vm.histories.isEmpty {
                    Text("Belum ada riwayat perhitungan")
                        .foregroundColor(.secondary)
                        .padding()
                        .listRowBackground(Color.clear)
                } else {
                    ForEach(vm.histories) { history in
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Tanggal: \(history.date?.formatted(date: .abbreviated, time: .shortened) ?? "-")")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text("Volume Log: \(String(format: "%.4f", history.volumeLog)) m³")
                            Text("Volume Kayu Gergaji: \(String(format: "%.4f", history.volumeSawn)) m³")
                            Text("Konversi: \(String(format: "%.2f", history.conversion)) %")
                            Text("Total Harga: \(CurrencyFormatter.format(history.totalPrice))")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.40)) // 👉 abu-abu muda
                                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                        )
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Riwayat Perhitungan")
            .toolbar {
                EditButton()
            }
        }
    }
    
    // MARK: - Delete Handler
    private func deleteItems(at offsets: IndexSet) {
        offsets.map { vm.histories[$0] }.forEach(vm.deleteHistory)
    }
}
