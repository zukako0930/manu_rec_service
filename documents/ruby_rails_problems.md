### MySQLとrailsの橋渡し
アプリ作成時にMySQLを選択。
```
$ rails new bbs -d mysql
```
scaffoldでモデルを生成。
```
$ rails g scaffold User name:string
```
このモデルを元に、
```
$ rails db:migrate
```
をしたいところだが、MySQLの場合は自動でdatabaseやtableを生成してくれないので手動でやる必要がある。
常軌を実行すると、
```
Access denied for user 'root'@'localhost' 
```
のようにエラーを吐く。
そこでMySQLに入って、
```
mysql> create database bbs_dev;
Query OK, 1 row affected (0.00 sec)
 
mysql> GRANT ALL PRIVILEGES ON bbs_dev.* TO testuser@localhost IDENTIFIED BY 'testpassword' WITH GRANT OPTION;
```
のようにしてDBの作成とそれに対する権限を与える必要がある。
`config/database.yml`の中身を編集して今権限を与えたユーザに変更。
```
development:
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: testuser
  password: testpassword
  socket: /tmp/mysql.sock
  database: bbs_dev
```
その後で
```
$ rails db:migrate
```
でモデルに合わせたテーブルを生成。
そのテーブルに以下のようにしてcsvを読み込ませる。

#### 追記(ディップのサーバ)
`database.yml`のユーザを`root`にすれば、
`rails db:create:all`で上手く行くらしい(パスワードは空で)。
sockエラーの場合はその設定をコメントアウトで良いっぽい。

#### データベースの設定変更
デフォルトだとVARCHAR(255)になっているので、
```
mysql> alter table テーブル名 modify 変数名 varchar(2000);
```
2000とかに増やす。


### MySQLへのcsvデータの読み込み
```
$ mysql --local-infile=1
```
MySQLを起動。
```
mysql> set character_set_database=sjis;
Query OK, 0 rows affected (0.00 sec)

mysql> LOAD DATA LOCAL INFILE './KEN_ALL.CSV' INTO TABLE zipcode FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
Query OK, 123948 rows affected (1.97 sec)
Records: 123948  Deleted: 0  Skipped: 0  Warnings: 0
```

読み込みに失敗した場合は、
```
$ rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1 
```
でテーブルの構造(設定)を保ったままデータだけを空にできる。

- ハマった点
上記のようにしたところ、`Records:1`になり１件しか読み込んでくれなかった。
調べたところ`\r\n`が悪さをしているらしい。Pandas.to_csvのline_terminaterは`\n`だったため、`\n`にしないといけないらしい。