# LessonProject 課題集

## 目的

- 課題を通じて、UIKitの仕組みを知る
    - UIKitの基礎にして奥義を学ぶ。これを理解できればiOSアプリ開発の４割は応用して考えることができる。なおデザイナーが提案してきたデザインに対しても、どうやってUIを実現したら良いのか？を考える大きな助けにもなる。
        - UITableViewについて知る
            - ペイジング処理 ／ 情報再取得
            - Cellの再利用性について知る
        - UICollectionViewについて知る
            - ペイジング処理 ／ 情報再取得
            - Cellの再利用性について知る
            - 近年、モダンCollectionViewなる考え方（例、ブックアプリ等）もあって、需要は高まっている。
        - TabControllerの使い方を学ぶ
            - 割とUIで使用するケースが多いので。
        - Storyboard ／ Xibについて知る
            - 慣れれば、簡単。
            - Autolayoutについて知る
        - Protocolを学ぶ
        - Enumを学ぶ
        - Structを学ぶ
    - 通信モジュールについて知る
        - サンプルAPI
            - https://webservice.recruit.co.jp/doc/hotpepper/reference.html を使用
                - API登録を行う。
                - 6e933c6b4a0b50e7
                    - 江上のほうで取得しているAPIKeyをつかってもOK。

## 課題に臨むにあたっての心構え

- どんなものを参考にしてもいいので、「課題のゴール」だけに集中。
- どんなコードを書いてもいいです。こう書かなくていけないのでは？とかは考えなくていいです。自由です！
- 無理はしないこともしくはところどころ休みながらやること。
    - 課題やってるとだいぶ疲れることがあるので疲れたなと思ったら休むもしくはちゃんとよく寝ることを心がけてください。
    - 新しいことを勉強することに対してはそういう心がけたほうがいいかなと思います。

---

## HTTP通信をやってみよう！

### 課題１：基本的な通信処理

iOSSDKを使って通信モジュールを作ってみる。

**注）** 既存ライブラリだけを使うこと。

**課題のゴール：**
通信処理で、responseCode=200を取得すること

**補足事項**
- format = JSON 形式で取得
- URLの入力フォームは不要。一旦、ブラウザ上でJSONを取得できたURLでGetリクエスト行う
- プログラムの書き方は任意に任せる。
    - AppDelegateのdidFinishLaunchingWithOptions で実行してもOK。
        - 実行できるところであればどこでも実行してOK。ViewControllerのViewDidLoadに書いてもOK
    - didFinishLaunchingWithOptionsに、通信モジュールの処理を直接書いてもOK
    - うまく書こうとしなくてOK。
    - responseCode = 200 が取得できることを、コンソール上でも良いので確認すること。

### 課題２：JSONデータの取得

課題１の通信の結果から得られる、データ（Json）を文字列で出力してみよう

- responseCode = 200の状態の、データを文字列にて出力してみる

### 課題３：UserDefaultsへの保存

課題２で、得られた文字列をUserDefaultsに格納してみよう！

### 課題４：UserDefaultsからの取得

課題３で保存した、UserDefaultsからJson文字列を取得して、再度、表示してみよう！

### 課題５：JSONのDictionary変換

課題４で取得した文字列を、DecodeしてDictionary型に変換してみよう。

- 変換したDictionaryから１店舗、お店の情報を取得してみよう

### 課題６：画像URLの取得

課題５のお店の情報から、お店のロゴの画像URLを取得してコンソールなどで出力してみよう。

### 課題７：画像の通信取得

課題６で取得したURLを元に、画像を取得する通信処理を作ってみよう。

### 課題８：画像の保存

課題７で取得した画像を、アプリに保存してみよう。

**保存領域について：**
- **Document領域** ・・・　ユーザのデータを格納するのに適している領域
- **Temp領域** ・・・　一時的に使うファイルを保存
- **Library領域**
    - ルート（/ ）・・・　ルート
    - Cache ・・・　キャッシュ領域　／　自動削除されてもいいファイル

一時的なファイルについてはTemp領域に置くことが多いです。Library領域はiOS自体の保存領域が逼迫している場合などに、iOSが削除する領域です。

Document領域は最も保存に適しており、アプリが削除されない限りは情報は消えません。Temp領域との違いとして、iPhoneを機種変更した際、Document領域に保存した内容は引き継がれます。

**今回は、Temp領域に保存してみましょう。**

### 課題９：保存画像の取得

課題８で保存した画像を、再度、取得してみよう。

### 課題１０：画像の表示

ViewControllerで、課題9で取得した画像を表示してみよう。
- ロジックもUIViewController内に記載してよし。
- 元々、View + Controller という意味であり、ロジックを書いてはいけないということはない。
- レイアウト／表示方法は任意

