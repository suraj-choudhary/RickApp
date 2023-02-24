//
//  RMCharacterViewCell.swift
//  RickAndMortyApp
//
//  Created by suraj kumar on 24/02/23.
//

import UIKit
/// single cell for a   character
final class RMCharacterViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterViewCell"
    
    /// image view for charcater
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLable: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .orange
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    /// Initializer
    /// - Parameter frame: frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView, nameLable, statusLable)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLable.heightAnchor.constraint(equalToConstant: 50),
            nameLable.heightAnchor.constraint(equalToConstant: 50),
            statusLable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLable.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            statusLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLable.bottomAnchor.constraint(equalTo: statusLable.topAnchor, constant: -3),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            imageView.bottomAnchor.constraint(equalTo: nameLable.topAnchor, constant: -3)
            
        ])
        imageView.backgroundColor = .systemPink
        nameLable.backgroundColor = .red
        statusLable.backgroundColor = .orange
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLable.text = nil
        statusLable.text = nil
    }
    
    public func configure(with viewModel: RMCharacterColletionViewCellViewModel) {
        nameLable.text = viewModel.characterName
        statusLable.text = viewModel.characterStatusText
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let failure):
                print(String(describing: failure))
                break
            }
        }
        
    }
    
}
