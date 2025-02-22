/*
import SwiftUI
import SpriteKit



struct ContentView: View {
    /*
    init() {
        registerFont(withName: "AoyamaGyosho")
    }
     */
    var scene: SKScene {
        let scene = MenuScene(size: CGSize(width: 1024, height: 768))
        
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}

/*
func registerFont(withName name: String) {
    guard let fontURL = Bundle.main.url(forResource: name, withExtension: "ttf"),
          let fontData = try? Data(contentsOf: fontURL) as CFData,
          let provider = CGDataProvider(data: fontData),
          let font = CGFont(provider) else {
        print("Failed to load font: \(name)")
        return
    }
    
    var error: Unmanaged<CFError>?
    if !CTFontManagerRegisterGraphicsFont(font, &error) {
        print("Error registering font: \(String(describing: error?.takeUnretainedValue()))")
    }
}
*/
 
 
 
 
 
*/



