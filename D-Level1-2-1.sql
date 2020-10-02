-- 2-1
CREATE TABLE
	会員 
		(
		会員番号 CHAR(4) PRIMARY KEY,
		氏名 VARCHAR(20) NOT NULL,
		電話番号 CHAR(11),
		メールアドレス VARCHAR(100),
		入会日 DATE
		);

CREATE TABLE
	ランク
		(
		ランク CHAR(1) PRIMARY KEY,
		肩書 VARCHAR(20)
		);

CREATE TABLE
	メニュー
		(
		メニューコード CHAR(7) PRIMARY KEY,
		メニュー名 VARCHAR(20) NOT NULL,
		所要時間 CHAR(5)
		);

CREATE TABLE
	スタイリスト
		(
		スタイリスト番号 CHAR(4) PRIMARY KEY,
		氏名 VARCHAR(20),
		性別 CHAR(2) ,
		入社日 DATE,
		ランク CHAR(1) NOT NULL REFERENCES ランク(ランク)
		);

CREATE TABLE
	予約
		(
		予約番号 CHAR(4) PRIMARY KEY,
		受付日時 DATE,
		会員番号 CHAR(4) NOT NULL REFERENCES 会員(会員番号),
		初回 DATE,
		予約日 DATE NOT NULL,
		開始時刻 TIME NOT NULL,
		所要時間 VARCHAR(5),
		スタイリスト番号 CHAR(4) NOT NULL REFERENCES スタイリスト(スタイリスト番号),
		合計金額 INTEGER,
		備考 VARCHAR(100)
		);

CREATE TABLE
	料金
		(
		メニューコード CHAR(7) NOT NULL REFERENCES メニュー(メニューコード),
		ランク CHAR(1) NOT NULL REFERENCES ランク(ランク),
		メニュー料金 INTEGER,
		PRIMARY KEY(メニューコード, ランク)
		);

CREATE TABLE
	予約状況
		(
		予約番号 CHAR(4) NOT NULL REFERENCES 予約(予約番号),
		メニューコード CHAR(7) NOT NULL REFERENCES メニュー(メニューコード),
		PRIMARY KEY(予約番号, メニューコード)
		);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0001',
	'吉田康子',
	0901112215,
	'yoshida@a1.com',
	'2000-04-10'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0002',
	'荒木和子',
	'0901112216',
	'araki@a2.com',
	'2012-08-11'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0003',
	'下田正一',
	'0901112217',
	'shimoda@a3.com',
	'2013-04-12'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0004',
	'風間由津子',
	'0901112218',
	'',
	'2013-06-13'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0005',
	'秋山美奈',
	'0901112219',
	'akiyama@a5.com',
	'2015-01-14'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0006',
	'木下博之',
	'0901112220',
	'kinoshita@a6.com',
	'2015-04-15'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0007',
	'広瀬 正隆',
	'',
	'',
	'2016-09-16'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0008',
	'斎藤美紀',
	'0901112222',
	'saitou@a8.com',
	'2018-04-17'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'A',
	'チーフスタイリスト'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'B',
	'トップスタイリスト'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'C',
	'スタイリスト'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'',
	NULL
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'C',
	'カット',
	'30分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'P',
	'パーマ',
	'60分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'R',
	'カラー',
	'60分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'T',
	'トリートメント',
	'30分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'C、R',
	'カット＆カラー',
	'90分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'C、P、R',
	'カット＆パーマ＆カラー',
	'150分'
	)

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'01',
	'秋葉ちか',
	'女性',
	'1998-04-01',
	'A'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'02',
	'佐藤茜',
	'女性',
	'2000-06-01',
	'B'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'03',
	'井上博之',
	'男性',
	'2003-01-08',
	'B'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'04',
	'小島正',
	'男性',
	'2010-05-02',
	'C'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'05',
	'山田雄介',
	'男性',
	'2015-04-01',
	'C'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'06',
	'市川紀子',
	'女性',
	'2018-06-10',
	''
	);

INSERT INTO
	予約
		(
		予約番号,
		受付日時,
		会員番号,
		初回,
		予約日,
		開始時刻,
		所要時間,
		スタイリスト番号,
		合計金額,
		備考
		)
