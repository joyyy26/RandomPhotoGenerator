//
//  ViewController.swift
//  PhotoGenerator
//
//  Created by Joy Chang on 2021/11/26.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Click for Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemRed,
        .systemCyan,
        .systemMint,
        .systemPurple,
        .systemOrange,
        .systemMint,
        .systemBrown,
        .systemYellow
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSubview()
        setUpConstraints()
    }
    
    @objc func tappedButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    func setUpSubview() {
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        view.addSubview(button)
        label = UILabel(frame: CGRect(x: 0, y:50, width:self.view.frame.size.width, height:100))
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.text = "Random Photo Generator"
        view.addSubview(label)
        getRandomPhoto()
        
    }
    
    func setUpConstraints() {
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        button.frame = CGRect(x: (self.view.frame.size.width-325) / 2, y: view.frame.size.height-130, width: 325, height: 55)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.center.x = view.center.x
        
    }
    
    func getRandomPhoto() {
//        let urlStr = "https://source.unsplash.com/random/200x200?sig=incrementingIdentifier"
        let num = Int.random(in: 0..<100)
        let xNSNumber = num as NSNumber
        let xString : String = xNSNumber.stringValue
        let urlStr = "https://source.unsplash.com/random/600x600?sig=" + xString
        let url = URL(string: urlStr)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
        
    }

}

