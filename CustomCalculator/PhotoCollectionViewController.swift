//
//  PhotoCollectionViewController.swift
//  CustomCalculator
//
//  Created by 中川 慶悟 on 2017/02/26.
//  Copyright © 2017年 Keigo Nakagawa. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier: String = "image"
private let cellCountInRow: CGFloat = 3
private let cellPaddingSize: CGFloat = 1.0

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var images: [PHAsset] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
        assets.enumerateObjects({ asset, _, _ in
            self.images.append(asset as PHAsset)
        })
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PhotoCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! PhotoCollectionViewCell
        cell.setImage(assets: self.images[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize: CGFloat = ((self.collectionView?.frame.size.width)! - cellPaddingSize * cellCountInRow) / cellCountInRow
        return CGSize(width: cellSize, height: cellSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }

}
