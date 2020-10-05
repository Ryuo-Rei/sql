-- 2-2-1
SELECT
	T1.氏名,
	T1.性別,
	CASE
	WHEN T2.ランク IS NULL THEN 'アシスタント'
	ELSE 肩書
	END AS 肩書
FROM
	スタイリスト T1
JOIN
	ランク T2
ON
	T1.ランク = T2.ランク;

-- 2-2-2
SELECT
	T1.氏名,
	T4.メニュー名,
	T3.メニュー料金
FROM
	スタイリスト T1
JOIN
	ランク T2
ON
	T1.ランク = T2.ランク
JOIN
	料金 T3
ON
	T2.ランク = T3.ランク
JOIN
	メニュー T4
ON
	T3.メニューコード = T4.メニューコード
ORDER BY
	T2.ランク ASC,
	T1.スタイリスト番号 ASC,
	T4.メニュー名 ASC;

-- 2-2-3
SELECT
	T1.予約番号,
	T2.氏名,
	T5.メニュー名,
	T5.所要時間,
	T4.メニュー料金 AS 料金
FROM
	予約 T1
JOIN
	スタイリスト T2
ON
	T1.スタイリスト番号 = T2.スタイリスト番号
JOIN
	ランク T3
ON
	T2.ランク = T3.ランク
JOIN
	料金 T4
ON
	T3.ランク = T4.ランク
JOIN
	メニュー T5
ON
	T4.メニューコード = T5.メニューコード

-- 2-2-4
SELECT
	予約番号,
	氏名,
	SUM(CAST(LTRIM(RTRIM(REPLACE(所要時間, '分', ''))) AS INTEGER)) || '分' AS 合計時間,
	SUM(料金) AS 合計金額
FROM 
	(
		SELECT
			予約番号,
			氏名,
			T5.メニュー名,
			T5.所要時間,
			T4.メニュー料金 AS 料金
		FROM
			予約 T1
		JOIN
			スタイリスト T2
		ON
			T1.スタイリスト番号 = T2.スタイリスト番号
		JOIN
			ランク T3
		ON
			T2.ランク = T3.ランク
		JOIN
			料金 T4
		ON
			T3.ランク = T4.ランク
		JOIN
			メニュー T5
		ON
			T4.メニューコード = T5.メニューコード
	) AS T6
GROUP BY
	予約番号,
	氏名
ORDER BY
	予約番号 ASC;

-- 2-2-5
BEGIN;

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
	'4',
	'2018-10-01 10:03',
	'0006',
	null,
	'2018-10-01',
	'11:30',
	'90分',
	'05',
	13400,
	''
	);

-- 2-2-6
BEGIN;

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
	'4',
	'2018-10-01 10:03',
	'0006',
	null,
	'2018-10-01',
	'11:30',
	'90分',
	'05',
	13400,
	''
	);

ROLLBACK;

BEGIN;

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
	'4',
	'2018-10-01 10:03',
	'0006',
	null,
	'2018-10-01',
	'11:30',
	'90分',
	'05',
	14400,
	''
	);

COMMIT;

-- 2-2-7
SELECT
	T1.予約日,
	T1.スタイリスト番号,
	T2.氏名,
	T1.開始時刻,
	開始時刻 + CAST(CAST(LTRIM(RTRIM(REPLACE(所要時間, '分', ''))) AS INTEGER) || 'minutes' AS interval) AS 終了時刻
FROM
	予約 T1
LEFT JOIN
	スタイリスト T2
ON
	T1.スタイリスト番号 = T2.スタイリスト番号
ORDER BY
	T1.予約日 ASC,
	T1.スタイリスト番号 ASC;

-- 2-2-8
SELECT
	T1.予約日,
	T1.スタイリスト番号,
	T2.氏名,
	EXTRACT(hour from 開始時刻) AS 開始時刻,
	開始時刻 + CAST(CAST(LTRIM(RTRIM(REPLACE(所要時間, '分', ''))) AS INTEGER) || 'minutes' AS interval) AS 終了時刻
