# Hiraganalize
入力された文章をひらがな化するiOSアプリ

## 使用にあたって
- goo lab のひらがな化APIを使用しています
	- [goo lab:ひらがな化API](https://labs.goo.ne.jp/api/jp/hiragana-translation/)
- goo lab でアプリケーションIDを取得し下記に設定してください
	```swift
	// Hiraganalizer.swift
	class Hiraganalizer {
    	static private let AppID: String = "アプリケーションID"	// ここに設定
	```

## 開発・動作確認環境

| 項目       |  状態          |
| ----      | ----           |
| OS        |  macOS 10.15.3 |
| IDE       |  Xcode 11.3.1  |
| 言語  		|  Swift 5.1.3   |