VALUES
	(
	'1',
	'2018-09-06 16:28',
	'0002',
	null,
	'2018-10-01',
	'17:00',
	'90分',
	'01',
	21600,
	''
	);

INSERT INTO
	予約
		(
		予約番号,
		受付日時,
		会員番号,
		初回,
		予約日,
		開始時刻,
		所要時間,
		スタイリスト番号,
		合計金額,
		備考
		)
VALUES
	(
	'2',
	'2018-09-26 12:42',
	'0004',
	null,
	'2018-10-01',
	'10:00',
	'30分',
	'03',
	10000,
	''
	);

INSERT INTO
	予約
		(
		予約番号,
		受付日時,
		会員番号,
		初回,
		予約日,
		開始時刻,
		所要時間,
		スタイリスト番号,
		合計金額,
		備考
		)
VALUES
	(
	'3',
	'2018-09-30 10:30',
	'0008',
	null,
	'2018-10-01',
	'15:00',
	'150分',
	'05',
	26400,
	''
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'C',
	'A',
	12000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'C',
	'B',
	10000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'C',
	'C',
	8000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'P',
	'A',
	18000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'P',
	'B',
	15000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'P',
	'C',
	12000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'R',
	'A',
	9600
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'R',
	'B',
	8000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'R',
	'C',
	6400
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'T',
	'A',
	14400
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'T',
	'B',
	12000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'T',
	'C',
	9600
	);

INSERT INTO
	予約状況
		(
		予約番号,
		メニューコード
		)
VALUES
	(
	'1',
	'C、R'
	);

INSERT INTO
	予約状況
		(
		予約番号,
		メニューコード
		)
VALUES
	(
	'2',
	'C'
	);
-- 2-1
CREATE TABLE
	会員 
		(
		会員番号 CHAR(4) PRIMARY KEY,
		氏名 VARCHAR(20) NOT NULL,
		電話番号 CHAR(11),
		メールアドレス VARCHAR(100),
		入会日 DATE
		);

CREATE TABLE
	ランク
		(
		ランク CHAR(1) PRIMARY KEY,
		肩書 VARCHAR(20)
		);

CREATE TABLE
	メニュー
		(
		メニューコード CHAR(7) PRIMARY KEY,
		メニュー名 VARCHAR(20) NOT NULL,
		所要時間 CHAR(5)
		);

CREATE TABLE
	スタイリスト
		(
		スタイリスト番号 CHAR(4) PRIMARY KEY,
		氏名 VARCHAR(20),
		性別 CHAR(2) ,
		入社日 DATE,
		ランク CHAR(1) NOT NULL REFERENCES ランク(ランク)
		);

CREATE TABLE
	予約
		(
		予約番号 CHAR(4) PRIMARY KEY,
		受付日時 DATE,
		会員番号 CHAR(4) NOT NULL REFERENCES 会員(会員番号),
		初回 DATE,
		予約日 DATE NOT NULL,
		開始時刻 TIME NOT NULL,
		所要時間 VARCHAR(5),
		スタイリスト番号 CHAR(4) NOT NULL REFERENCES スタイリスト(スタイリスト番号),
		合計金額 INTEGER,
		備考 VARCHAR(100)
		);

CREATE TABLE
	料金
		(
		メニューコード CHAR(7) NOT NULL REFERENCES メニュー(メニューコード),
		ランク CHAR(1) NOT NULL REFERENCES ランク(ランク),
		メニュー料金 INTEGER,
		PRIMARY KEY(メニューコード, ランク)
		);

CREATE TABLE
	予約状況
		(
		予約番号 CHAR(4) NOT NULL REFERENCES 予約(予約番号),
		メニューコード CHAR(7) NOT NULL REFERENCES メニュー(メニューコード),
		PRIMARY KEY(予約番号, メニューコード)
		);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0001',
	'吉田康子',
	0901112215,
	'yoshida@a1.com',
	'2000-04-10'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0002',
	'荒木和子',
	'0901112216',
	'araki@a2.com',
	'2012-08-11'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0003',
	'下田正一',
	'0901112217',
	'shimoda@a3.com',
	'2013-04-12'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0004',
	'風間由津子',
	'0901112218',
	'',
	'2013-06-13'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0005',
	'秋山美奈',
	'0901112219',
	'akiyama@a5.com',
	'2015-01-14'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0006',
	'木下博之',
	'0901112220',
	'kinoshita@a6.com',
	'2015-04-15'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0007',
	'広瀬 正隆',
	'',
	'',
	'2016-09-16'
	);