FROM
	予約 T1
LEFT JOIN
	スタイリスト T2
ON
	T1.スタイリスト番号 = T2.スタイリスト番号
ORDER BY
	T1.予約日 ASC,
	T1.スタイリスト番号 ASC;

-- 2-2-9
SELECT
	予約日,
	氏名 AS 担当者,
	CASE 
	WHEN 開始時刻 = '10' THEN 終了時刻 
	ELSE ''
	END AS 10時台,
	CASE 
	WHEN 開始時刻 = '11' THEN 終了時刻 
	ELSE ''
	END AS 11時台,
	CASE 
	WHEN 開始時刻 = '12' THEN 終了時刻 
	ELSE ''
	END AS 12時台,
	CASE 
	WHEN 開始時刻 = '13' THEN 終了時刻 
	ELSE ''
	END AS 13時台,
	CASE 
	WHEN 開始時刻 = '14' THEN 終了時刻 
	ELSE ''
	END AS 14時台,
	CASE 
	WHEN 開始時刻 = '15' THEN 終了時刻 
	ELSE ''
	END AS 15時台,
	CASE 
	WHEN 開始時刻 = '16' THEN 終了時刻 
	ELSE ''
	END AS 16時台,
	CASE 
	WHEN 開始時刻 = '17' THEN 終了時刻 
	ELSE ''
	END AS 17時台,
	CASE 
	WHEN 開始時刻 = '18' THEN 終了時刻 
	ELSE ''
	END AS 18時台
FROM
	(SELECT
		T1.予約日,
		T1.スタイリスト番号,
		T2.氏名,
		EXTRACT(hour from 開始時刻) AS 開始時刻,
		開始時刻 + CAST(CAST(LTRIM(RTRIM(REPLACE(所要時間, '分', ''))) AS INTEGER) || 'minutes' AS interval) AS 終了時刻
	FROM
		予約 T1
	LEFT JOIN
		スタイリスト T2
	ON
		T1.スタイリスト番号 = T2.スタイリスト番号
	)
ORDER BY
	予約日,
	スタイリスト番号;

-- 2-2-10
SELECT
	予約日,
	氏名 AS 担当者,
	CASE 
	WHEN 開始時刻 = '10' THEN 終了時刻 
	ELSE ''
	END AS 10時台,
	CASE 
	WHEN 開始時刻 = '11' THEN 終了時刻 
	ELSE ''
	END AS 11時台,
	CASE 
	WHEN 開始時刻 = '12' THEN 終了時刻 
	ELSE ''
	END AS 12時台,
	CASE 
	WHEN 開始時刻 = '13' THEN 終了時刻 
	ELSE ''
	END AS 13時台,
	CASE 
	WHEN 開始時刻 = '14' THEN 終了時刻 
	ELSE ''
	END AS 14時台,
	CASE 
	WHEN 開始時刻 = '15' THEN 終了時刻 
	ELSE ''
	END AS 15時台,
	CASE 
	WHEN 開始時刻 = '16' THEN 終了時刻 
	ELSE ''
	END AS 16時台,
	CASE 
	WHEN 開始時刻 = '17' THEN 終了時刻 
	ELSE ''
	END AS 17時台,
	CASE 
	WHEN 開始時刻 = '18' THEN 終了時刻 
	ELSE ''
	END AS 18時台
FROM
	(SELECT
		T1.予約日,
		T1.スタイリスト番号,
		T2.氏名,
		EXTRACT(hour from 開始時刻) AS 開始時刻,
		開始時刻 + CAST(CAST(LTRIM(RTRIM(REPLACE(所要時間, '分', ''))) AS INTEGER) || 'minutes' AS interval) AS 終了時刻
	FROM
		予約 T1
	LEFT JOIN
		スタイリスト T2
	ON
		T1.スタイリスト番号 = T2.スタイリスト番号
	)
GROUP BY 
	予約日, 
	スタイリスト番号, 
	氏名
ORDER BY
	予約日,
	スタイリスト番号;