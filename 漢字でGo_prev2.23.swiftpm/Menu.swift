import AVFoundation
import SpriteKit

func registerFont(withName name: String) {
    guard let fontURL = Bundle.main.url(forResource: name, withExtension: "otf"),
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
class MenuScene: SKScene {
    var skip_button: SKLabelNode!
    var isIntroPlaying = false
    var isTurningMode:Bool = false
    var isInit_from_menu = false
    var currentMode: String {
        get {UserDefaults.standard.string(forKey: "currentMode") ?? "階層制"}
        set {UserDefaults.standard.set(newValue, forKey: "currentMode")}
    }
    override func didMove(to view: SKView) {
        if currentMode=="階層制"{currentMode="無制限"}else{currentMode="階層制"}
        isIntroPlaying = false
        /*
         for family in UIFont.familyNames {
         print("Font Family: \(family)")
         for name in UIFont.fontNames(forFamilyName: family) {
         print("    Font Name: \(name)")
         }
         }*/
        
        
        if is_init && !isInit_from_menu{
            //self.hideAllExcept(skipButton: self.skip_button, videoNode: self.videoNode)
            registerFont(withName: "KouzanGyoushoOTF")//KouzanBrushFontGyousyoOTF
            registerFont(withName: "HOT-GFKaishokk-E")//GFKaishokk-E
            registerFont(withName: "HOT-Gyoshokk-R")//Gyoshokk-R
            /*
             for family in UIFont.familyNames {
             print("Font Family: \(family)")
             for name in UIFont.fontNames(forFamilyName: family) {
             print("    Font Name: \(name)")
             }
             }*/
            // 動画を再生
            // 動画ノードの作成
            
            /*
             guard let videoURL = Bundle.main.url(forResource: "intro", withExtension: "mov") else {
             print("動画ファイルが見つかりません")
             return
             }
             */
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
                self.skip_button = SKLabelNode(text: "ローディング--動画をスキップする/固まったらおしてください)")
                self.skip_button.fontName = "GFKaishokk-E"
                self.skip_button.name = "skip_button"
                self.skip_button.fontSize = 20
                self.skip_button.zPosition = 60
                self.skip_button.fontColor = .black
                self.skip_button.alpha = 0.6
                self.skip_button.horizontalAlignmentMode = .right
                self.skip_button.position = CGPoint(x: self.frame.maxX-10, y: 10)
                self.addChild(self.skip_button)
                
            }
            
            backgroundColor = .black
            // AVPlayerを作成
            //let player = AVPlayer(url: videoURL)
            
            // SKVideoNodeをAVPlayerで初期化
            let videoNode = SKVideoNode(fileNamed: "intro.mp4")//avPlayer: player)
            
            // 動画のアスペクト比を計算してサイズを設定
            let videoSize = CGSize(width: size.width, height: size.height) 
            videoNode.name = "intro"
            videoNode.size = videoSize
            videoNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
            videoNode.zPosition = 40
            //videoNode.zRotation = .pi / 2 
            addChild(videoNode)
            //print("before")
            // 動画再生開始
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                videoNode.play()//videoNode.removeFromParent()
            }
            //print("after")
            isIntroPlaying = true
            let intro_length: TimeInterval = 34
            DispatchQueue.main.asyncAfter(deadline: .now() + intro_length) {
                let fadeOut = SKAction.fadeOut(withDuration: 4.0)
                let scaleDown = SKAction.scale(to: 0.6, duration: 3.0)
                let move_up = SKAction.moveTo(y: self.frame.maxY - 160, duration: 3.0)
                let group = SKAction.group([fadeOut, scaleDown, move_up])
                videoNode.run(group) {
                    videoNode.removeFromParent()
                    self.isIntroPlaying = false
                    self.skip_button.removeFromParent()
                    
                }
            }
        }else{
            //skip_button.removeFromParent()
            isIntroPlaying = false
        }
        
        //Global_init = "yes"
        
        
        backgroundColor = .black
        /*
         while menu_wait {
         // 100ms スリープしてループを繰り返す
         Thread.sleep(forTimeInterval: 0.5)
         //squareNode.removeFromParent()
         }*/
        //Thread.sleep(forTimeInterval: 1.0)  // 3秒間、現在のスレッドを停止します。
        // 背景画像の初期設定
        let background1 = SKSpriteNode(imageNamed: "kanji menu") // 背景画像の名前
        let background2 = SKSpriteNode(imageNamed: "kanji menu") // 2枚目の背景画像
        // 背景画像の位置設定
        background1.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background2.position = CGPoint(x: size.width * 1.5, y: size.height * 1.5) // 背景1の右下に配置
        // アスペクト比を保持し、画面に収めるようにサイズを調整
        let scaleFactor = min(size.width / background1.size.width, size.height / background1.size.height) * 1.5
        background1.size = CGSize(width: background1.size.width * scaleFactor, height: background1.size.height * scaleFactor)
        background2.size = background1.size // 同じサイズにする
        // 背景を最背面に配置
        background1.zPosition = -10
        background2.zPosition = -10
        // シーンに背景を追加
        addChild(background1)
        addChild(background2)
        // アニメーション設定
        let moveAction = SKAction.moveBy(x: -size.width, y: -size.height, duration: 15.0) // 左上から右下に流れる
        let resetAction = SKAction.moveBy(x: size.width, y: size.height, duration: 0) // 元の位置に戻す
        let sequenceAction = SKAction.sequence([moveAction, resetAction]) // 流れる→戻るの順に実行
        let repeatAction = SKAction.repeatForever(sequenceAction) // 永続的に繰り返す
        
        // アニメーションを背景に適用
        background1.run(repeatAction)
        background2.run(repeatAction)
        
        
        let logoLabel = SKSpriteNode(imageNamed: "logo.png")
        // 画像の元のサイズを取得
        let texture = SKTexture(imageNamed: "logo.png")
        let textureWidth = texture.size().width
        let textureHeight = texture.size().height
        
        // 元のアスペクト比を保持するための計算
        let aspectRatio = textureWidth / textureHeight
        // ロゴの新しいサイズ（任意の幅を設定し、高さをアスペクト比に基づいて調整）
        let newWidth: CGFloat = 600
        let newHeight = newWidth / aspectRatio
        logoLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        logoLabel.size = CGSize(width: newWidth, height: newHeight)
        addChild(logoLabel)
        
        /*
         // タイトルラベル
         let titleLabel = SKLabelNode(text: "Kanji dê Go Menu")
         titleLabel.fontName = "Snell Roundhand"
         titleLabel.fontSize = 80
         titleLabel.fontColor = .white
         titleLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 + 150)
         addChild(titleLabel)
         */
        
        let select_levelLabel = SKLabelNode(text: "難易度を選択せよ。")
        select_levelLabel.fontName = "KouzanBrushFontGyousyoOTF"
        //select_levelLabel.fontName = "TimesNewRomanPS-BoldMT"
        select_levelLabel.fontSize = 50
        select_levelLabel.fontColor = .systemPink
        select_levelLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 + 80)
        addChild(select_levelLabel)
        
        
        let Mode_change_Button = SKLabelNode(text: "\(currentMode)")
        Mode_change_Button.fontSize = 40
        Mode_change_Button.fontColor = .white
        Mode_change_Button.fontName = "KouzanBrushFontGyousyoOTF"
        Mode_change_Button.zPosition = 2
        //Mode_change_Button.position = CGPoint(x: frame.midX-40, y: frame.midY-320)
        Mode_change_Button.name = "Mode_change_Button" // タッチで識別できるよう名前を付ける
        addChild(Mode_change_Button)
        
        let Mode_img = SKShapeNode(rectOf: CGSize(width: 260, height: 80),cornerRadius: 5)//, cornerRadius: 16)
        Mode_img.zPosition = 0
        Mode_img.fillColor = .black
        Mode_img.strokeColor = .lightGray
        Mode_img.alpha = 0.7
        Mode_img.name = "Mode_change_Button"
        Mode_img.position = CGPoint(x: frame.midX, y: frame.midY - 320)
        addChild(Mode_img)
        updateMode()
        
        let ranking_menu = SKLabelNode(text: "覇者の背中を垣間見")
        ranking_menu.fontName = "KouzanBrushFontGyousyoOTF"
        ranking_menu.name = "Ranking_menu"
        ranking_menu.fontSize = 23
        ranking_menu.zPosition = 2
        ranking_menu.fontColor = .white
        ranking_menu.position = CGPoint(x: frame.midX+310, y: frame.midY - 337)
        addChild(ranking_menu)
        
        let ranking_bg_box = SKShapeNode(rectOf: CGSize(width: 220, height: 50),cornerRadius: 5)//, cornerRadius: 16)
        ranking_bg_box.zPosition = 0
        ranking_bg_box.fillColor = .black
        ranking_bg_box.strokeColor = .lightGray
        ranking_bg_box.alpha = 0.7
        //ranking_bg_box.name = "Mode_change_Button"
        ranking_bg_box.position = CGPoint(x: frame.midX-310, y: frame.midY - 335)
        addChild(ranking_bg_box)
        
        let achieve_history_bg = SKShapeNode(rectOf: CGSize(width: 220, height: 50),cornerRadius: 5)//, cornerRadius: 16)
        achieve_history_bg.zPosition = 0
        achieve_history_bg.fillColor = .black
        achieve_history_bg.strokeColor = .lightGray
        achieve_history_bg.alpha = 0.7
        //achieve_history_bg.name = "Mode_change_Button"
        achieve_history_bg.position = CGPoint(x: frame.midX+310, y: frame.midY - 335)
        addChild(achieve_history_bg)
        
        
        
        // 難易度と画像のマッピング
        let difficulties: [(name: String, imageName: String, Menu_text:String)] = [
            ("Easy", "Easy_img","簡単"),
            ("Normal", "Normal_img","ふつう"),
            ("Hard", "Hard_img","難しい"),
            ("Extra", "Extra_img","極難度")
        ]
        
        let spacing: CGFloat = 220 // 四角間の間隔
        let boxSize = CGSize(width: 180, height: 300) // 四角のサイズ
        let startX = size.width / 2 - CGFloat(difficulties.count - 1) * spacing / 2
        
        for (index, difficulty) in difficulties.enumerated() {
            // 四角い枠
            let box = SKShapeNode(rectOf: boxSize)//, cornerRadius: 16)
            box.fillColor = .black
            box.zPosition = -10
            box.strokeColor = .darkGray
            box.position = CGPoint(x: startX + CGFloat(index) * spacing, y: size.height / 2 - 100)
            box.name = difficulty.name.lowercased()
            addChild(box)
            
            // 難易度ラベル
            let label = SKLabelNode(text: difficulty.Menu_text)
            //label.fontName = "Snell Roundhand"
            label.fontName = "Gyoshokk-R"
            label.name = difficulty.name.lowercased()
            label.fontSize = 25
            label.zPosition = 10
            label.fontColor = .white
            label.position = CGPoint(x: 0, y: boxSize.height / 4+50)
            box.addChild(label)
            
            // 難易度ごとの画像
            let image = SKSpriteNode(imageNamed: difficulty.imageName)
            image.name = difficulty.name.lowercased()
            image.zPosition = 0
            image.size = CGSize(width: 180, height: 300) // 画像サイズ
            image.position = CGPoint(x: 0, y: -boxSize.height / 4+75)
            box.addChild(image)
            
            //hideAllExcept(skipButton: skip_button, videoNode: videoNode)
            
            
        }
    }
    
    
    func quitGame() {
        print("Exiting Playground execution...")
        //PlaygroundPage.current.finishExecution()
    }
    
    
    
    func updateMode() {
        isTurningMode=true
        let text_move:CGFloat = 115
        let text_x_offset:CGFloat = 0
        if currentMode == "階層制" {
            currentMode = "無制限"
            
            // ボタンテキストの移動と切り替え
            if let button_txt = childNode(withName: "Mode_change_Button") as? SKLabelNode {
                button_txt.position=CGPoint(x: frame.midX-text_move/2+text_x_offset, y: frame.midY - 320)
                let moveTextRight = SKAction.moveBy(x: text_move, y: 0, duration: 0.5)  // 少しだけ移動
                let changeText = SKAction.run {
                    button_txt.text = self.currentMode
                } 
                button_txt.run(SKAction.sequence([changeText, moveTextRight]))
            }

            
            // 写真1 (旧背景) を外側にスライドしてフェードアウトした後削除
            if let oldImage = childNode(withName: "Mode_Image1") as? SKSpriteNode {
                let moveOut = SKAction.moveBy(x: 200, y: 0, duration: 0.5)
                let fadeOut = SKAction.fadeAlpha(to:0, duration: 0.5)
                let moveOutAndFade = SKAction.group([moveOut, fadeOut])
                
                // フェードアウトと移動が完了した後に削除する
                let removeOldImage = SKAction.run {
                    oldImage.removeFromParent()  // シーンから削除
                }
                
                // 最後にremoveFromParent()を追加したアクションシーケンスを実行
                oldImage.run(SKAction.sequence([moveOutAndFade, removeOldImage]))
            }
            let xoffset2:CGFloat = 70
            // 新しい画像（写真2）が中央から左にスライドして現れる
            let newImage = SKSpriteNode(imageNamed: "endure.png")
            newImage.size = CGSize(width: 80, height: 80)
            newImage.position = CGPoint(x: frame.midX - 200, y: frame.midY - 320) // 画面外の右側からスタート
            newImage.zPosition = 1
            newImage.name = "Mode_Image2"
            newImage.alpha = 0  // 最初は透明
            addChild(newImage)
            
            let moveIn = SKAction.moveBy(x: 200-xoffset2, y: 0, duration: 0.5)  // 200px右にスライド
            let fadeIn = SKAction.fadeAlpha(to: 1, duration: 0.5)  // フェードイン
            let moveInAndFade = SKAction.group([moveIn, fadeIn])  // 同時に移動とフェードを実行
            let updateTurningMode = SKAction.run {self.isTurningMode = false}
            let sequence = SKAction.sequence([moveInAndFade, updateTurningMode])
            newImage.run(sequence)

        } else {
            currentMode = "階層制"
            
            // ボタンテキストの移動と切り替え
            if let button_txt = childNode(withName: "Mode_change_Button") as? SKLabelNode {
                button_txt.position=CGPoint(x: frame.midX+text_move/2+text_x_offset, y: frame.midY - 320)
                let moveTextRight = SKAction.moveBy(x: -text_move, y: 0, duration: 0.5)  // 少しだけ移動
                let changeText = SKAction.run {
                    button_txt.text = self.currentMode
                }
                button_txt.run(SKAction.sequence([changeText, moveTextRight]))
            }
            
            // 写真2 (旧背景) を外側にスライドしてフェードアウトした後削除
            if let oldImage = childNode(withName: "Mode_Image2") as? SKSpriteNode {
                let moveOut = SKAction.moveBy(x: -200, y: 0, duration: 0.5)  // 左にスライドして消える
                let fadeOut = SKAction.fadeAlpha(to:0, duration: 0.5)
                let moveOutAndFade = SKAction.group([moveOut, fadeOut])  // 同時に移動とフェード
                
                // フェードアウトと移動が完了した後に削除する
                let removeOldImage = SKAction.run {
                    oldImage.removeFromParent()  // シーンから削除
                }
                
                // 最後にremoveFromParent()を追加したアクションシーケンスを実行
                oldImage.run(SKAction.sequence([moveOutAndFade, removeOldImage]))
            }
            let xoffset1:CGFloat = -60
            // 新しい画像（写真1）が中央から右にスライドして現れる
            let newImage = SKSpriteNode(imageNamed: "learn.png")
            newImage.size = CGSize(width: 120, height: 80)
            newImage.position = CGPoint(x: frame.midX + 200, y: frame.midY - 320) // 画面外の左側からスタート
            newImage.zPosition = 1
            newImage.name = "Mode_Image1"
            newImage.alpha = 0  // 最初は透明
            addChild(newImage)
            
            let moveIn = SKAction.moveBy(x: -200-xoffset1, y: 0, duration: 0.5)  // 200pxLeftにスライド
            let fadeIn = SKAction.fadeAlpha(to:1, duration: 0.5)  // フェードイン
            let moveInAndFade = SKAction.group([moveIn, fadeIn])  // 同時に移動とフェードを実行
            let updateTurningMode = SKAction.run {self.isTurningMode = false}
            let sequence = SKAction.sequence([moveInAndFade, updateTurningMode])
            newImage.run(sequence)
        }
    }
    
    
    override func willMove(from view: SKView) {
        removeAllChildren()
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)
        
        // パーティクルを作成して表示
        createTouchCircle(at: location)
        
        if let name = touchedNode.name {
            if name == "skip_button" {
                if let videoNode = childNode(withName: "intro") as? SKVideoNode {
                    videoNode.removeFromParent()
                    skip_button.removeFromParent()
                    isIntroPlaying = false
                }
            } else if name == "Mode_change_Button" || name=="Mode_Image1" || name=="Mode_Image2"{
                if !isTurningMode{updateMode()}
            } else if name == "Ranking_menu" {
                let clearScene = ClearScene(size: self.size)
                clearScene.level = "extra"//初期極難度
                clearScene.isfromMenu = true
                clearScene.currentMode = "無制限"
                clearScene.scaleMode = .aspectFill
                //self.view?.presentScene(clearScene, transition: SKTransition.fade(withDuration: 1.0))
                view?.presentScene(clearScene, transition: SKTransition.fade(withDuration: 1.0))
            } else {
                // ゲーム画面に移動（難易度を渡す）
                if let view = view {
                    if !isIntroPlaying{
                        let gameScene = GameScene(size: size)
                        gameScene.selectedDifficulty = name // 選択された難易度を設定
                        gameScene.currentMode=currentMode
                        gameScene.scaleMode = .aspectFill
                        view.presentScene(gameScene, transition: SKTransition.fade(withDuration: 1.0))
                    }
                    
                }
            }
        }
    }
    
    /*
     func showConfirmationAlert(completion: @escaping (Bool) -> Void) {
     guard let viewController = self.scene?.view?.window?.rootViewController else {
     completion(false)
     return
     }
     let alert = UIAlertController(
     title: "確認",
     message: "ゲームを終えますか？",
     preferredStyle: .alert
     )
     alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: { _ in
     completion(false) // キャンセル時
     }))
     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
     completion(true) // OK時
     }))
     viewController.present(alert, animated: true, completion: nil)
     }
     func showAlert(message: String) {
     guard let viewController = self.scene?.view?.window?.rootViewController else {
     return
     }
     
     let alert = UIAlertController(
     title: "確認",
     message: message,
     preferredStyle: .alert
     )
     alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil)) // OKボタンのみ
     
     viewController.present(alert, animated: true, completion: nil)
     }
     */
    
    
    
    
    func createTouchCircle(at position: CGPoint) {
        let circle = SKShapeNode(circleOfRadius: 10) // 半径10の円
        circle.fillColor = .clear // 塗りつぶしなし
        circle.strokeColor = .white // 線の色を黒に
        circle.lineWidth = 1 // 線の太さを2に設定
        circle.position = position
        // ボールのタップ判定に影響しないように設定
        circle.zPosition = -7 // 背景レイヤーに置く
        circle.isUserInteractionEnabled = false
        addChild(circle)
        // アニメーションでフェードアウト＆拡大しながら消える
        let fadeOut = SKAction.fadeOut(withDuration: 0.3)
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.3)
        let group = SKAction.group([fadeOut, scaleUp])
        let remove = SKAction.removeFromParent()
        circle.run(SKAction.sequence([group, remove]))
    }
}


