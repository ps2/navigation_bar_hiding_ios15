//
//  ViewController.swift
//  ModalTest2
//
//  Created by Pete Schwamb on 5/10/22.
//

import UIKit
import SwiftUI

struct MainView: View {
    @State private var presented: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Main Content")
                    .sheet(isPresented: $presented) { ModalViewWrapper() }
                Button("Show Modal Sheet") { presented = true }
                Spacer()
            }
            .navigationTitle("Main Nav Bar")
        }
    }
}

struct ModalViewWrapper: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return ModalNavController()
    }
}

class ModalNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIHostingController(rootView: ModalContentView())
        pushViewController(vc, animated: false)
    }
}

struct ModalContentView: View {
    @State private var hideNavBar: Bool = false

    var body: some View {
        VStack {
            Text("ModalContentView content")
                .padding()
            Button("Toggle Nav Bar") { hideNavBar.toggle() }
            Spacer()
        }
        .navigationTitle("ModalContentView")
        .navigationBarHidden(hideNavBar)
    }
}

