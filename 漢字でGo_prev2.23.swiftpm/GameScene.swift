import SpriteKit
import AVFoundation
import Foundation
//import PlaygroundSupport
//import UIKit
//import SwiftUI

//import CoreGraphics
//import CoreText

 

class GameScene: SKScene, UITextFieldDelegate {
    var currentMode:String = "none"
    var selectedDifficulty: String?
    var kanjiLabel: SKLabelNode!
    var lifeLabel: SKLabelNode!
    var StageLabel: SKLabelNode!
    var kanji_bg_Node: SKSpriteNode!
    var input_bg_Node: SKSpriteNode!
    var meaningLabel: SKLabelNode!
    var correctAnswer: String!
    var textField: UITextField!
    private var resultLabel: SKLabelNode!
    var kanjiMeaning: String!
    var kanjiListData = KanjiListData()
    var currentKanji: (String, String, String)?
    var entering = false
    var hearts = "❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️"
    var videoNode: SKVideoNode?
    var isVideoPlaying = false
    var player: AVPlayer?
    private var timer: Timer?
    private var show_ans_remove_dead: TimeInterval = 4.5
    private var startTime: TimeInterval = 0
    private var timeLimit: TimeInterval = 30// 制限時間（秒）
    private var remainingTime: TimeInterval = 100
    private var timeBarBackground: SKSpriteNode!
    private var timeBar: SKSpriteNode!
    private var timeExpired: Bool = false
    var level_num = 0
    var ans_time: TimeInterval = 6.0
    private var corrected = false
    var totalStages: Int = 14// クリアするまでのステージ数
    var usedKanji: [(String, String, String)] = []
    var kanjiList: [(String, String, String)] = []
    var readings: [String] = []
    var meanings: [String] = []
    var ten_s_beforeshake = false
    var time_out_showing: Bool = false
    // 表示より＋1で管理
    var currentStage: Int = 1 {
        didSet {
            StageLabel.text = "階層: \(currentStage-1) / \(totalStages)"
            if currentMode == "無制限" {StageLabel.text = "打破数: \(currentStage-1)"}
        } 
    }
    var life = 1
    
    
    func shakeScene(view: SKView) {
        let originalPosition = view.frame.origin
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [], animations: {
            for i in 0..<3 {
                let startTime = Double(i) * 0.2
                UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: 0.15) {
                    view.frame.origin.x += 30 }
                UIView.addKeyframe(withRelativeStartTime: startTime + 0.1, relativeDuration: 0.15) {
                    view.frame.origin.x -= 30 }
            }
        }, completion: { _ in
            view.frame.origin = originalPosition
        })
    }
    
    func addSmoke() {
        let leftSmoke = createSmokeEmitter(direction: CGVector(dx: frame.midX - frame.minX, dy: frame.midY - frame.minY));leftSmoke.position = CGPoint(x: frame.minX + 50, y: frame.minY + 50);addChild(leftSmoke)
        let rightSmoke = createSmokeEmitter(direction: CGVector(dx: frame.midX - frame.maxX, dy: frame.midY - frame.minY));rightSmoke.position = CGPoint(x: frame.maxX - 50, y: frame.minY + 50);addChild(rightSmoke)
    }

    
    // 煙のエフェクトを作成する関数
    func createSmokeEmitter(direction: CGVector) -> SKEmitterNode {
        let smokeEmitter = SKEmitterNode()
        smokeEmitter.particleTexture = SKTexture(imageNamed: "white_smoke.png")
        smokeEmitter.particleColor = UIColor.white.withAlphaComponent(0.8)
        smokeEmitter.particleColorBlendFactor = 1.0
        smokeEmitter.particleBirthRate = 100
        smokeEmitter.particleLifetime = 1.0
        smokeEmitter.particleSize = CGSize(width: 50, height: 50)
        smokeEmitter.particleSpeed = 200
        smokeEmitter.particleSpeedRange = 50
        smokeEmitter.emissionAngle = atan2(direction.dy, direction.dx)
        smokeEmitter.xAcceleration = 0;smokeEmitter.yAcceleration = 0
        smokeEmitter.particlePositionRange = CGVector(dx: 50, dy: 50)
        smokeEmitter.particleAlphaSequence = SKKeyframeSequence(keyframeValues: [1.0, 0.0], times: [0.0, 1.0])
        return smokeEmitter
    }
    func removeAllSmoke() {
        for node in children {
            if let smoke = node as? SKEmitterNode {
                smoke.removeFromParent()
            }
        }
    }    
    
    override func didMove(to view: SKView) {
        usedKanji = []
        switch selectedDifficulty {
        case "easy":
            level_num = 0
            totalStages = 25
            life = 2
            ans_time = 1.0
            kanjiList = kanjiListData.easy
        case "normal":
            level_num = 1
            life = 2
            ans_time = 1.2
            totalStages = 22
            kanjiList = kanjiListData.normal
        case "hard":
            level_num = 2
            life = 3
            ans_time = 2.0
            totalStages = 18
            kanjiList = kanjiListData.hard
        case "extra":
            level_num = 3
            life = 3
            ans_time = 2.8
            totalStages = 18
            kanjiList = kanjiListData.extra
        default:
            level_num = 0
            kanjiList = kanjiListData.easy
        }
        
        if currentMode=="無制限"{
            timeLimit=20
            if level_num==0||level_num==1{
                life = 1
            }else if level_num==2{
                life = 3
            }
            
        }
        
        backgroundColor = .black
        keyboard_system(view: view)
        
        
        
        is_init = false
        setupTimeBar()
        setupKanji()
        
        // ハートを表示するラベルを作成
        lifeLabel = SKLabelNode(text: hearts)
        lifeLabel.text = hearts
        lifeLabel.fontSize = 20
        lifeLabel.fontColor = .white
        //lifeLabel.zPosition = 5
        lifeLabel.horizontalAlignmentMode = .right 
        lifeLabel.position = CGPoint(x: frame.maxX-20, y: frame.maxY - 80)
        // 新しいハートラベルを追加
        lifeLabel.name = "lifeLabel"
        addChild(lifeLabel)
        updateLifeLabel()
        let life_bg_Size = CGSize(width: 240, height: 30) // 文字に合わせたサイズに変更
        let life_bg_Node = SKSpriteNode(color: .black, size: life_bg_Size)
        life_bg_Node.position = CGPoint(x: frame.maxX-140, y: frame.maxY - 70)
        life_bg_Node.zPosition = -1
        life_bg_Node.alpha = 0.7
        addChild(life_bg_Node) // 四角形をシーンに追加
        
        // 画面上に現在のステージを表示（例）
        StageLabel = SKLabelNode(text: "階層: \(currentStage-1) / \(totalStages)")
        if currentMode == "無制限" {StageLabel.text = "打破数: \(currentStage-1)"}
        StageLabel.position = CGPoint(x: 170, y: frame.maxY - 50 )
        //StageLabel.fontName = "TimesNewRomanPS-BoldMT"
        StageLabel.fontName = "GFKaishokk-E"
        StageLabel.fontColor = .white
        StageLabel.horizontalAlignmentMode = .left
        StageLabel.fontSize = 30
        addChild(StageLabel)
        
        let back_to_menu = SKLabelNode(text: "終える")
        back_to_menu.fontName = "Gyoshokk-R"
        back_to_menu.fontSize = 36
        back_to_menu.name = "back_to_menu"
        back_to_menu.fontColor = .white
        back_to_menu.horizontalAlignmentMode = .left
        back_to_menu.position = CGPoint(x: 25, y: frame.maxY - 50)
        addChild(back_to_menu)

        
        let video_files = ["easy","cg","normal","mechanic"]
        // 動画のURLを取得
        guard let videoURL = Bundle.main.url(forResource: video_files[level_num], withExtension: "mp4") else {
            print("動画ファイルが見つかりません")
            return
        }
        
        // AVPlayerを作成
        player = AVPlayer(url: videoURL)
        guard let player = player else { return }
        // SKVideoNodeを作成
        videoNode = SKVideoNode(avPlayer: player)
        if let videoNode = videoNode {
            // 動画ノードの配置
            videoNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
            videoNode.size = size
            videoNode.zPosition = -500 // 背景に設定
            videoNode.alpha = 0.6 // 不透明度（必要に応じて調整可能）
            // ノードをシーンに追加
            addChild(videoNode)
            // 初回の再生
            videoNode.play()
            isVideoPlaying = true
            backgroundColor = .gray
            // 動画をループ再生
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: player.currentItem,
                queue: .main
            ) { [weak self] _ in
                player.seek(to: .zero) // 再生位置を先頭に戻す
                if self?.isVideoPlaying == true {
                    player.play() // 再生を再開
                }
            }
        }
    }
    // 動画を再生する関数
    func playVideo() {if let player = player, !isVideoPlaying {player.play();isVideoPlaying = true}}
    // 動画を停止する関数
    func stopVideo() {if let player = player, isVideoPlaying {player.pause();isVideoPlaying = false}}
    func changePlaybackRate(to rate: Float) {if let player = player {player.rate = rate;isVideoPlaying = rate != 0 /* 再生速度が0の場合は停止とみなす*/}}
    
    // UITextFieldの位置を任意のCGPointに変更する関数
    func moveTextField(to position: CGPoint) {
        // 新しい位置にUITextFieldを移動
        textField.frame.origin = position
    }
    func removeTextField() {
        if let textField = textField {
            textField.removeFromSuperview()
            //self.textField = nil // 参照を解除してメモリを解放
        }
    }
    func keyboard_system(view: SKView){
        // UITextFieldの設定
        textField = UITextField(frame: CGRect(x: frame.midX-130, y: frame.midY+250, width: 300, height: 50)) // 画面内に配置
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.borderStyle = .roundedRect
        textField.placeholder = "漢字の読みを入力"
        textField.isHidden = false
        textField.delegate = self // デリゲートの設定
        // 日本語入力を強制し、ライブ変換をオフ
        textField.keyboardType = .default // 日本語入力モードを固定
        textField.autocorrectionType = .no
        view.addSubview(textField)
        textField.becomeFirstResponder() // キーボードを表示
    }
    
    func setupKanji() {
        readings = []
        meanings = []
        ten_s_beforeshake = false
        moveTextField(to:CGPoint(x: frame.midX-130, y: frame.midY+250))
        show_ans_remove_dead = 4.5
        removeAllSmoke()
        if let videoNode = videoNode {
            videoNode.alpha = 0.6
        }
        changePlaybackRate(to: 1.0)
        resetTimer()
        //kanjiLabel.removeFromParent()
        // 漢字リストの選択
        var kanji = ""
        // 未使用の漢字をランダムに選択
        if let randomKanji = kanjiList.filter({ kanji in !usedKanji.contains(where: { $0 == kanji }) }).randomElement() {
            kanji = randomKanji.0
            
            // 読み方と意味を分割してリスト化
            readings = randomKanji.1.split(separator: "$").map { String($0) }
            let rawMeanings = randomKanji.2.split(separator: "$").map { String($0) }
            
            // 意味を処理（%(半角)を展開）
            meanings = []
            for meaning in rawMeanings {
                if meaning == "%" {
                    if let lastMeaning = meanings.last {
                        meanings.append(lastMeaning) // 前の意味を再利用
                    }
                } else {
                    meanings.append(meaning)
                }
            }
            kanjiMeaning = meanings.joined(separator: " / ") // 画面表示用の意味
            // 現在の漢字とその読み、意味を保持
            currentKanji = randomKanji
            
            // 使用済みリストに追加
            usedKanji.append(randomKanji)
            
            
            
            
            
            // 漢字を画面に表示
            kanjiLabel = SKLabelNode(text: kanji)
            kanjiLabel.fontSize = 72
            //kanjiLabel.fontName = "KouzanBrushFontGyousyoOTF"
            kanjiLabel.fontColor = .white
            kanjiLabel.position = CGPoint(x: size.width / 2, y: size.height / 2+100)
            addChild(kanjiLabel)
            
            let kanji_bg_Size = CGSize(width: 500, height: 100) // 文字に合わせたサイズに変更
            kanji_bg_Node = SKSpriteNode(color: .black, size: kanji_bg_Size)
            kanji_bg_Node.position = CGPoint(x: size.width / 2, y: size.height / 2 + 130)
            kanji_bg_Node.zPosition = -1
            kanji_bg_Node.alpha = 0.7
            addChild(kanji_bg_Node) // 四角形をシーンに追加
            
            let input_bg_Size = CGSize(width: 300, height: 50) // 文字に合わせたサイズに変更
            input_bg_Node = SKSpriteNode(color: .black, size: input_bg_Size)
            input_bg_Node.position = CGPoint(x: frame.midX-5, y: frame.midY-245)
            input_bg_Node.zPosition = -1
            input_bg_Node.alpha = 0.7
            addChild(input_bg_Node) // 四角形をシーンに追加
            
            timeExpired = false
            corrected = false
            startTimer()
            time_out_showing = false
        } else {
            print("reset")
            // すべての漢字を使用済みの場合、リセット
            usedKanji = []
            textField.text = ""
            //entering = true
            // 再帰的に漢字を選択
            updateKanji()
            
        }
    }
    
    func updateKanji() {
        // 前の漢字を消去
        kanjiLabel.removeFromParent()
        // 新しい漢字を設定
        setupKanji() // 新しい漢字を表示する
        
    }
    
    override func willMove(from view: SKView) {
        videoNode?.removeFromParent()
        var delay_time: TimeInterval = 25
        if selectedDifficulty == "extra"{delay_time = 36}
        if currentMode == "無制限" {delay_time = 12}
        DispatchQueue.main.asyncAfter(deadline: .now() + delay_time) {
            self.removeTextField()
        }
        //self.removeAllChildren()
        //removeTextField()
        //resetTimer()
        //super.willMove(from: view)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // エンターキーが押されたときに入力された文字列をprint
        if !entering && textField.text != ""{
            entering = true
            print("入力された文字列: \(textField.text ?? "")")
            isCorrect(input: textField.text ?? "")
            //print(t_f)
        }
        return true
    }
    
    func show_ans(User_read: String,User_mean: String){
        moveTextField(to: CGPoint(x:frame.midX, y:frame.minY - 100))
        var offsetY:CGFloat = 0
        if corrected {offsetY = -250}
        if let videoNode = videoNode {
            videoNode.alpha = 0.8
        }
        changePlaybackRate(to: 0.7)
        resetTimer()
        kanji_bg_Node.removeFromParent()
        input_bg_Node.removeFromParent()
        
        kanjiLabel.position = CGPoint(x: frame.minX+160, y: frame.midY-30+offsetY)
        //kanjiLabel.horizontalAlignmentMode = .left
        kanjiLabel.fontColor = .orange
        kanjiLabel.fontName = "Hiragino Sans"
        
        
        
        
        var show_ans_reading_User = User_read
        if User_read == ""{show_ans_reading_User = readings[0]}
        var show_ans_meaning_User = User_mean
        if User_mean == ""{show_ans_meaning_User = meanings[0]}
        
        
        let read_ans_Node = SKLabelNode(text: show_ans_reading_User)
        read_ans_Node.fontName = "Gyoshokk-R"
        read_ans_Node.fontSize = 36
        //read_ans_Node.horizontalAlignmentMode = .left
        read_ans_Node.fontColor = .cyan
        read_ans_Node.position = CGPoint(x: frame.midX+150, y: frame.midY+35+offsetY)
        addChild(read_ans_Node)
        
        // 長いテキストを行ごとに分割する関数
        func splitIntoLines(text: String, maxCharactersPerLine: Int) -> [String] {
            var lines: [String] = []
            var currentLine = ""
            
            for character in text {
                currentLine.append(character)
                if currentLine.count >= maxCharactersPerLine {
                    lines.append(currentLine)
                    currentLine = ""
                }
            }
            if !currentLine.isEmpty {
                lines.append(currentLine)
            }
            return lines
        }
        
        // ラベルを保持する配列
        var meaningLabels: [SKLabelNode] = []
        
        // ラベルを生成
        let maxCharactersPerLine = 20 // 1行あたりの最大文字数
        let meaningLines = splitIntoLines(text: show_ans_meaning_User, maxCharactersPerLine: maxCharactersPerLine)
        
        for (index, line) in meaningLines.enumerated() {
            let meaningLabel = SKLabelNode(text: line) // ローカル変数に変更
            meaningLabel.fontSize = 28
            meaningLabel.horizontalAlignmentMode = .left
            meaningLabel.fontName = "Gyoshokk-R"
            meaningLabel.fontColor = .white
            meaningLabel.position = CGPoint(
                x: frame.minX + 350,
                y: frame.midY - 20 + offsetY - CGFloat(index * 35) // 各行をずらして表示
            )
            addChild(meaningLabel)
            meaningLabels.append(meaningLabel) // 配列に追加
        }
        
        // ラベルをすべて消すメソッド
        func removeAllMeaningLabels() {
            for label in meaningLabels {
                label.removeFromParent() // シーンから削除
            }
            meaningLabels.removeAll() // 配列を空にする
        }
    


        
        let explain_bg_Size = CGSize(width: size.width, height: 150) // 文字に合わせたサイズに変更
        let explain_bg_Node = SKSpriteNode(color: .black, size: explain_bg_Size)
        explain_bg_Node.position = CGPoint(x: size.width / 2, y: size.height/2+offsetY)
        explain_bg_Node.zPosition = -5
        explain_bg_Node.alpha = 0.7
        addChild(explain_bg_Node) // 四角形をシーンに追加
        
        let reading_ans_Size = CGSize(width: 650, height: 100) // 文字に合わせたサイズに変更
        let reading_ans_Node = SKSpriteNode(color: .white, size: reading_ans_Size)
        reading_ans_Node.position = CGPoint(x: frame.midX + 150, y: frame.midY - 20+offsetY)
        reading_ans_Node.zPosition = -4
        reading_ans_Node.alpha = 0.2
        addChild(reading_ans_Node) // 四角形をシーンに追加
        
        // 2秒後に意味ラベルを消す
        DispatchQueue.main.asyncAfter(deadline: .now() + show_ans_remove_dead) {
            read_ans_Node.removeFromParent()
            removeAllMeaningLabels()
            reading_ans_Node.removeFromParent()
            explain_bg_Node.removeFromParent()
            self.textField.text = ""
            self.entering = false
            if self.currentStage >= self.totalStages + 1 && self.currentMode == "階層制"{
                self.goToClearScene()
            }else if self.currentMode=="無制限" && self.life <= 0{
                self.goToClearScene()
            }else{
                self.updateKanji() // 漢字を更新
            }
            
        }
    }
    // クリア画面に遷移
    func goToClearScene() {
        let clearScene = ClearScene(size: self.size)
        clearScene.level = selectedDifficulty ?? "Easy"
        clearScene.currentMode = currentMode
        //textField.removeFromSuperview()
        if currentMode == "無制限"{//save cloud
            clearScene.currentStage=currentStage
            saveStageToFirebase(Stage: currentStage, userName: my_username, difficulty: selectedDifficulty ?? "easy")
        }
        textField.isHidden = true
        textField.resignFirstResponder()
        clearScene.scaleMode = .aspectFill
        //self.view?.presentScene(clearScene, transition: SKTransition.fade(withDuration: 1.0))
        view?.presentScene(clearScene, transition: SKTransition.fade(withDuration: 1.0))
        
    }
    
    func isCorrect(input: String) {
        if let index = readings.firstIndex(of: input) {
            currentStage += 1
            show_ans_remove_dead = ans_time
            corrected = true
            
            print("正解！意味: \(kanjiMeaning ?? "意味なし")")
            textField.text = ""
            
            show_ans(User_read: input, User_mean: meanings[index])
            
            print(life)
            //return true
        } else if input == "q" {
            textField.text = ""
            corrected = false
            addSmoke()
            life -= 1
            updateLifeLabel()
            if let view = self.view {
                shakeScene(view: view)
            }
            show_ans(User_read: "", User_mean: "")
            if life <= 0 && currentMode == "階層制"{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
                    self.backgroundColor = .black
                    self.removeAllChildren()
                    self.textField.removeFromSuperview()
                }
            }
            
            //shakeScene()
        } else {
            corrected = false
            //print("不正解。正しい読みは \(correctAnswer!) です。")
            print(life)
            //life -= 1
            textField.text = ""
            updateLifeLabel()
            
            entering = false
            //return false
        }
    }
    
    
    
    @objc private func updateTimeBar() {
        remainingTime -= 0.1
        //print(remainingTime)
        if remainingTime <= 0 {
            remainingTime = 0
            timer?.invalidate()
            timer = nil
            if !time_out_showing{
                time_out_showing = true
                handleTimeout()
            }
        }else if remainingTime < 10 && !ten_s_beforeshake{
            //print(remainingTime)
            ten_s_beforeshake = true
            if let view = self.view {
                shakeScene(view: view)
            }
        }
        
        // 残り時間に応じてバーの幅を変更
        let percentage = CGFloat(remainingTime / timeLimit)
        timeBar.size.width = timeBarBackground.size.width * percentage
        
        // 残り時間に応じて色を変更（緑 → 赤）
        timeBar.color = SKColor(red: 1.0 - percentage, green: 0.0, blue: percentage, alpha: 1.0)
    }
    func updateLifeLabel(){
        if life > 0 {
            lifeLabel.text = String(repeating: "❤️", count: life)
        }else {
            lifeLabel.text = ""
        }
        
    }
    
    
    


    
    // 時間経過バーをセットアップ
    private func setupTimeBar() {
        let barWidth: CGFloat = size.width * 0.6
        let barHeight: CGFloat = 20.0
        
        // バーの背景
        timeBarBackground = SKSpriteNode(color: .gray, size: CGSize(width: barWidth, height: barHeight))
        timeBarBackground.position = CGPoint(x: frame.midX+185, y: size.height - barHeight - 20)
        addChild(timeBarBackground)
        
        // バー本体
        timeBar = SKSpriteNode(color: .green, size: CGSize(width: barWidth, height: barHeight))
        timeBar.anchorPoint = CGPoint(x: 0, y: 0.5) // 左端が基準
        timeBar.position = CGPoint(x: timeBarBackground.position.x - barWidth / 2, 
                                   y: timeBarBackground.position.y)
        addChild(timeBar)
    }
    
    private func startTimer() {
        remainingTime = timeLimit
        timer = Timer.scheduledTimer(timeInterval: 0.1, 
                                     target: self, 
                                     selector: #selector(updateTimeBar), 
                                     userInfo: nil, 
                                     repeats: true)
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func handleTimeout() {
        // タイムアウトの処理
        //print("時間切れ！不正解です。")
        //shakeScene()
        //showMissMarker() // ❌を表示
        life -= 1 // ライフを減らす
        updateLifeLabel()
        
        if let view = self.view {
            shakeScene(view: view)
        }
        addSmoke()
        if life > 0 {
            print("hey!")
            
            show_ans(User_read: "", User_mean: "")
        } else {
            show_ans(User_read: "", User_mean: "")
            if currentMode == "階層制"{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                    self.backgroundColor = .black
                    self.removeAllChildren()
                    self.textField.removeFromSuperview()
                }
            }
            //endGame() // ゲーム終了
        }
    }    
    
    
    func saveStageToFirebase(Stage: Int, userName: String, difficulty: String) {
        //print(Stage,userName,difficulty)
        let databaseURL = "https://a-journey-of-kanji-default-rtdb.firebaseio.com/endless/\(selectedDifficulty ?? "easy").json"
        guard let url = URL(string: databaseURL) else { return }
        
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"  // フォーマットを設定
        let formattedDate = dateFormatter.string(from: currentDate)
        
        // Step 1: 新しい記録を追加 (POST)
        let newStageData: [String: Any] = [
            "stage": currentStage,
            "userName": userName,
            "timestamp": formattedDate// Date().timeIntervalSince1970
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: newStageData) else { return }
        
        var postRequest = URLRequest(url: url)
        postRequest.httpMethod = "POST"
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        postRequest.httpBody = jsonData
        
        let postTask = URLSession.shared.dataTask(with: postRequest) { _, _, error in
            if let error = error {
                print("記録追加エラー: \(error.localizedDescription)")
                return
            }
            print("記録が追加されました！")
            // Step 2: 全記録を取得して処理
            self.retrieveAndSortScores(for: difficulty, databaseURL: databaseURL)
        }
        postTask.resume()
    }
    
    func retrieveAndSortScores(for difficulty: String, databaseURL: String) {
        guard let url = URL(string: databaseURL) else { return }
        
        var getRequest = URLRequest(url: url)
        getRequest.httpMethod = "GET"
        
        let getTask = URLSession.shared.dataTask(with: getRequest) { data, _, error in
            if let error = error {
                print("スコア取得エラー: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            var allScores: [[String: Any]] = []
            
            // JSONデコード
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: [String: Any]] {
                allScores = json.values.compactMap { $0 }
            }
            
            // スコアを降順でソートし、上位5件を取得
            let sortedScores = allScores.sorted {
                guard let score1 = $0["stage"] as? Int, let score2 = $1["stage"] as? Int else { return false }
                return score1 > score2
            }
            let top5Scores = Array(sortedScores.prefix(10))
            
            // 上位10件を保存 (PUT)
            self.updateTopScores(top5Scores, for: difficulty, databaseURL: databaseURL)
        }
        getTask.resume()
    }
    
    func updateTopScores(_ scores: [[String: Any]], for difficulty: String, databaseURL: String) {
        guard let url = URL(string: databaseURL) else { return }
        
        var putRequest = URLRequest(url: url)
        putRequest.httpMethod = "PUT"
        putRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: scores) else { return }
        putRequest.httpBody = jsonData
        
        let putTask = URLSession.shared.dataTask(with: putRequest) { _, _, error in
            if let error = error {
                print("上位スコア保存エラー: \(error.localizedDescription)")
            } else {
                print("上位スコアが更新されました！")
            }
        }
        putTask.resume()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNode = atPoint(location)
        // パーティクルを作成して表示
        //createTouchCircle(at: location)
        if let name = touchedNode.name {
            if name == "back_to_menu" {
                removeAllChildren()
                backgroundColor = .black
                textField.removeFromSuperview()
            }
        }
    } 
}

