//
//  ViewController.swift
//  FlickrSearch
//
//  Created by Dennis Nesanoff on 05.05.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "PhotoCell"
    private let data = [
        UIColor.green, UIColor.orange, UIColor.yellow,
        UIColor.red, UIColor.purple, UIColor.brown,
        UIColor.green, UIColor.blue, UIColor.yellow,
    ]
    private let insets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
//    private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewSetup()
    }
    
    override func viewDidLayoutSubviews() {
//        let width: CGFloat = collectionView.frame.width / 2 //- insets.left - insets.right / 2
//        layout.itemSize = CGSize(width: width, height: width)
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        layout.invalidateLayout()
    }
    
    func collectionViewSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        layout.scrollDirection = .horizontal
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count * 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let index = indexPath.item % data.count
        let color = data[index]
        cell.setup(color: color)
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let paddingSpace = insets.left * (itemsPerRow + 1)
        let width: CGFloat = collectionView.frame.width / 2 - insets.left - insets.right / 2
        return CGSize(width: width, height: width)
    }

    // paddings for sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }

    // paddings for item in the section of vertical
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