### 課題１１：店舗名の表示

課題５で取得したお店の情報から、お店の名前を取得。課題１０で作ったViewControllerに配置してみよう
- 使用するオブジェクトでは、UILabelを使用してください。
- レイアウト／表示方法は任意

### 課題１２：Codableモデルの作成

課題５に立ち返り。DictionaryでDecodeしていた情報をDecodable / Codableを継承したモデル（構造体／クラス）に置き換えてみよう。
- モデルについては、レスポンスに対して自動変換かけて作成して構いません。
- **Codableについて**
    - https://qiita.com/shiz/items/f37b489e9f41678932f0

### 課題１３：Codableモデルの保存

課題１２で作成した、Codableを継承したモデルクラスの内容をUserDefaultsに保存してみましょう。

### 課題１４：Codableモデルの復元

課題１３でUserDefaultsに保存したエンコード内容を、Codableで継承したモデルクラスに再度、デコードしてみましょう

### 課題１５：エラー処理の実装

課題１、課題２でAPI の処理を実装しました。少しAPIのパラメータをいじってあげてエラーになるように修正してみましょう
- **例）**
    - https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=sample&large_area=Z0111

### 課題１６：エラー情報の表示

課題１５で取得したエラー情報を、Status_Codeとメッセージをコンソール上に表示してみましょう。
- StatusCode = 200 でありながら、サーバからエラーが返ってくるケースを想定

### 課題１７：AlertViewControllerでのエラー表示

課題１６の内容を、AlertViewControllerをつかって画面上に出してみましょう。

### 課題１８：条件分岐の実装

課題１５ー１７で、パラメータエラーがあった場合と、そうでない場合とを出し分けてみましょう。
- 正常な場合、お店と、お店の写真が表示
- エラーが返ってきた場合、アラートメッセージを表示
- **ヒント：**
    - モデルの型を判定することが可能だと思われます。
    - 受信した文字列の中にErrorが入っているかどうかを確認してみる、等

### 課題１９：タイムアウト処理

課題１、２、１５−１８の応用で、Wifiをオフにした時の通信結果（タイムアウト）をハンドリングできるようにしてみましょう。
- また、タイムアウトの時間を短く設定してみましょう。

### 課題２０：HTTPエラーハンドリング

課題１９でハンドリングした、StatusCode = 200〜399 以外のHTTPに関するエラーをハンドリングしてみよう

### 課題２１：HTTPエラーの表示

課題２０でハンドリングしたエラーをAlertViewControllerで表示してみよう。

### 課題２２：ViewControllerの名前変更

課題10 で作ったViewControllerの内容を、DetailViewControllerという名前に変えてみましょう
- ビルドだけ通ればよし。
- 次の課題で、新しいUIViewControllerを作ります。

### 課題２３：新規ViewControllerの作成

新規にUIViewControllerを作成し、アプリが起動したら、新しいUIViewControllerが開くように修正してみましょう
- なお、UIViewControllerクラス、Storyboardを作成してください

### 課題２４：通信モジュールの移植

課題２３で作成したUIViewController（便宜上、新規TableVCと呼びます）に、課題１〜で追加した通信モジュールを実装してみましょう（コピペでOK）

### 課題２５：viewDidLoadでの通信実行

新規TableVCのviewDidLoad に課題２４で実装した通信モジュールを呼び出せるようにしましょう。

### 課題２６：UITableViewの追加

新規TableVCにUITableViewを追加してみよう。
- Storyboard上で、画面いっぱいに配置しましょう
- UITableViewのUITableViewDelegateと、UITableViewDataSourceDelegateを新規TableVCに付与してみましょう

**※これから、UITableViewに通信で取得したお店の情報をUITableViewを使って配置していきます**

### 課題２７：（未完成）

UITableViewを配置できたら、（内容は続きを記載予定）

---

## 将来の課題

### 課題XX：Alamofireの導入

「ライブラリを使用しないこと」を前提にしていますが、AlamofireをSPMにて導入してみましょう。Alamofireは通信モジュールとしては非常に優秀なライブラリで、実にSwiftらしい内容にまとまっています。

- Alamofireで、StatusCode = 200だけれども、エラーにしなければならない場合に、エラーになるように修正してみる
    - Validationクラスを作る。

### 課題XX：Alamofireへの置き換え

課題１の内容を、Alamofireに置き換えてみましょう。

### 課題XX：ナビゲーションとモーダル

- NavigationControllerを使ってみましょう
- modalPresentを使ってみましょう
    - MainViewにだして半透明にして表示してみましょう
