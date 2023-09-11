//
//  PhotoView.swift
//  Restaurant
//
//  Created by Kevin Ariza on 4/09/23.
//

import SwiftUI

struct PhotoView: View {
    @Binding var selectedPhoto: String
    @Binding var sheetVisible: Bool
    
    func closeSheet () {
        sheetVisible = false
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: closeSheet) {
                    Image(systemName: "x.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .opacity(0.6)
                }
            }
            .padding(10)
            
            Spacer()
            
            Image(selectedPhoto)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(
            selectedPhoto: Binding.constant("gallery1"),
            sheetVisible: Binding.constant(true)
        )
    }
}
