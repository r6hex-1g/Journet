import SwiftUI
import Lottie

//MARK: - Resizable Lottie View
struct ResizableLottieView: UIViewRepresentable {
    var lottieView: LottieAnimationView
    var color: SwiftUI.Color = .black
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //MARK: - Dynamic Color Update
        //Finding Attached Lottie View
        if let animationView = uiView.subviews.first(where: { view in
            view is LottieAnimationView
            
        }) as? LottieAnimationView {
            //MARK: - Finding KeyPaths with the help of log
//              lottieView.logHierarchyKeypaths()
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            
            //MARK: - Fill Key Path
            let fillKeyPath = AnimationKeypath(keys: ["**", ".primary", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
        }
    }
    
    func addLottieView(to: UIView) {
        //MARK: - Memory Properties
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }
}
