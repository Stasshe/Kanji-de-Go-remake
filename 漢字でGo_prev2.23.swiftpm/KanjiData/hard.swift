import Foundation
let hardList:[(String,String,String)]=[
("橙","だいだい","みかん"),
("堯舜","ぎょうしゅん","古代中国の賢君"),
("滄海","そうかい","広大な海"),
("驃","ひょう","速い馬"),
("鬱陵","うつりょう","古代の地名、または孤立した島"),
("鏖戦","おうせん","熾烈な戦い、または死闘"),
("峨眉","がび","山の名前"),
("瓚","さん","賛美"),
("螳臂","とうひ","カマキリの前足、または無駄な努力"),
("瑤池","ようち","美しい池、または天上の楽園"),
("淇水","きすい","川の名前"),
("芙蓉","ふよう","ハスの花"),
("厭","いん","嫌う"),
("膺懲","ようちょう","懲罰する"),
("穀霖","こくりん","豊かな雨、または実りの季節"),
("纏綿","てんめん","深く絡み合う様子"),
("黯然","あんねん","失望した様子"),
("蜉蝣","かげろう","短命な虫"),
("羲和","ぎわ","太陽を象徴する神話上の存在"),
("鱸","すずき","魚の一種"),
("酣睡","かんすい","深い眠り"),
("讒言","ざんげん","人を陥れるための悪口"),
("鰭","ひれ","魚や鯨のヒレ"),
("澄江堂","ちょうこうどう","名前、または特定の文化的施設"),
("蹶起","けっき","困難に立ち向かうために奮起すること"),
("鬱金","うこん","薬用植物"),
("藍田","らんでん","美しい宝石が採れる地"),
("酣歌","かんか","盛大に歌うこと、または酔って歌うこと"),
("蠢動","しゅんどう","虫が這い回るように動き出すこと"),
("燭火","しょっか","ろうそくの火、またはその光"),
("鴻鵠","こうかく","鶴や大きな鳥、または非常に高い目標"),
("緋纓","ひえい","赤い飾り、または飾りをつけること"),
("屛風","びょうふう","屏風、または障壁となるもの"),
("蹕","ひつ","天子の行幸の前触れ"),
("霜葉","そうよう","霜の降りた葉、または寒冷な景色"),
("螟蛉","めいれい","本当の子でない養子"),
("雍容","ようよう","落ち着いて優雅な様子"),
("芥子","けし","ケシの実"),
("靉靆","あいたい","霧や雲が漂う様子"),
("鯤","こん","大きな魚"),
("簒奪","さんだつ","他人の地位や権力を奪うこと"),
("蠱惑","こわく","惑わす、または誘惑する"),
("猷","ゆう","計画"),
("嫣","えん","美しい、色鮮やかな"),
("無碍","むげ","妨げがないこと"),
("簪","かんざし","髪飾り"),
("縷々","るる","何度も繰り返すこと"),
("臘月","ろうげつ","年末、または寒さの厳しい時期"),
("虞淵","ぐえん","神話に登場する太陽の沈む場所"),
("蛻","もぬけ","脱皮"),
("瓠瓜","こか$ゆうがお","ウリ科の植物、またはその実$%"),
("墟","きょ","荒れ地"),
("慄然","りつぜん","恐ろしさで震える様子"),
("駘蕩","たいとう","のどかで穏やかな様子"),
("跋扈","ばっこ","思うままに振る舞うこと"),
("雲漢","うんかん","銀河、または天の川"),
("慇懃","いんぎん","非常に礼儀正しいこと"),
("辟易","へきえき","圧倒されてしりごみすること"),
("鵺","ぬえ","日本の妖怪"),
("鬚","ひげ","顔に生える毛"),
("鴕鳥", "だちょう", "ダチョウ、またはその象徴的な存在"),
("篩","ふるい","ふるいにかける"),
("剣呑","けんのん","危険なこと"),
("彷徨","ほうこう","さまようこと"),
("禅定","ぜんじょう","瞑想"),
("佇立","ちょりつ","じっと立っていること"),
("蓁蓁","しんしん","草木が生い茂る様子"),
("儘","まま","思い通り"),
("堯舜","ぎょうしゅん","伝説的な中国の帝王"),
("繆桂","びょうけい","神仏のような存在"),
("瓢","ひょう","瓢箪"),
("鞠躬","きっきゅう","深くお辞儀をすること"),
("桎梏","しっこく","束縛や制約"),
("鵺","ぬえ","怪物、伝説の妖怪"),
("澄明","ちょうめい","清らかで澄んでいる様子"),
("簒奪","さんだつ","他人の権力や地位を奪うこと"),
("煉瓦","れんが","焼いた赤土で作った建材"),
("陰鬱","いんうつ","暗く沈んだ気分や雰囲気"),
("蠱惑","こわく","人を誘惑すること"),
("鯨波","げいは","大きな波、鯨のように巨大な波"),
("寥寥","りょうりょう","物が少なく寂しい様子"),
("薨去","こうきょ","死去すること、特に皇族や貴族が亡くなること"),
("諦念","ていねん","あきらめ、心の静けさ"),
("賦予","ふよ","与えること、任せること"),
("豺狼","さいろう","食物を狙う獰猛な動物"),
("逍遥","しょうよう","自由に歩き回ること"),
("謾","まん","不正確な言葉や行動"),
("罌粟","けし","ケシの花、またはその実"),
("鴇","とき","トキ（鳥）"),
("瓠","へちま","ヘチマ"),
("饕餮","とうてつ","食欲が非常に強い様子"),
("鞴","ふいご","鉄を炉で温めるための道具"),
("戯言","たわごと","無駄な言葉、馬鹿げた話"),
("鯱","しゃち","シャチ（魚）"),
("鼈甲","べっこう","カメの甲羅、またはそれで作られた工芸品"),
("櫻","さくら","桜の花"),
("錆色","さびいろ","錆びたような色"),
("倭","やまと","日本の古称"),
("螻蛄","けら","昆虫のケラ"),
("瑠璃色","るりいろ","青い宝石の色"),
("鷹匠","たかじょう","鷹を使う職業"),
("蘇芳","すおう","赤紫色"),
("擲弾","てきだん","手投げ弾"),
("蟇","ひきがえる","カエル"),
("雲雀","ひばり","ヒバリ（鳥）"),
("魯鈍","ろどん","鈍く、理解力が遅いこと"),
("馥郁","ふくいく","香りが豊かであること"),
("鼾","いびき","眠っている時の呼吸音"),
("艨艟","もうしょう","大きな船"),
("縷々","るる","細かく繰り返し言うこと"),
("斛","こく","容量の単位"),
("蘄春","きしゅん","春の初め"),
("氷雨","ひさめ","冬の霧雨"),
("珊瑚","さんご","海の生物が作った硬い骨"),
("閻魔","えんま","地獄の王"),
("藍青","あいあお","青と藍色"),
("睾丸","こうがん","男性の性器"),
("萱草","かんぞう","カンゾウの花"),
("昴星","すばる","プレアデス星団"),
("鑑賞","かんしょう","芸術などを楽しみながら見ること"),
("轟音","ごうおん","大きな音"),
("巽","たつみ","東南、または方位"),
("瓢箪","ひょうたん","ひょうたんの実、またはその形"),
("霜月","しもつき","11月"),
("掏摸","すり","財布を盗むこと"),
("棘","とげ","植物や物のとがった部分"),
("鳩尾","みぞおち","胸の中心部"),
("鶴見","つるみ","日本の地名"),
("糸瓜","へちま","ヘチマの実"),
("壌土","じょうど","肥沃な土"),
("篝火","かがりび","夜の火、またはキャンプファイヤー"),
("黎明","れいめい","夜明け、または新しい始まり"),
("鞄","かばん","バッグ"),
("躑","てき","躑躅（つつじ）の一部"),
("杳然","ようぜん","行方が分からなくなる様子"),
("踟蹰","ちちゅう","決断できず迷い躊躇すること"),
("韜晦","とうかい","本心や本性を隠すこと"),
("闃寂","げきじゃく","ひっそりと静まり返っていること"),
("蒐集","しゅうしゅう","広く集めること"),
("皓々","こうこう","白く輝く様子"),
("夭逝","ようせい","若くして亡くなること"),
("跋扈","ばっこ","思うままに振る舞うこと"),
("膾炙","かいしゃ","広く人々に知られ称賛されること"),
("瀆職","とくしょく","職務を汚すこと"),
("讒謗","ざんぼう","他人を誹謗し中傷すること"),
("嗜虐","しぎゃく","他人に苦痛を与えることを楽しむこと"),
("驟雨","しゅうう","突然降り出してすぐ止む雨"),
("覬覦","きゆ","不相応なものを得ようとすること"),
("啜泣","すすりなき","声を抑えた泣き方"),
("怯懦","きょうだ","臆病で気が弱いこと"),
("凌辱","りょうじょく","ひどく恥をかかせること"),
("謬見","びゅうけん","誤った考えや意見"),
("耽溺","たんでき","物事に夢中になりふけること"),
("虚飾","きょしょく","中身を偽って美しく見せること"),
("煩瑣","はんさ","煩わしく細々したこと"),
("淫蕩","いんとう","節度を失った好色な振る舞い"),
("惨憺","さんたん","ひどく痛々しい様子"),
("蹉跌","さてつ","挫折や失敗"),
("剛毅","ごうき","意志が強く、物事に屈しないこと"),
("譎詭","けっき","言動がたくみで怪しいこと"),
("潰滅","かいめつ","完全に壊れること"),
("幽囚","ゆうしゅう","自由を奪われて閉じ込められること"),
("縷縷","るる","細かく述べること"),
("蹂足","じゅうそく","無視して踏みにじること"),
("悽愴","せいそう","ひどく痛ましく悲しいこと"),
("勃興","ぼっこう","急に勢力を得ること"),
("猖獗","しょうけつ","悪いものが広まりはびこること"),
("畢生","ひっせい","一生涯"),
("玩弄","がんろう","もてあそぶこと"),
("鳳凰","ほうおう","伝説上の瑞鳥、平和の象徴"),
("蹇蹇","けんけん","困難な様子、または忠誠心を表す言葉"),
("靉靆","あいたい","雲がたなびく様子、幻想的な景観を表現"),
("灑涙","さいるい","涙を流すこと、深い悲しみや感動を表す"),
("爛漫","らんまん","花が咲き乱れる様子、生気や感情が豊かであること"),
("巍峨","ぎが","山が高くそびえ立つ様子、威厳があること"),
("瀛洲","えいしゅう","仙人が住むとされる海上の楽園"),
("梵唄","ぼんばい","仏教の経文を唱える声"),
("瑤琴","ようきん","美しい音色の琴、芸術的な象徴"),
("瓊枝","けいし","美しい樹木、宝樹"),
("芙蓉","ふよう","ハスの花、美しさの象徴"),
("兀兀（努力する）","こつこつ","一心不乱に努力する様子"),
("黛眉","たいび","眉の形を美しく描くこと、美人の象徴"),
("螺鈿","らでん","貝殻を嵌め込んで装飾する技術や模様"),
("蹉跎","さだ","時間を無駄に過ごすこと、遅れること"),
("羈絆","きはん","束縛や制約、自由を奪うもの"),
("懶惰","らんだ","怠けること、やる気がないこと"),
("厖大","ぼうだい","非常に大きいこと、膨大な量"),
("蘊蓄","うんちく","深い知識や学識"),
("斑駁","はんぱく","まだら模様、不統一な様子"),
("瀟洒","しょうしゃ","上品で洗練された美しさ"),
("睥睨","へいげい","見下しながら周囲をにらむこと"),
("匡正","きょうせい","正しく直すこと、誤りを正すこと"),
("黠智","かつち","賢く抜け目のない知恵"),
("疏漏","そろう","注意が行き届かず、見落としがあること"),
("寂寥","せきりょう","ひっそりとして寂しい様子"),
("撚糸","ねんし","糸を撚ること、細かい努力や細心の注意を払うこと"),
("鴻鵠の志","こうこくのこころざし","大きな志を抱くこと、遠大な目標を持つこと"),
("無為自然","むいしぜん","人為を排して自然のままに任せること"),
("空谷幽蘭","くうこくゆうらん","人里離れた静かな場所でのひっそりとした美しさ"),
("開天辟地","かいてんぺきち","天地創造、まったく新しいことを始めること"),
("鸞驤","らんじょう","瑞鳥の飛翔、喜びの象徴"),
("滄瀾","そうらん","広大な青い波、海や湖の雄大さを表す"),
("懿徳","いとく","すぐれた品性、高い徳"),
("蘚苔","せんたい","苔類、自然の象徴"),
("騫騰","けんとう","天高く昇ること、成功を暗示する言葉"),
("瑾瑜","きんゆ","美しい玉、高貴な人を象徴する"),
("燦然","さんぜん","きらきらと光り輝く様子"),
("靄靄","あいあい","霧や霞がたちこめる様子"),
("黯然","あんぜん","暗く沈んだ様子、深い悲しみ"),
("蹇渉","けんしょう","困難を乗り越える努力"),
("蠖屈","かくくつ","逆境に耐えながら時機を待つ様子"),
("瀛海","えいかい","無限に広がる海、無辺の象徴"),
("礪石","れいせき","刃を研ぐ石、自己鍛錬の象徴"),
("昊天","こうてん","果てしなく広い空、大宇宙"),
("澹泊","たんぱく","物欲を持たず、心が穏やかな様子"),
("隴畝","ろうぼう","山脈や丘陵、広がる自然の風景"),
("瑶光","ようこう","宝石のように輝く光"),
("纓冠","えいかん","冠につける飾り、栄誉の象徴"),
("碣石","けっせき","険しく高い岩、大自然の威容"),
("雲錦","うんきん","雲のような模様を持つ錦織物、美の象徴"),
("藜藿","れいかく","粗末な食事、貧しい暮らしを示す言葉"),
("瑩澈","えいてつ","澄みきって透明なこと、純粋な心"),
("虯髯","きゅうぜん","巻き毛の髭、勇壮な姿の象徴"),
("巌窟","がんくつ","大きな洞窟、険しい岩場"),
("曄然","ようぜん","光り輝く様子、名声が高いこと"),
("欝勃","うつぼつ","力が満ち溢れ、激しく動き出す様子"),
("鴻蒙","こうもう","天地開闢の混沌、宇宙の始まり"),
("睥睨","へいげい","威圧的に睨みつけること"),
("蘆荻","ろてき","秋の草原を象徴する植物"),
("鍾馗","しょうき","悪霊を払う神、または鬼神"),
("鬻売","ゆうばい","商売や売ること"),
("胯下","こかしら","尻の下の部分、または恥ずかしいこと"),
("檣旗","しょうき","船の旗柱、またはその旗"),
("蹈鞴","たたら","たたら。踏鞴"),
("噤黙","きんもく","口を閉ざすこと、または沈黙すること"),
("佶屈","きっくつ","道理に合わないこと、または無理なこと"),
("輻射","ふくしゃ","放射線やエネルギーが一方向に放出されること"),
("蟣虫","し虫","小さな虫、または害虫"),
("罻罰","ばつばつ","厳しい罰、または処罰"),
("瓠瓜","うねびし","ウリ科の植物、または瓠の果物"),
("諶訓","しんくん","非常に厳しい訓戒"),
("賨谷","ぞうこく","山岳部にある谷間"),
("韘韘","しゅうしゅう","音楽や音の美しさ"),
("鰰魚","はたはた","魚の一種、または大型の魚"),
("鸞飄鳳泊","らんぴょうほうはく","才能ある人が世を流浪すること"),
("獣癸","じゅうき","獣の性質、または動物的な性格"),
("鸞翔","らんしょう","美しい鳥が舞い上がる様子"),
("魃魈魍魎","ばつしょうもうりょう","妖怪や怪異の総称"),
("綸音","りんおん","調和の取れた音、または琴の音色"),
("蜉蝣撼大樹","ふゆうかんたいじゅ","自分の力を知らず大事に挑むこと"),
("魃","ばつ","旱魃（干ばつを引き起こす妖怪）"),
("鼷鼠","しっそ","小さなネズミ、または害獣"),
("羝羊触藩","ていようしょくはん","行き詰まった状態"),
("瑛星","えいせい","美しい星、または輝く星"),
("鷹揚","おうよう","悠々として余裕がある様子"),
("赧顔","かんがん","赤面すること、または顔が赤くなること"),
("捧心","ほうしん","心を尽くして奉仕すること"),
("蠍尾","さそりび","サソリの尾、または危険なもの"),
("驩","かん","喜び"),
("殷賑","いんしん","非常に繁華な様子"),
("曙光","しょこう","夜明け、または希望の兆し"),
("莚毯","えんたん","敷物、または絨毯"),
("瀾濤","らんとう","大きな波、または荒れた海"),
("艤装","ぎそう","船の装備、または船の備品"),
("璦璞","あいはく","非常に美しい玉、または希少な玉"),
("觸覚","しょくかく","触れることによる感覚、または触覚器官"),
("鴟鵟","ちこう","鳥の一種、または猛禽類"),
("楓葉","ふうよう","カエデの葉、または秋の風景"),
("鏖殺","ごうさつ","戦争や戦闘での殺戮"),
("龕灯","がんとう","灯篭、または仏像の前に灯す灯"),
("襁褓","おむつ","赤ん坊の布おむつ"),
("鳳求","ほうきゅう","鳳凰を求めること、または理想の物を探し求めること"),
("蚯蚓","みみず","ミミズ、または土壌を耕す生物"),
("藩屏","はんびょう","藩の防壁、または国家の防衛"),
("鸚鵡","おうむ","鳥の一種、または言葉を真似る動物"),
("戯弄","ぎろう","遊ぶこと、またはふざけること"),
("螳螂","とうろう","カマキリ、またはその動き"),
("菱角","ひしあたま","ヒシの角、またはその形"),
("檳榔","びんろう","植物の一種、またはその果実"),
("鹽粥","えんじゅく","塩分を含んだ粥、または長い間食べ続けること"),
("飄逸","ひょういつ","軽やかで自在な様子"),
("飽食","ほうしょく","満腹になること、または食べ過ぎ"),
("鵲巣","かくそう","カササギの巣、または巣作りの巧妙さ"),
("荀彧","じんいく","歴史的な人物、または知恵のある人物"),
("鴻鵠","こうこく","大きな鳥、または高い目標を持つこと"),
("儸賣","ろうばい","物を売ること、または商売"),
("櫓木","ろぎ","船の上で操縦を行う木の部分"),
("艪艦","ろかん","船の船尾にある水夫が漕ぐ櫓"),
("瓢簞","ひょうたん","ヒョウタン、またはそれを使った容器"),
("幢幡","どうばん","旗、または軍旗"),
("鱗爪","りんそう","魚の鱗や猛禽類の爪"),
("葢焉","けいえん","何かを覆うこと、または封じ込めること"),
("閼伽","あっか","仏教における仏前の供物の一つ"),
("顧影","こえい","自分の影を見ること、または自己の姿を見ること"),
("辜負","こふ","期待に応えられないこと、または裏切ること"),
("驍勇","ごうゆう","非常に勇敢で強いこと"),
("鷲視","しゅうし","高い位置から見ること、または鋭く観察すること"),
("劍鋒","けんほう","剣の刃、またはその鋭さ"),
("蟋蟀","きりぎりす","キリギリス、またはその鳴き声"),
("琉璃","りゅうり","美しいガラスや玉石"),
("犀利","さいり","非常に鋭いこと、または鋭敏"),
("灤溢","らんいつ","水が溢れること、または水流の強さ"),
("藪蘭","やぶらん","ヤブランの植物、またはそれに関連するもの"),
("酆湘","ほうしょう","古代中国の地名、またはその地域"),
("鵬程","ほうてい","大きな鳥の飛行、または高い目標の進行"),
("鴇羽","ときばね","トキの羽、またはその美しさ"),
("瑪瑙","めのう","美しい石、またはその種類"),
("蒼猿","そうえん","猿の一種、またはその動物"),
("纛旗","とうき","戦旗や軍の旗"),
("霓虹","げいこう","虹のように美しい現象"),
("翡翠","ひすい","美しい緑色の宝石、または翡翠のような色合い"),
("鞦韆","しゅうせん","ブランコ、または遊具"),
("綾織","あやおり","複雑に織られた布、またはその技術"),
("櫓櫻","ろおう","船の櫓と桜、または桜の花の美しさ"),
("璧玉","へきぎょく","美しい玉、またはその形"),
("彷徨","ほうこう","あてもなく歩き回ること"),
("鸞鳳","らんほう","伝説の鳥、または幸運を呼ぶ象徴"),
("鴇蝶","ときちょう","トキ蝶、またはその種類"),
("獅子吼","ししこう","獅子の吠える声、または威厳のある発言"),
("鹹水","かんすい","塩水、または塩分を含んだ水"),
("鳩首","きゅうしゅ","頭を合わせること、または協力すること"),
("猩猩","しょうじょう","オランウータン、またはその動物"),
("曇天","どんてん","曇った空、または不安定な天気"),
("槁木","こうぼく","枯れ木、または干からびた木"),
("錦鯉","きんこい","美しい鯉、または金色の鯉"),
("旌旗","せいき","軍の旗、または戦場での旗"),
("鵲","かく","カササギ、またはその鳥の名前"),
("羲和","きわ","伝説の古代の帝王、またはその時代の概念"),
("繍花","しゅうか","刺繍や装飾的な花"),
("黷父","あくふ","父親を冒涜すること、または父親を侮辱すること"),
("璞玉","はくぎょく","未加工の玉石、またはその状態"),
("翰墨","かんぼく","書道や墨絵に使う墨"),
("蓮華","れんげ","蓮の花、または仏教の象徴"),
("韜光","とうこう","才能や光を隠すこと"),
("鞣革","なめしがわ","皮をなめして作った革"),
("冥闇","めいやみ","深い闇、または絶望的な状況"),
("蝙蝠","こうもり","コウモリ、またはその動物"),
("荼毘","だび","焼却すること、または火葬"),
("螳螂","とうろう","カマキリ、またはその動物"),
("檀越","だんおつ","仏教における信者の代表"),
("鮠魚","ばいぎょ","鮠（ハエ）という魚のこと"),
("蒿蓼","こうりょう","草の名前、またはその薬効"),
("棲鳳","せいほう","鳳凰が巣を作ること、または理想的な住処"),
("穹窿","きゅうろう","天井、または空間の広がり"),
("竜胆","りんどう","植物のリンドウ"),
("蕨菜","わらびな","ワラビ、またはその食用部分"),
("獺祭","だっさい","カワウソの祭り、または奇抜な行動"),
("鶴立","かくりつ","鶴が立つこと、または立派な姿勢"),
("蔦藤","つたふじ","ツタと藤、またはそれらの植物が絡む様子"),
("蜀葵","しょっき","タチアオイ、またはその植物"),
("菖蒲","あやめ","アヤメ、またはその花"),
("琴瑟","きんしつ","琴と瑟、古代の弦楽器"),
("莢果","きょうか","さやの果物、または豆類の実"),
("鷂鳥","やつがしら","タカの一種"),
("柳葉","やなぎば$やないば","柳の葉、またはその形状$%"),
("鸛巣","こうそう","コウノトリの巣"),
("鷗飛","こうひ","カモメの飛ぶ様子"),
("紫苑","しおん","シオンの花"),
("柳垂","やなぎたれ","柳の枝が垂れる様子"),
("臘月","ろうげつ","12月、または寒冷の季節"),
("渾然","こんぜん","自然に一体となった様子"),
("瑜伽","ゆが","ヨガ、または修行の方法"),
("盂蘭盆","うらぼん","お盆、または先祖を迎える行事"),
("弛緩","しかん","緊張が緩むこと、または解放"),
("勍敵","けいてき","強力な敵"),
("焚書","ふんしょ","書物を焼くこと、または知識の抑制"),
("鞴音","ふつおん","鍛冶屋の炉で鳴る音"),
("謨議","ぼぎ","重要な相談や議論"),
("蜃気楼","しんきろう","空気の屈折による幻想的な景色"),
("霹靂","へきれき","雷の音、または大きな音"),
("諧謔","かいぎゃく","ユーモア、または滑稽なこと"),
("峻険","しゅんけん","険しい山の様子"),
("糜爛","びらん","腐敗すること、または荒廃"),
("穰穣","じょうじょう","豊かな様子、または繁栄"),
("駭然","かいぜん","驚く、または驚愕する様子"),
("繚乱","りょうらん","騒動、または乱れた状態"),
("梏","かく","束縛、または縛りつけること"),
("鴛鴦","おしどり","オシドリ、または夫婦仲の良い象徴"),
("欝金","うつきん","鬱金、またはインディアン金"),
("黙契","もっけい","言葉を交わさない契約、または黙示契約"),
("揺籃","ようらん","赤ちゃんを育てること、または揺りかご"),
("瑕疵","かし","欠点、または不完全な部分"),
("瀆神","とくしん","神を冒涜すること"),
("斟酌","しんしゃく","配慮する、または気を使うこと"),
("響廓","きょうかく","響き渡る音の広がり"),
("空疎","くうそ","空虚で意味のない様子"),
("臧否","そうひ","良し悪し、または評価"),
("蘭亭","らんてい","詩を詠むための場所"),
("諷刺","ふうし","風刺、または批評的な表現"),
("戯論","ぎろん","遊び半分の議論、または無駄な議論"),
("譬喩","ひゆ","比喩、または象徴的な表現"),
("濫觴","らんしょう","物事の始まり、または源流"),
("蛍火","ほたるび","ホタルの光"),
("賢哲","けんてつ","賢くて知恵のある人物"),
("鰐口","わにぐち","ワニの口、または広口の道具"),
]
