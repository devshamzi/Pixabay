//
//  GalleryViewController.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit

class GalleryViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            configureHierarchy()
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - Variables
    var viewModel = GalleryViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pixabay"
        subscribe()
        viewModel.getImages()

    }

    // MARK: - Private Functions
    private func configureHierarchy() {
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(GalleryCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self

    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView
            .dequeueReusableCell(GalleryCollectionViewCell.self,
                                 for: indexPath)
        cell.model = self.viewModel.dataSource[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.dataSource.count - 1{
            self.viewModel.page += 1
            self.viewModel.getImages()
        }
    }
}

// MARK: - Bindable
extension GalleryViewController {
    func subscribe() {
        viewModel.onChange.subscribe(onNext: { [weak self] (state) in
            guard let self = self else { return }
            switch state {
            case .success:
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }

            case .failure(let message):
                print(message)
            }
        }).disposed(by: bag)
    }
}
