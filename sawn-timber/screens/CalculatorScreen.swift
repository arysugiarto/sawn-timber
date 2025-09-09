import SwiftUI
import CoreData

struct CalculatorScreen: View {
    @Environment(\.managedObjectContext) private var context
//    @StateObject private var vm: CalculatorViewModel
    
    @ObservedObject var vm: CalculatorViewModel
    
    @State private var method = "Smalian"
    @State private var length = ""
    
    @State private var d1 = ""
    @State private var d2 = ""
    @State private var dAvg = ""
    @State private var b1 = ""
    @State private var b2 = ""
    @State private var b3 = ""
    @State private var b4 = ""
    
    @State private var boardWidth = ""
    @State private var boardThickness = ""
    @State private var boardCount = ""
    @State private var pricePerBoard = "50000"
    
    @State private var resultVolumeLog = 0.0
    @State private var resultVolumeSawn = 0.0
    @State private var resultConversion = 0.0
    @State private var totalPrice = 0.0
    @State private var estimatedBoardCount = 0
    @State private var yieldPercent = 0.0
    @State private var recommendedMethod = ""
    
//    init(context: NSManagedObjectContext) {
//        _vm = StateObject(wrappedValue: CalculatorViewModel(context: context))
//    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Metode Perhitungan
                Text("Metode Perhitungan")
                    .font(.headline)
                
//                Picker("Metode", selection: $method) {
//                    ForEach(["Smalian", "Huber", "Brereton"], id: \.self) { m in
//                        Text(m).tag(m)
//                    }
//                }
//                .pickerStyle(.segmented)
                
                CustomSegmentedPicker(selection: $method, options: ["Smalian", "Huber", "Brereton"])


                
                CustomTextField(placeholder: "Panjang (m)", text: $length, keyboard: .decimalPad)
                
                if method == "Smalian" {
                    CustomTextField(placeholder: "Diameter pangkal (cm)", text: $d1, keyboard: .decimalPad)
                    CustomTextField(placeholder: "Diameter ujung (cm)", text: $d2, keyboard: .decimalPad)
                } else if method == "Huber" {
                    CustomTextField(placeholder: "Diameter rata-rata (cm)", text: $dAvg, keyboard: .decimalPad)
                } else {
                    Text("Masukkan empat pengukuran di pangkal & ujung")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    CustomTextField(placeholder: "d1 (Bu) - shortest", text: $b1, keyboard: .decimalPad)
                    CustomTextField(placeholder: "d2 (Bu) - longest", text: $b2, keyboard: .decimalPad)
                    CustomTextField(placeholder: "d3 (Bp) - shortest", text: $b3, keyboard: .decimalPad)
                    CustomTextField(placeholder: "d4 (Bp) - longest", text: $b4, keyboard: .decimalPad)
                }
                
                Divider()
                
                // MARK: - Input Kayu Gergaji
                Text("Input Kayu Gergaji")
                    .font(.headline)
                
                CustomTextField(placeholder: "Lebar papan (cm)", text: $boardWidth, keyboard: .decimalPad)
                CustomTextField(placeholder: "Ketebalan (cm)", text: $boardThickness, keyboard: .decimalPad)
                CustomTextField(placeholder: "Jumlah papan", text: $boardCount, keyboard: .numberPad)
                CustomTextField(placeholder: "Harga per papan (Rp)", text: $pricePerBoard, keyboard: .numberPad)
                
                // MARK: - Tombol Hitung
                Button(action: calculate) {
                    Text("Hitung & Simpan")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top)
                
                // MARK: - Hasil
                if resultVolumeLog > 0 {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Hasil")
                            .font(.headline)
                        
                        ResultRow(title: "Volume Log", value: "\(String(format: "%.4f", resultVolumeLog)) m³")
                        ResultRow(title: "Volume Kayu Gergaji", value: "\(String(format: "%.4f", resultVolumeSawn)) m³")
                        ResultRow(title: "Konversi", value: "\(String(format: "%.2f", resultConversion)) %")

                        ResultRow(title: "Total Harga", value: CurrencyFormatter.format(totalPrice))
                            .font(.headline)
                            .foregroundColor(.green)

                        ResultRow(title: "Estimasi Jumlah Papan", value: "\(estimatedBoardCount)")
                        ResultRow(title: "Rendemen", value: "\(String(format: "%.2f", yieldPercent)) %")
                        ResultRow(title: "Rekomendasi", value: recommendedMethod)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                
               
            }
            .padding()
        }
        .navigationTitle("Kalkulator")
    }
    
    // MARK: - Logic
    private func calculate() {
        let len = Double(length) ?? 0
        let vol: Double
        switch method {
        case "Smalian":
            vol = vm.volumeSmalian(Double(d1) ?? 0, Double(d2) ?? 0, len)
        case "Huber":
            vol = vm.volumeHuber(Double(dAvg) ?? 0, len)
        case "Brereton":
            vol = vm.volumeBrereton(Double(b1) ?? 0, Double(b2) ?? 0, Double(b3) ?? 0, Double(b4) ?? 0, len)
        default:
            vol = 0
        }
        
        let boardVol = vm.volumeSawnPerBoard(Double(boardWidth) ?? 0, Double(boardThickness) ?? 0, len)
        let totalSawn = boardVol * (Double(boardCount) ?? 0)
        
        resultVolumeLog = vol
        resultVolumeSawn = totalSawn
        resultConversion = vm.conversionPercent(totalSawn, vol)
        totalPrice = (Double(pricePerBoard) ?? 0) * (Double(boardCount) ?? 0)
        
        estimatedBoardCount = boardVol > 0 ? Int(vol / boardVol) : 0
        yieldPercent = vol > 0 ? (totalSawn / vol) * 100 : 0
        recommendedMethod = yieldPercent < 50
            ? "Plain Sawing - Hemat biaya"
            : (Double(boardWidth) ?? 0 >= 20 ? "Quarter Sawing - Stabilitas tinggi" : "Rift Sawing - Serat lurus terbaik")
        
        // Simpan ke Core Data
        vm.saveCalculation(
            volumeLog: resultVolumeLog,
            volumeSawn: resultVolumeSawn,
            conversion: resultConversion,
            totalPrice: totalPrice
        )
    }
}

// MARK: - Custom Components
struct ResultRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
}

// MARK: - Date Formatter
private let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.dateStyle = .short
    df.timeStyle = .short
    return df
}()
