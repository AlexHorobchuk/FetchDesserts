//
//  LoadingImage.swift
//  FetchDessert
//
//  Created by Olha Dzhyhirei on 9/23/23.
//

import SwiftUI

struct LoadingImage: View {
    
    let imageSize: ImageSize
    
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { status in
            
            switch status {
                
            case .failure:
                Image(systemName: "cup.and.saucer")
                    .resizable()
                    .scaledToFit()
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            default:
                ProgressView()
            }
        }
        .frame(width: imageSize.getSize().width, height: imageSize.getSize().height)
        .clipShape(RoundedRectangle(cornerRadius: imageSize.getCornerRedaius()))
    }
}

struct LoadingImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadingImage(imageSize: .small, url: MockData.meal.thumbnailURL!)
    }
}
