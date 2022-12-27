//
//  ViewController.swift
//  NoticeAppRoadToDev
//
//  Created by Кабулов Нурсултан Пернебаевич on 25.12.2022.
//

import UIKit

protocol SplashViewControllerDelegate: AnyObject {
    func didDone()
}

class SplashViewController: UIViewController {

    let splashView = UIView()
    let nextButton = UIButton(type: .system)
    let splashLabel = UILabel()

    weak var delegate: SplashViewControllerDelegate?



    //animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000

    var titleLeadingAnchor: NSLayoutConstraint?


    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }

}

extension SplashViewController {
    private func style() {
        //view
        splashView.translatesAutoresizingMaskIntoConstraints = false

        //nextbutton
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.configuration = .filled()
        nextButton.configuration?.imagePadding = 8
        nextButton.setTitle("Let's start", for: [])
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .primaryActionTriggered)

        //splash
        splashLabel.translatesAutoresizingMaskIntoConstraints = false
        splashLabel.text = "Road To iOS Developer"
        splashLabel.textAlignment = .center
        splashLabel.font = splashLabel.font.withSize(30)
        splashLabel.alpha = 0
    }

    private func layout() {

        //splashView
        view.addSubview(splashView)
        view.addSubview(splashLabel)
        view.addSubview(nextButton)

        //view
        NSLayoutConstraint.activate([
            splashView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            splashView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: splashView.trailingAnchor, multiplier: 1)
        ])

        //label
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalToSystemSpacingBelow: splashLabel.bottomAnchor, multiplier: 2),
            splashLabel.leadingAnchor.constraint(equalTo: splashView.leadingAnchor),
            splashLabel.trailingAnchor.constraint(equalTo: splashView.trailingAnchor)
        ])

        //label
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalToSystemSpacingBelow: splashLabel.bottomAnchor, multiplier: 2),
            splashLabel.trailingAnchor.constraint(equalTo: splashView.trailingAnchor)
        ])

        titleLeadingAnchor = splashLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true

        //nextbutton
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalToSystemSpacingBelow: splashView.bottomAnchor, multiplier: 2),
            nextButton.leadingAnchor.constraint(equalTo: splashView.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: splashView.trailingAnchor)
        ])
    }
}

//MARK: - Actions
extension SplashViewController {
    @objc func nextButtonTapped(sender: UIButton) {
        delegate?.didDone()
    }
}


extension SplashViewController {
    private func animate() {
        let duration = 0.5
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()

        let animator3 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut) {
            self.splashLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.05)
    }
}
