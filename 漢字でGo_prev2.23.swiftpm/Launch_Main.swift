import SpriteKit
import SwiftUI



//var my_username = "Roughfts"
//ユーザー名はここを変更　日本語可能　長すぎるのはやめてね
//""で挟んでね。必ず半角で。
var my_username = "Roughfts"
//他は一切触らないでね！








var is_init = true
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        // SKViewを表示
        SpriteView(scene: initialScene()) // 初期シーンを指定
            .ignoresSafeArea() // セーフエリアを無視して画面全体を使用
        
    }
    // 初期シーンを設定する関数
    func initialScene() -> SKScene {
        let menuScene = MenuScene(size: CGSize(width: 1024, height: 768)) // 初期画面としてGameOverSceneを使用
        menuScene.scaleMode = .aspectFill
        return menuScene
    }
}
