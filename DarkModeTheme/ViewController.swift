//
//  ViewController.swift
//  DarkModeTheme
//
//  Created by alican on 7.11.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var btnChange: UIButton!
    
    @IBOutlet weak var introLabel: UILabel!
    
    
    private let floatingButton : UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.backgroundColor = .systemPink
        let image = UIImage(systemName: "plus",withConfiguration: UIImage.SymbolConfiguration(pointSize: 32,weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        //button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let themeButton : UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        button.backgroundColor = .systemPink
        let image = UIImage(systemName: "plus",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20,weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        //button.layer.masksToBounds = true
        button.layer.cornerRadius = 22
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        themeSwitch.addTarget(self, action: #selector(didChangeThemeSwitchValue), for: .valueChanged)
        themeSwitch.isOn = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheme()
        view.addSubview(floatingButton)
        view.addSubview(themeButton)
        themeSwitch.theme.thumbTintColor = themed { $0.textColor }
        btnChange.theme.backgroundColor =  themed { $0.btnColor }
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        themeButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        introLabel.text = "viewController.label.introMessage".localized()
    }
    
    @objc private func didTapButton(){
        let alert = UIAlertController(title: "Add Something", message: "Floating Buttoon Tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmis", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert,animated: true)
    }
    
    @objc private func changeTheme(){
        let alert = UIAlertController(title: "ChangeTheme", message: "Floating Buttoon Tapped", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmis", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert,animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 60 - 18, y: view.frame.size.height - 60 - 8 - view.safeAreaInsets.bottom , width: 60, height: 60)
        themeButton.frame = CGRect(x: view.frame.size.width - 52 - 18, y: view.frame.size.height - 115 - 8 - view.safeAreaInsets.bottom , width: 45, height: 45)
    }

    @objc func didChangeThemeSwitchValue(){
        if themeSwitch.isOn{
            themeService.switch(.dark)
        }else{
            themeService.switch(.light)
        }
    }
    
    func setupTheme(){
        view.theme.backgroundColor = themed { $0.backgroundColor }

    }
}


