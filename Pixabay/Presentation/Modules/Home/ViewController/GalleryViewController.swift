//
//  GalleryViewController.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit
import RxSwift
import RxCocoa

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
        bindUI() 
        subscribe()
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

// MARK: - Search Bar Delegate
extension GalleryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.dataSource?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView
            .dequeueReusableCell(GalleryCollectionViewCell.self,
                                 for: indexPath)
        cell.model = self.viewModel.dataSource?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (self.viewModel.dataSource?.count ?? 0) - 1{
            self.viewModel.page += 1
            self.viewModel.getImages()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = self.viewModel.dataSource?[indexPath.row] else { return }
        self.coordinator?.presentImageDetail(model: model)
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
    
    func bindUI() {
        searchBar.rx.text
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                self.viewModel.page = 1
                self.viewModel.filterModel.searchTerm = query == "" ? nil : query
                self.viewModel.getImages()
            })
            .disposed(by: bag)

        searchBar.rx.selectedScopeButtonIndex
            .subscribe(onNext: { value in
                self.viewModel.page = 1
                self.viewModel.filterModel.category = Categories(rawValue: value)?.description
                self.viewModel.getImages()
            })
            .disposed(by: bag)
    }

}