INSERT INTO
	会員 
		(
		会員番号,
		氏名,
		電話番号,
		メールアドレス,
		入会日
		)
VALUES
	(
	'0008',
	'斎藤美紀',
	'0901112222',
	'saitou@a8.com',
	'2018-04-17'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'A',
	'チーフスタイリスト'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'B',
	'トップスタイリスト'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'C',
	'スタイリスト'
	);

INSERT INTO
	ランク 
		(
		ランク,
		肩書
		)
VALUES
	(
	'',
	NULL
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'C',
	'カット',
	'30分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'P',
	'パーマ',
	'60分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'R',
	'カラー',
	'60分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'T',
	'トリートメント',
	'30分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'C、R',
	'カット＆カラー',
	'90分'
	);

INSERT INTO
	メニュー
		(
		メニューコード,
		メニュー名,
		所要時間
		)
VALUES
	(
	'C、P、R',
	'カット＆パーマ＆カラー',
	'150分'
	)

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'01',
	'秋葉ちか',
	'女性',
	'1998-04-01',
	'A'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'02',
	'佐藤茜',
	'女性',
	'2000-06-01',
	'B'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'03',
	'井上博之',
	'男性',
	'2003-01-08',
	'B'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'04',
	'小島正',
	'男性',
	'2010-05-02',
	'C'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'05',
	'山田雄介',
	'男性',
	'2015-04-01',
	'C'
	);

INSERT INTO
	スタイリスト
		(
		スタイリスト番号,
		氏名,
		性別,
		入社日,
		ランク
		)
VALUES
	(
	'06',
	'市川紀子',
	'女性',
	'2018-06-10',
	''
	);

INSERT INTO
	予約
		(
		予約番号,
		受付日時,
		会員番号,
		初回,
		予約日,
		開始時刻,
		所要時間,
		スタイリスト番号,
		合計金額,
		備考
		)
VALUES
	(
	'1',
	'2018-09-06 16:28',
	'0002',
	null,
	'2018-10-01',
	'17:00',
	'90分',
	'01',
	21600,
	''
	);

INSERT INTO
	予約
		(
		予約番号,
		受付日時,
		会員番号,
		初回,
		予約日,
		開始時刻,
		所要時間,
		スタイリスト番号,
		合計金額,
		備考
		)
VALUES
	(
	'2',
	'2018-09-26 12:42',
	'0004',
	null,
	'2018-10-01',
	'10:00',
	'30分',
	'03',
	10000,
	''
	);

INSERT INTO
	予約
		(
		予約番号,
		受付日時,
		会員番号,
		初回,
		予約日,
		開始時刻,
		所要時間,
		スタイリスト番号,
		合計金額,
		備考
		)
VALUES
	(
	'3',
	'2018-09-30 10:30',
	'0008',
	null,
	'2018-10-01',
	'15:00',
	'150分',
	'05',
	26400,
	''
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'C',
	'A',
	12000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'C',
	'B',
	10000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'C',
	'C',
	8000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'P',
	'A',
	18000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'P',
	'B',
	15000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'P',
	'C',
	12000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'R',
	'A',
	9600
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'R',
	'B',
	8000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'R',
	'C',
	6400
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'T',
	'A',
	14400
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'T',
	'B',
	12000
	);

INSERT INTO
	料金
		(
		メニューコード,
		ランク,
		メニュー料金
		)
VALUES
	(
	'T',
	'C',
	9600
	);

INSERT INTO
	予約状況
		(
		予約番号,
		メニューコード
		)
VALUES
	(
	'1',
	'C、R'
	);

INSERT INTO
	予約状況
		(
		予約番号,
		メニューコード
		)
VALUES
	(
	'2',
	'C'
	);

INSERT INTO
	予約状況
		(
		予約番号,
		メニューコード
		)
VALUES
	(
	'3',
	'C、P、R'
	);

INSERT INTO
	予約状況
		(
		予約番号,
		メニューコード
		)
VALUES
	(
	'3',
	'C、P、R'
	);
