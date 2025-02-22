import Foundation
let extraList: [(String, String, String)] = [
("蜘糸","い","蜘蛛の糸"),
("氫","すいそ","H"),
("氦","へりうむ","He"),
("硼","ほうそ","B"),
("汞","すいぎん","Hg"),
("鎂","まぐねしうむ","Mg"),
("驫","ひょう","多くの馬"),
("蒼氓","そうぼう","一般の庶民"),
("彝倫","いりん","人間社会の基本的な秩序"),
("驚鴻","きょうこう","瞬間的で美しい姿"),
("閸門","へきもん","門の名前、または門の装置"),
("儳虓", "そうこう", "虚無的な様子、または空虚な音"),
("桓桕","かんこう","古代中国の楽器または装飾的な要素"),
("桑樹","そうじゅ","桑の木、またはその植物"),
("鯢魚","りょうぎょ","フグ、またはその魚の一種"),
("鷛鷟", "しゅうそく", "神話に登場する神鳥、または荒々しい獣"),
("夔龍", "きりゅう", "伝説上の神龍"),
("蟾蜍", "せんちょ", "カエル、または神話的な動物"),
("鯀鯨", "こんけい", "古代の巨大魚または海の神話的な存在"),
("猗与", "いよ", "古代の神、または神話に登場する人物"),
("讖緯", "しんい", "古代中国の占い、または運命の予兆"),
("躑躅","てきちょく$つつじ","ためらい進むこと$ツツジ"),
("齷齪","あくせく","小さなことにこだわりせわしなくすること"),
("攀登","はんとう","山や崖などをよじ登ること"),
("覿面","てきめん","効果がすぐに現れること"),
("瀦滞","ちょたい","液体などが溜まり滞ること"),
("讒謗","ざんぼう","人を陥れる悪口"),
("懦弱","だじゃく","意志が弱く気力がないこと"),
("矍鑠","かくしゃく","老人が丈夫で元気な様子"),
("譎詭","けっき","たくらみや欺き"),
("杳然","ようぜん","行方が知れず遠いこと"),
("灑洒","しゃしゃ","大らかでこだわらないこと"),
("覬覦","きゆ","身分に似合わないものを得ようとすること"),
("濡毫","じゅごう","筆を濡らして文字を書くこと"),
("跫然","きょうぜん","足音が響く様子"),
("靄靄","あいあい","霧や霞が立ち込める様子"),
("狷介","けんかい","自分の考えを固く守り通すこと"),
("瘴癘","しょうれい","風土病や毒気"),
("爨炊","さんすい","飯を炊くこと"),
("巉絶","ざんぜつ","切り立った険しい崖"),
("欷歔","ききょ","すすり泣き"),
("躔躋","てんせい","階段を一段一段登ること"),
("粲然","さんぜん","にっこり微笑む様子"),
("靦腆","てんてん","恥ずかしそうな様子"),
("顫動","せんどう","震えること、振動"),
("慫慂","しょうよう","勧め励ますこと"),
("蹙迫","しゅくはく","事態が差し迫ること"),
("觚不觚","こふこ","本来の形を失った様子"),
("鷽替","さくたい","嘘を本当のように言うこと"),
("斑鳩","いかる","鳥の一種、または奈良の地名"),
("黿鼉","げんだ","大亀やワニの類"),
("瓊瑤","けいよう","美しい玉や宝石"),
("鬯鬯","ちょうちょう","香りが盛んに漂うこと"),
("饞涎欲滴","さんぜんよくてき","食べ物が欲しくて涎を垂らすこと"),
("鷙悍","しかん","気性が荒く勇ましいこと"),
("縹碧","ひょうへき","淡い青緑色"),
("濯纓","たくえい","汚れを洗い清めること"),
("蘚苔","せんたい","苔や地衣類のこと"),
("觳觫","こくしょく","恐れて震える様子"),
("鸛鵲","かんじゃく","コウノトリやカササギ"),
("齠齔","ちょうしん","子供の乳歯が抜け変わる時期"),
("鱏鰉","じゅんこう","チョウザメ"),
("蠖屈","かっくつ","しなやかに曲がる様子"),
("鱏鰌","じゅんしゅう","魚の種類、チョウザメとドジョウ"),
("瞿然","くぜん","驚き恐れること"),
("犀利","さいり","鋭い、またはとても鋭敏な"),
("璀璨","すいさん","美しく輝くこと、または煌めく"),
("纛旗","とうき","戦旗、または軍の旗"),
("鶴膝","かくしつ","鶴の膝、または優れた人物の比喩"),
("倖虧","こうき","運命や幸福を逃すこと"),
("鞠躬","きっきゅう","腰をかがめて礼を尽くすこと"),
("辯髄","べんずい","言葉巧みで、理論的に優れた能力"),
("驍勇","きょうゆう","非常に勇敢で力強い様子"),
("翕然","きつぜん","目を閉じて静かに佇むこと"),
("曠古","こうこ","古代の時代、または遠い過去"),
("穎異","えいい","際立って異なる、または群を抜いている"),
("頽廃","たいはい","道徳的な腐敗、または精神的な衰退"),
("轅頭","えんとう","車の先端、または船の先端"),
("撻打","たった","激しく叩くこと、または殴打"),
("冢塋","ちょうえい","墓、または亡者を埋葬する場所"),
("斑斕","はんらん","美しく、色とりどりの様子"),
("栩栩","しょくしょく","生命力に満ち溢れた様子"),
("龕燈","あんとう","燭台、または仏教の灯明"),
("犀牛","さいぎゅう","犀の動物、またはその象徴"),
("曷不","かつふ","なぜ～しないのか、またはいかに～せんや"),
("賁臯","ほんごう","古代中国の王朝の一族名"),
("瀟洒","しょうしゃ","気品があり、優れた風格を持つ"),
("杳冥","ようめい","遥かに暗く深い様子"),
("黽勉","びんべん","懸命に努力すること"),
("羯磨","けつま","摩擦、または苦行"),
("鷯鶴","ろうかく","鶴のように長寿を象徴する鳥"),
("懿行","いこう","非常に優れた行い"),
("鄭重","ていちょう","丁寧で礼儀正しい様子"),
("誶","けん","おおいに誓う、または誓約"),
("𬴂","えん","星の一種、または天文の用語"),
("夤夜","いんや","夜更け、または深夜"),
("諄諄","じゅんじゅん","繰り返し説く、または説教する様子"),
("兀兀（堅苦しい）","ごつごつ","堅苦しく、または冷たい印象を与える"),
("鯉鯊","りか","魚の一種、または特定の魚の象徴"),
("鷙","ちょう","猛禽類、または非常に鋭い眼を持つ鳥"),
("魇夢","えんむ","悪夢、または怖ろしい夢"),
("黔驢","けんろ","黒いロバ、または限界を示す"),
("竦然","しょうぜん","恐れて、または緊張した様子"),
("匏瓜","ほうか","ウリ科の植物、またはその実"),
("楸樹","ちゅうじゅ","木の一種、またはその果実"),
("毳衣","けいえ","毛皮の衣服、または珍しい素材"),
("轆轤","ろくろ","旋盤、または工芸品を作る道具"),
("鞴音","ふつおん","鍛冶屋の炉で鳴る音、または音響"),
("璞玉","はくぎょく","未加工の宝石"),
("、","ともしび","<不明>"),
("驩虞","かんぐ","古代中国の美しい音楽の一つ"),
("鴟尾","しび","寺院の屋根の装飾"),
("鵷鶵","えんすう","伝説上の美しい鳥"),
("鸑鷟","がくさく","鳳凰に似た神鳥"),
("夔龍","きりゅう","中国神話に登場する霊獣"),
("瓊玖","けいきゅう","美しい宝石"),
("穆穆","ぼくぼく","穏やかで尊敬される様子"),
("螭吻","ちふん","龍の装飾、または魔除け"),
("欝金","うこん","黄色い染料、または植物名"),
("瑶瑟","ようしつ","古代中国の楽器"),
("甍棟","ぼうとう","建物の屋根の梁や棟"),
("霄壌","しょうじょう","天と地"),
("皋陶","こうとう","古代中国の聖人"),
("鄭声","ていせい","華やかな音楽だが堕落を招くとされる"),
("觚稜","こりょう","八角形の柱の一部"),
("寤寐","ごび","目覚めている時と眠っている時"),
("蹇蹇","けんけん","困難な状況"),
("曠遠","こうえん","広く果てしない様子"),
("鯀禹","こんう","治水で有名な古代中国の親子"),
("儺儀","だぎ","厄払いの儀式"),
("鵬翼","ほうよく","大きな鳥の翼"),
("灌頂","かんじょう","仏教の儀式、または祝福"),
("蘞い","えぐい","たべものの蘞味"),
("躅躅","ちょくちょく","迷いながら歩く様子"),
("黥首","げいしゅ","罪人の額に刻まれた入墨"),
("禄蠹","ろくと","利益を貪る害悪"),
("曩昔","のうせき","遥か昔"),
("縹渺","ひょうびょう","遥か遠く曖昧な様子"),
("讙譁","かんか","人々が騒ぎ立てる様子"),
("瀟湘","しょうしょう","中国の風光明媚な地域"),
("皓月","こうげつ","清らかで美しい月"),
("鬻書","いくしょ","書物を売ること"),
("鄂君","がっくん","古代中国の君主の称号"),
("洶湧","きょうよう","波が盛り上がる様子"),
("謐謐","ひつひつ","静かで落ち着いた様子"),
("霍霍","かくかく","鋭い刃が光る様子"),
("粛霜","しゅくそう","霜が厳しく降りる様子"),
("釋奠","しゃくてん","祭りの儀式"),
("濯清","たくせい","清水で洗う"),
("蕭条","しょうじょう","寂しい様子"),
("巖窟","がんくつ","大きな岩の中の洞窟"),
("倥偬","こうそう","忙しい様子"),
("俠義","きょうぎ","正義感の強い心"),
("虺蛇","きだ","毒蛇"),
("煜","えい","光を放つこと"),
("迥廓","こうかく","広大な景色"),
("瀆職","とくしょく","公務員が職務を怠ること"),
("夙夜","しゅくや","朝晩"),
("藩屏","はんぴょう","国家の防衛体制"),
("螻蟻","こうぎ","アリ"),
("閨閥","けいばつ","家の権力"),
("蹉跌","さてつ","失敗"),
("縶絏","じゅうけつ","拘束すること"),
("巫覡","ふけつ","神託を得る人"),
("藉","しゃ","藁や草で作ったもの"),
("犖犖","ろうろう","動物が元気に動き回る様子"),
("郁郁","いくいく","芳しい匂い"),
("栢","かし","ヒノキの木"),
("圯","い","土手の下に流れる水"),
("荊棘","けいきょく","茨の道"),
("鑾","らん","龍の舞う道具"),
("鼬","いたち","動物の一種"),
("馘","けつ","首を切ること"),
("訥","とつ","言葉が不明瞭なこと"),
("顰笑","ひんしょう","しかめっ面で笑うこと"),
("遏制","あっせい","抑制すること"),
("鵠","くぐい","大型の白い鳥"),
("穉子","おさなご","幼子"),
("璣","けい","珍しい宝石"),
("穹窿","きゅうりゅう$きゅうろ","半球・天・大空$%"),
("鏘","しょう","音を立てる"),
("澶","しん","広がる"),
("鷙鳥","しちょう","猛禽類"),
("薨","こう","死去"),
("謇","けつ","しゃべらない"),
("昉","ほう","日が昇る"),
("珮","ぺい","玉の装飾品"),
("翳","えい","陰影"),
("韜光","とうこう","光を隠す"),
("瓘","かん","美しい玉"),
("羆","ひぐま","ヒグマ"),
("滌","けつ","きれいにする"),
("齊","せい","整える"),
("瞽","ご","盲目"),
("憂懼","ゆうく","恐れおののく"),
("檀越","だんおつ","仏教用語"),
("肅","しゅく","厳か"),
("襤褸","ぼろ","ぼろ布"),
("緡","ばん","織物"),
("曇花","どんか","一夜の花"),
("螻","こう","蟻の仲間"),
("甑","こしき","蒸し器"),
("鴇","とき","鳥の一種"),
("肇","ちょう","始める"),
("貔貅","ぴきゅう","伝説の獣"),
("曷","かつ","何"),
("刳","くり","穴を開ける"),
("獺","かわうそ","動物"),
("睇","てき","じっと見る"),
("臻","しん","至る"),
("膺懲","ようちょう","懲罰する"),
("恁","えん","そのような"),
("蹉跎","さだ","迷うこと"),
("彳","ちょ","歩く"),
("彳亍","てきちょく","ゆっくり歩く"),
("爨","さん","料理すること"),
("隴","ろう","山を越える"),
("鼷鼠","しそ","ハツカネズミ"),
("鼯鼠","ごそ$むささび","ムササビ$%"),
("篆","てん","古代の印章"),
("鰐","わに","ワニ"),
("襤褸","ぼろ","ぼろ布"),
("亙","わたる","渡る"),
("闕","けつ","不足"),
("燹","せん","火災"),
("磬","けい","石の楽器"),
("韃","だつ","モンゴルの騎馬民族"),
("鬻","ひさぎ","売る"),
("讒","ざん","中傷"),
("璋","しょう","美しい玉"),
("黽","びん","黒いこと"),
("礽","とう","玉をつらねたかざり"),
("冑","かぶと","戦国時代の兜"),
("羲","ぎ","神名、古代の賢者"),
("竦","すく","縮まる"),
("琰","えん","光を放つ"),
("圮","ひ","崩れる"),
("鞣","なめす","皮をなめす"),
("鴈","がん","カモの一種"),
("黷","どく","穢れ、汚れ"),
("鼇","あおう","亀の一種"),
("懸瓠","けんび","くびき"),
("黔","けん","黒い"),
("穹","きょう","天"),
("懶","らん","怠ける"),
("榻","とう","座布団"),
("瑪瑙","めのう","石の一種"),
("璇","せん","美しい玉"),
("阨","おつ","困難"),
("鬻","ひさぎ","売る"),
("徂徠","ふらい","古代の思想家"),
("纛","とう","軍旗"),
("鶤","けん","鳥の種類"),
("颶風","ぐふう","大風"),
("猗","い$あ","美しい$%"),
("蟄","ちつ","虫が巣にいること"),
("鷰鶹","えんとう","猛禽類、または高飛びする鳥"),
("鯀鯨","こんけい","古代の大魚、または神話的な巨大魚"),
("餛飩","こんとん","中国の料理、またはワンタン"),
("珂碩","かせき","宝石の名前、または美しい石"),
("讖緯","しんい","予言や運命の道筋"),
("翳翳","けいけい","陰気で、または曇った様子"),
("磬音","けいおん","鐘の音、または古代の楽器の音"),
("捭阖","はいこう","軍事的な策略や策略を練ること"),
("瀛洲","えいしゅう","伝説上の楽園または不老不死の地"),
("臯","こう","古代の地名、または神話に登場する人物"),
("觿","き","古代の神殿の装飾、または器物"),
("艸木","そうぼく","植物や木々、または自然全般"),
("鯤鯨","こんけい","神話上の巨大な魚または鯨"),
("鷹揚","おうよう","悠然としていて、優雅である様子"),
("蚩尤","しゆう","中国古代の伝説の悪神"),
("昊天","こうてん","広大な天空、または神々の住まう場所"),
("鬯","ちょう","祭りで使用する香料、または液体"),
("鞴","ふつ","鍛冶屋で使用する炉"),
("瀚海","かんかい","広大な海、または広がる大地"),
("稷","しょく","古代中国での穀物の神"),
("蕭然","しょうぜん","風や音が静かで穏やかな様子"),
("翰林","かんりん","学問の殿堂、または詩文の家"),
("鳴鶴","めいかく","鶴が鳴く、または吉兆を象徴する音"),
("旌旗","せいき","軍旗、または戦の旗"),
("鯀","こん","神話上の人物、または大魚"),
("蠹魚","とぎょ","紙や書物を食べる害虫"),
("蟾蜍","せんちょ","カエルの一種、または伝説的な動物"),
("懿徳","いとく","非常に優れた徳、または理想的な性格"),
("彭湃","ほうはい","波のように激しく打ち寄せること"),
("臻至","しんし","極みに達すること、または至極"),
("夷狄","いてき","野蛮な民族、または異民族"),
("臯舜","こうしゅん","古代中国の賢君、または理想的な王"),
("呂洞賓","りょどうひん","道教の八仙の一人、または不老不死の象徴"),
("蹇蹇","けんけん","歩みが遅く、困難な様子"),
("鴇色","ときいろ","美しい紅色、または鴇の羽の色"),
("鴛鴦","おしどり","夫婦仲の良いこと、またはおしどり"),
("珩璜","こうこう","宝石の一種、またはその輝き"),
("孛星","ぼつせい","彗星、または星が流れ落ちる現象"),
("鄙諺","ひげん","田舎の言い回し、または地方のことわざ"),
("蠹蠍","ときつ","害虫、または人々を害するもの"),
("珮璧","はいへき","美しい玉、またはその装飾"),
("璣玳","けいたい","非常に珍しい宝石、またはその美しさ"),
("臙脂","えんじ","深い赤色、または赤色の染料")
]
