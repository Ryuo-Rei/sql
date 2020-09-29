-- 62
SELECT
	T1.ルート番号,
	T1.イベント番号,
	T2.イベント名称,
	T1.クリア結果
FROM
	(
	SELECT
		ルート番号,
		イベント番号,
		クリア結果
	FROM
		経験イベント
	WHERE
		クリア区分 = '1'	
	) AS T1
JOIN
	イベント T2
ON
	T1.イベント番号 = T2.イベント番号;

-- 63
SELECT
	T2.イベント番号,
	T1.イベント名称,
	T2.クリア区分
FROM
	(
	SELECT
		イベント番号,
		イベント名称
	FROM
		イベント
	WHERE
		タイプ = '1'
	) AS T1
JOIN
	経験イベント T2
ON
	T1.イベント番号 = T2.イベント番号;

-- 64
SELECT
	T2.イベント番号,
	T1.イベント名称,
	T2.クリア区分
FROM
	(
	SELECT
		イベント番号,
		イベント名称
	FROM
		イベント
	WHERE
		タイプ = '1'
	) AS T1
JOIN
	(
	SELECT
		イベント番号,
		CASE
		WHEN クリア区分 = '0' THEN '未クリア'
		END AS クリア区分
	FROM
		経験イベント
	) AS T2
ON
	T1.イベント番号 = T2.イベント番号;

-- 65
SELECT
	T1.ID,
	T1.なまえ,
	T2.職業,
	T2.状態
FROM
	パーティー T1
JOIN
	(
	SELECT
		CASE
		WHEN コード種別 = 1 AND コード値 = '01' THEN '勇者'
		WHEN コード種別 = 1 AND コード値 = '10' THEN '戦士'
		WHEN コード種別 = 1 AND コード値 = '11' THEN '武道家'
		WHEN コード種別 = 1 AND コード値 = '20' THEN '魔王使い'
		WHEN コード種別 = 1 AND コード値 = '21' THEN '学者'
		END AS 職業,
		CASE
		WHEN コード種別 = 2 AND コード値 = '00' THEN '異常なし'
		WHEN コード種別 = 2 AND コード値 = '01' THEN '眠り'
		WHEN コード種別 = 2 AND コード値 = '02' THEN '毒'
		WHEN コード種別 = 2 AND コード値 = '03' THEN '沈黙'
		WHEN コード種別 = 2 AND コード値 = '04' THEN '混乱'
		WHEN コード種別 = 2 AND コード値 = '09' THEN '気絶'
		END AS 状態
	FROM
		コード
	) AS T2
ON
	T1.職業コード = T2.コード値
OR
	T1.状態コード = T2.コード値;

-- 66
SELECT
	ID,
	名称 AS なまえ,
	職業
FROM
	(
	SELECT
		ID,
		名称 AS なまえ,
		職業コード
	FROM
		パーティー
	WHERE EXISTS 
			(
			SELECT
				1
			FROM
				パーティー
			WHERE
				職業
			)
	)



