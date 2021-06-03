//
//  SelectImages.swift
//  SwiftUIKit
//
//  Created by OFweek01 on 2021/6/3.
//

import SwiftUI
import TZImagePickerController

struct SelectImages: UIViewControllerRepresentable {
    
    var maxImagesCount: Int
    var selectedAction: (([UIImage]) -> ())?
    
    func updateUIViewController(_ uiViewController: TZImagePickerController, context: Context) {
        
    }

    func makeUIViewController(context: Context) -> TZImagePickerController {
        let pickVC = TZImagePickerController()
        pickVC.modalPresentationStyle = .fullScreen
        pickVC.maxImagesCount = maxImagesCount
        pickVC.didFinishPickingPhotosHandle = {(photos,assets,isSelectOriginalPhoto) in
            if let _ = selectedAction {
                selectedAction!(photos ?? [])
            }
        }
        return pickVC
    }
}


