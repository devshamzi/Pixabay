//
//  GalleryViewController.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit

class GalleryViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            configureHierarchy()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pixabay"
        // Do any additional setup after loading the view.

    }

    private func configureHierarchy() {
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self

    }
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)


        switch indexPath.row%10 {
        case 0:
            cell.backgroundColor = .blue
        case 1:
            cell.backgroundColor = .yellow
        case 2:
            cell.backgroundColor = .green
        case 3:
            cell.backgroundColor = .orange
        case 4:
            cell.backgroundColor = .systemBlue
        case 5:
            cell.backgroundColor = .darkGray
        case 6:
            cell.backgroundColor = .systemPink
        case 7:
            cell.backgroundColor = .systemRed
        case 8:
            cell.backgroundColor = .magenta
        case 9:
            cell.backgroundColor = .systemIndigo
        default:
            cell.backgroundColor = .white
        }

        return cell
    }
}
