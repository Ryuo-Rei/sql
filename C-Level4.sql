-- 33
SELECT
	名称 AS なまえ,
	HP AS 現在のHP,
	CASE
	WHEN 職業コード IN('11', '21') THEN HP + 50
	ELSE HP
	END AS 装備後のHP
FROM
	パーティー;

-- 34
UPDATE
	パーティー
SET
	MP = MP + 20
WHERE
	ID IN('A01', 'A03');

-- 35
SELECT
	名称 AS なまえ,
	HP AS 現在のHP,
	HP * 2 AS 予想されるダメージ
FROM
	パーティー;
WHERE
	職業コード = '11';

-- 36
SELECT
	名称 AS なまえ,
	HP || '/' || MP AS HPとMP,
	CASE 状態コード
	WHEN '00' THEN ''
	WHEN '01' THEN '眠り'
	WHEN '02' THEN '毒'
	WHEN '03' THEN '沈黙'
	WHEN '04' THEN '混乱'
	WHEN '09' THEN '気絶'
	END AS ステータス
FROM
	パーティー;

-- 37
SELECT
	イベント番号,
	イベント名称,
	CASE タイプ
	WHEN '1' THEN '強制'
	WHEN '2' THEN 'フリー'
	WHEN '3' THEN '特殊'
	END AS タイプ,
	CASE イベント番号
	WHEN BETWEEN 1 AND 10 THEN '序盤'
	WHEN BETWEEN 11 AND 17 THEN '中盤'
	ELSE '終盤'
	END AS 発生時期,
FROM
	イベント;

-- 38
SELECT
	名称 AS なまえ,
	HP AS 現在のHP,
	LENGTH(名称) * 10 AS 予想ダメージ
FROM
	パーティー;

-- 39
UPDATE
	パーティー
SET
	状態コード = '04'
WHERE
	HP % 4 = 0
OR
	MP % 4 = 0;

-- 40
SELECT
	TRUNC(777 * 0.7, 0) AS 支払った金額;

-- 41
UPDATE
	パーティー
SET
	HP = TRUNC(HP * 1.3),
	MP = TRUNC(MP * 1.3);

-- 42
SELECT
	名称 AS なまえ,
	HP,
	POWER(HP, 0) AS 攻撃1回目,
	POWER(HP, 1) AS 攻撃2回目,
	POWER(HP, 2) AS 攻撃3回目
FROM
	パーティー
WHERE
	職業コード = '10';

-- 43
SELECT
	名称 AS なまえ,
	HP,
	状態コード,
	CASE
	WHEN HP <= 50 THEN 3 + CAST(状態コード AS INTEGER)
	WHEN HP BETWEEN 51 AND 100 THEN 2 + CAST(状態コード AS INTEGER)
	WHEN HP BETWEEN 101 AND 150 THEN 1 + CAST(状態コード AS INTEGER)
	ELSE 0 + CAST(状態コード AS INTEGER)
	END AS リスク値
FROM
	パーティー
ORDER BY
	リスク値 DESC,
	HP ASC;

-- 44
SELECT DISTINCT
	CASE
	WHEN 前提イベント番号 IS NULL 前提なし
	ELSE 前提イベント番号
	END AS 前提イベント番号,
	イベント番号,
	CASE
	WHEN 後続イベント番号 IS NULL 後続なし
	ELSE 後続イベント番号
	END AS 後続イベント番号
FROM
	イベント;