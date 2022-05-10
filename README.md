# navigation_bar_hiding_ios15

In iOS15, `.navigationBarHidden(...)` and `.navigationTitle("...")` are not respected in SwiftUI views inside of a `UINavigationViewController` that
itself is presented modally (via `UIViewControllerRepresentable`) from a NavigationView.

The same layout structure works fine in iOS 14.
