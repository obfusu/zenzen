//
//  ContentView.swift
//  zenzen
//
//  Created by Ganesh on 18/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(parseZip())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
