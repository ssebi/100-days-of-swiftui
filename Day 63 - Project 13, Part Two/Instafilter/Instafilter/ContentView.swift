//
//  ContentView.swift
//  Instafilter
//
//  Created by Sebastian Vidrea on 08/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }

    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }

        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.radius = 50

        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }

        // attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)

            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
