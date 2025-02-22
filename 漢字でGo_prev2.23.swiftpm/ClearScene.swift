//import SwiftUI
import SpriteKit
var isloading = false //only endless mode



class ClearScene: SKScene {
    var currentStage=0
    var level = "none"
    var isfromMenu = false
    
    var currentMode = ""
    override func didMove(to view: SKView) {
        if currentMode == "階層制"{
            var video_url = "Clear_other.mp4"
            var delay_txt: TimeInterval = 16
            if level == "extra" {video_url = "Extra_clear.mp4";delay_txt = 26}
            // 動画を再生
            let videoNode = SKVideoNode(fileNamed: video_url)
            videoNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
            videoNode.size = self.size
            videoNode.zPosition = -5
            addChild(videoNode)
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                videoNode.play()
            }
            
            
            
            // 30秒後にテキストラベルを表示
            DispatchQueue.main.asyncAfter(deadline: .now() + delay_txt) { [weak self] in
                guard let self = self else { return }
                // クリア画面に表示するメッセージ
                let clearLabel = SKLabelNode(text: "よくぞ辿り着いた。おめでとう。")
                clearLabel.position = CGPoint(x: frame.midX, y: frame.midY + 100)
                clearLabel.fontName = "KouzanBrushFontGyousyoOTF"
                clearLabel.fontSize = 60
                clearLabel.fontColor = .white
                if level == "extra" {clearLabel.fontColor = .black}
                clearLabel.alpha = 0
                addChild(clearLabel)
                
                let show_level = SKLabelNode(text: "主が選び、達成した道はこれだ : \(level)")
                show_level.fontSize = 50
                show_level.fontName = "GFKaishokk-E"
                show_level.fontColor = .white
                if level == "extra" {show_level.fontColor = .black}
                show_level.position = CGPoint(x: frame.midX, y: frame.midY)
                show_level.alpha = 0
                addChild(show_level)
                
                
                // ボタンを追加して、メニューに戻る処理を追加
                
                let restartButtontxt = isfromMenu ? "メニューへ戻る" : "10秒後に自動でメニューに戻ります。"
                let restartButton = SKLabelNode(text: restartButtontxt)
                restartButton.position = CGPoint(x: frame.midX, y: frame.midY - 150)
                restartButton.fontSize = 40
                restartButton.name = "restartButton"
                restartButton.fontName = "KouzanBrushFontGyousyoOTF"
                restartButton.fontColor = .white
                if level == "extra" {restartButton.fontColor = .black}
                restartButton.alpha = 0
                //restartButton.name = "restartButton"
                addChild(restartButton)
                
                // フェードインアクション
                let fadeInAction = SKAction.fadeIn(withDuration: 1.0) 
                clearLabel.run(fadeInAction)
                show_level.run(fadeInAction)
                restartButton.run(fadeInAction)
                
            }
            
            /*
             let Finish_img_Label = SKSpriteNode(imageNamed: "clear_bg")
             // 画像の元のサイズを取得
             let texture = SKTexture(imageNamed: "clear_bg")
             let textureWidth = texture.size().width
             let textureHeight = texture.size().height
             
             // 元のアスペクト比を保持するための計算
             let aspectRatio = textureWidth / textureHeight
             // ロゴの新しいサイズ（任意の幅を設定し、高さをアスペクト比に基づいて調整）
             let newWidth: CGFloat = 1240
             let newHeight = newWidth / aspectRatio
             Finish_img_Label.position = CGPoint(x: frame.midX, y: frame.midY)
             Finish_img_Label.zPosition = -150
             Finish_img_Label.size = CGSize(width: newWidth, height: newHeight)
             addChild(Finish_img_Label)
             
             
             */
        }else{
            backgroundColor = .black
            let bg=SKSpriteNode(imageNamed: "endless_bg")
            bg.zPosition = -20
            bg.alpha = 0.5
            bg.position=CGPoint(x: frame.midX, y: frame.midY)
            addChild(bg)
            
            let options = ["簡単", "ふつう","難しい","極難度"]
            
            let startY: CGFloat = size.height / 2 + 100
            let Xposition: CGFloat = frame.minX+100
            let itemHeight: CGFloat = 40
            var yPosition = startY
            
            for option in options {
                let listlabel = SKLabelNode(text: option)
                listlabel.fontSize = 30
                listlabel.fontName = "KouzanBrushFontGyousyoOTF"
                listlabel.fontColor = .white
                listlabel.position = CGPoint(x: Xposition , y: yPosition)
                listlabel.name = option // 項目名をノードの名前に設定
                addChild(listlabel)
                yPosition -= itemHeight // 各項目を縦に配置
            }
            
            
            //無制限 save cloud
            var show_level = ""
            switch level {
            case "easy":
                show_level="簡単"
            case "normal":
                show_level="ふつう"
            case "hard":
                show_level="難しい"
            case "extra":
                show_level="極難度"    
            default:
                show_level="簡単"
            }
            // ランキングタイトル
            let titleLabel = SKLabelNode(text: "上位10名の覇者")
            titleLabel.fontSize = 50
            titleLabel.fontColor = .white
            titleLabel.fontName = "KouzanBrushFontGyousyoOTF"
            titleLabel.position = CGPoint(x: frame.midX, y: frame.midY + 200)
            addChild(titleLabel)
            
            let difficultyLabel = SKLabelNode(text: "難度: \(show_level)")
            difficultyLabel.fontSize = 50
            difficultyLabel.fontColor = .white
            difficultyLabel.fontName = "KouzanBrushFontGyousyoOTF"
            difficultyLabel.position = CGPoint(x: frame.midX, y: frame.midY + 140)
            addChild(difficultyLabel)
            
            let announce = SKLabelNode(text: "(2秒以上経っても反映されていない場合、ここを押すのだ。)")
            announce.name = "announce"
            announce.fontSize = 20
            announce.fontName = "KouzanBrushFontGyousyoOTF"
            announce.fontColor = .white
            announce.position = CGPoint(x: frame.midX, y: frame.midY + 20)
            addChild(announce)
            //print("jjjjjjjjj\(isfromMenu)")
            let stageLabel = SKLabelNode(text: isfromMenu ? "学べ。" : "お主が到達した境地: \(currentStage)")
            stageLabel.fontSize = 60
            stageLabel.fontName = "KouzanBrushFontGyousyoOTF"
            stageLabel.fontColor = .red
            stageLabel.position = CGPoint(x: frame.midX, y: frame.midY + 70)
            addChild(stageLabel)
            
            let back = SKLabelNode(text: isfromMenu ? "メニューへ戻る":"10秒後に自動でメニューに戻ります。")
            back.fontSize = 30
            back.fontName = "KouzanBrushFontGyousyoOTF"
            back.name = "restartButton"
            back.fontColor = .white
            back.position = CGPoint(x: frame.midX, y: frame.minY+20)
            addChild(back)
            
            
            displayHighstages(show_level:level)
        }
    }
    func displayHighstages(show_level:String) {
        // Firebase URL
        
        let databaseURL = "https://a-journey-of-kanji-default-rtdb.firebaseio.com/endless/\(show_level).json"
        guard let url = URL(string: databaseURL) else { return }
        // データ取得
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {print("No data received");return}
            // レスポンスを文字列として出力（デバッグ用）
            print("Raw Response: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")
            var highstages: [[String: Any]] = []
            // JSONデコード: 配列としてパース
            if let jsonArray = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                highstages = jsonArray
            } else {
                print("Failed to decode JSON as array")
                return
            }
            print("Decoded High stages: \(highstages)")
            // スコアを降順でソート
            highstages.sort { (stage1, stage2) -> Bool in
                let stage1Value = stage1["stage"] as? Int ?? 0
                let stage2Value = stage2["stage"] as? Int ?? 0
                return stage1Value > stage2Value  // 降順
            }
            // メインスレッドでUI更新
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                for (index, highstage) in highstages.prefix(20).enumerated() {
                    let rank = index + 1
                    let userName = highstage["userName"] as? String ?? "Unknown"
                    let stage = highstage["stage"] as? Int ?? 0
                    // 各要素の横の位置を決める
                    let rankX = (self?.frame.midX ?? 0) - 200 // ランクの位置
                    let nameX = (self?.frame.midX ?? 0)       // ユーザー名の位置
                    let stageX = (self?.frame.midX ?? 0) + 200 // スコアの位置
                    let yPosition = (self?.frame.midY ?? 0) - CGFloat(rank * 30)
                    // ランクラベル
                    let rankLabel = SKLabelNode(text: "\(rank) 位:")
                    rankLabel.fontName = "KouzanBrushFontGyousyoOTF"
                    rankLabel.fontColor = .white
                    rankLabel.horizontalAlignmentMode = .center
                    rankLabel.position = CGPoint(x: rankX, y: yPosition)
                    self?.addChild(rankLabel)
                    // ユーザー名ラベル
                    let nameLabel = SKLabelNode(text: userName)
                    nameLabel.fontSize = 30
                    nameLabel.fontName = "KouzanBrushFontGyousyoOTF"
                    if userName == my_username {
                        nameLabel.fontColor = .green
                    }else{
                        nameLabel.fontColor = .white
                    }
                    nameLabel.horizontalAlignmentMode = .center
                    nameLabel.position = CGPoint(x: nameX, y: yPosition)
                    self?.addChild(nameLabel)
                    // スコアラベル
                    let stageLabel = SKLabelNode(text: "\(stage)")
                    stageLabel.fontSize = 30
                    stageLabel.fontName = "KouzanBrushFontGyousyoOTF"
                    stageLabel.fontColor = .white
                    stageLabel.horizontalAlignmentMode = .center
                    stageLabel.position = CGPoint(x: stageX, y: yPosition)
                    self?.addChild(stageLabel)
                    // ランクラベル
                    rankLabel.name = "stageLabel"
                    // ユーザー名ラベル
                    nameLabel.name = "stageLabel"
                    // スコアラベル
                    stageLabel.name = "stageLabel"
                    isloading = false
                }
                if let announce = self?.childNode(withName: "announce") as? SKLabelNode {
                    announce.text = "(2秒以上経っても反映されていない場合、ここを押すのだ。)"
                }
                
            }
        }
        task.resume()
    }
    
    override func willMove(from view: SKView) {
        removeAllChildren()
    }
    
    /*
    // ゲームシーンに遷移
    func transitionToGameScene() {
        if let scene = GameScene(fileNamed: "GameScene") as? GameScene {
            scene.endless = endless // 選択したモードを渡す
            let transition = SKTransition.fade(withDuration: 1.0)
            self.view?.presentScene(scene, transition: transition)
        }
    }*/
    
    func load_ranking(selected_level:String){
        if !isloading {
            if let announce = self.childNode(withName: "announce") as? SKLabelNode {
                announce.text = "しばし待たれよ"
            }
            isloading = true
            self.children.forEach { child in
                if child.name == "stageLabel" { // 名前が "stageLabel" の場合のみ削除
                    child.removeFromParent()
                }
            }
            displayHighstages(show_level: selected_level)
        }
    }
    
    // ボタンタッチ時の処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if node.name == "restartButton" && isfromMenu{//廃止
                print("back to menu")
                // メニュー画面に戻る場合の処理
                let menuScene = MenuScene(size: self.size)
                menuScene.isInit_from_menu = true
                menuScene.scaleMode = .aspectFill
                self.view?.presentScene(menuScene, transition: SKTransition.fade(withDuration: 1.0))
            }else if node.name == "announce"{
                print(isfromMenu)
                load_ranking(selected_level: level)
            }else if node.name == "簡単" {
                level="easy"
                //print(level)
                load_ranking(selected_level: level)
            } else if node.name == "ふつう" {
                level="normal"
                //print(level)
                load_ranking(selected_level: level)
            } else if node.name == "難しい" {
                level="hard"
                //print(level)
                load_ranking(selected_level: level)
            } else if node.name == "極難度" {
                level="extra"
                //print(level)
                load_ranking(selected_level: level)
            }
        }
    }
}
        
        
        
