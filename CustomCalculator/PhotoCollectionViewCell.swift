//
//  PhotoCollectionViewCell.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/02/27.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import UIKit
import Photos

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    func setImage(assets: PHAsset) {
        let manager = PHImageManager()
        manager.requestImage(for: assets, targetSize: frame.size, contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
            self.imageView.image = image
        })
    }
}
