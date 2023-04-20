//
//  ContentView.swift
//  TipGenius
//
//

import SwiftUI

struct ContentView: View {
    @State private var bill: String = ""
    @State private var amtPaid: String = ""
    @State private var result: String = ""
    @State private var percentage: Double = 0.0

    func calcTip() {
        if let dBill = Double(bill), let dAmtPaid = Double(amtPaid) {
            let tip = dAmtPaid - dBill
            percentage = (tip/dBill)*100
            result = "Your tip amount is $\(tip) (\(String(format: "%.1f", percentage)))%"
        } else {
            result = ""
        }
    }

    var body: some View {
        VStack {
            Text("TipGenius").font(.title3)
                .bold()
//                .accessibilityLabel("TipGenius")
                .accessibilityIdentifier("app_title")
            Spacer()
            TextField("How much was the bill", text: $bill)
                .keyboardType(.numberPad)
                .padding()
                .accessibilityIdentifier("bill_amt")
                .onChange(of: bill) { _ in
                    calcTip()
                }

            TextField("How much you want to pay", text: $amtPaid)
                .keyboardType(.numberPad)
                .padding()
                .accessibilityIdentifier("amt_paid")
                .onChange(of: amtPaid) { _ in
                    calcTip()
                }


            Text(result)
                .foregroundColor(percentage < 5 ? .red : .blue).bold()
                .accessibilityIdentifier("result")
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
