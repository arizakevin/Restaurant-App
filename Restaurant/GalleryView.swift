//
//  GalleryView.swift
//  Restaurant
//
//  Created by Kevin Ariza on 2/09/23.
//

import SwiftUI

struct GalleryView: View {
    @State var photoData = [String]()
    @State var sheetVisible = false
    @State var selectedPhoto = ""
    
    let dataService = DataService()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Gallery")
                .font(.largeTitle)
                .bold()
            GeometryReader { proxy in
                ScrollView (showsIndicators: false) {
                    LazyVGrid(
                        columns:[
                            GridItem(spacing: 10),
                            GridItem(spacing: 10),
                            GridItem(spacing: 10)
                        ],
                        spacing: 10
                    ) {
                        ForEach(photoData, id: \.self) { photo in
                            Image(photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: (proxy.size.width - 20) / 3)
                                .clipped()
                                .onTapGesture {
                                    selectedPhoto = photo
                                    sheetVisible = true
                                }
                        }
                    }
                }
            }
        }
        .padding(10)
        .onAppear {
            photoData = dataService.getGalleryPhotos()
            print(photoData)
        }
        .sheet(isPresented: $sheetVisible) {
            PhotoView(
                selectedPhoto: $selectedPhoto,
                sheetVisible: $sheetVisible
            )
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
