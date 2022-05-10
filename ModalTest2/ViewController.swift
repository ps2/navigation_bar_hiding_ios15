//
//  ViewController.swift
//  ModalTest2
//
//  Created by Pete Schwamb on 5/10/22.
//

import UIKit
import SwiftUI

// MARK: Normal Loop presenting device vc

//class MainViewController: UINavigationController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        let modal = DeviceManagerVC()
//        present(modal, animated: true)
//    }
//}


// MARK: Onboarding presenting device vc

struct MainOnboardingFlow: View {
    @State private var presented: Bool = false
    var topLevelNavigationView: Bool

    var body: some View {
        if topLevelNavigationView {
            // .navigationBarHidden(true) is *not* respected in this case on iOS 15
            NavigationView {
                content
            }
        } else {
            // .navigationBarHidden(true) is respected in this case
            content
        }
    }

    var content: some View {
        VStack {
            Text("Onboarding")
                .sheet(isPresented: $presented) { DeviceOnboardingWrapper() }
            Button("Onboard Device") { presented = true }
            Spacer()
        }
    }
}

struct DeviceOnboardingWrapper: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return DeviceManagerVC()
    }
}



// MARK: Device VC

class DeviceManagerVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIHostingController(rootView: FirstDeviceScreen())
        pushViewController(vc, animated: false)
    }
}

struct FirstDeviceScreen: View {
    var body: some View {
        VStack {
            Text("First Device Screen")
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

