# The-View
 景色の写真投稿サイトです。<br >
 旅行先の景色や好きな景色を位置情報付きで共有できます。 <br >
 レスポンシブ対応しているのでスマホからもご確認いただけます。
 <img width="1400" alt="スクリーンショット 2020-05-07 0 06 18" src="https://user-images.githubusercontent.com/60876388/81193748-c51d9b00-8ff6-11ea-9981-46789f016300.png">
 <img width="350" height="700" src= "https://user-images.githubusercontent.com/60876388/81476543-643bd000-924d-11ea-9d26-cac305ca9f91.jpeg">

# URL
http://the-view.work/ <br >
画面中部のゲストログインボタンから、メールアドレスとパスワードを入力せずにログインできます。

# 使用技術
- Ruby 2.5.7
- Ruby on Rails 5.2.4
- MySQL 5.7
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - RDS
  - Route53
- Docker/Docker-compose
- CircleCi CI/CD
- Capistrano3
- RSpec
- Google Maps API

# AWS構成図
<img width="995" alt="スクリーンショット 2020-05-07 11 14 01" src="https://user-images.githubusercontent.com/60876388/81247155-3ccde300-9054-11ea-91eb-d06eb38a63b3.png">

## CircleCi CI/CD
- Githubへのpush時に、RspecとRubocopが自動で実行されます。
- masterブランチへのpushでは、EC2への自動デプロイが実行されます

# 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
  - 画像投稿(refile)
  - 位置情報検索機能(geocoder)
- いいね機能(Ajax)
  - ランキング機能
- コメント機能(Ajax)
- フォロー機能(Ajax)
- ページネーション機能(kaminari)
  - 無限スクロール(Ajax)
- 検索機能(ransack)

# テスト
- RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(feature)