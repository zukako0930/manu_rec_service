# MySQLの動かし方
他の環境に持って行くとユーザー名の違いから権限がなく、
```
$ rails db:create:all
```
が通らないのでMySQLにユーザを作成する必要がある。
作業ユーザーはdevelopment、test、productionの３つ必要になります。（
developmentとproductionは同じユーザーでも設定上は大丈夫ですが、本番環境も見据えてproductionも独自のものを用意するといいでしょう。testは他のユーザーと同じにするとエラーが出ます）

```
mysql> create user [ユーザー名１] identified by 'パスワード１',
[ユーザー名２] identified by 'パスワード２',
[ユーザー名３] identified by 'パスワード３';
```
作成したユーザの確認
```
mysql> select User,Host from mysql.user;
```
以下コマンドで権限を与える。
```
mysql> grant all on *.* to '[ユーザー名]'@'localhost'
```