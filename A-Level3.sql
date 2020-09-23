-- 24
SELECT
	*
FROM
	口座
ORDER BY
	口座番号 ASC;

-- 25
SELECT DISTINCT
	名義
FROM
	口座
ORDER BY
	名義 ASC;

-- 26
SELECT
	*
FROM
	口座
ORDER BY
	4 DESC,
	1 ASC;

-- 27
SELECT
	*
FROM
	口座
ORDER BY
	更新日 ASC 
LIMIT
	10
WHERE
	更新日 IS NOT NULL;

-- 28
SELECT
	更新日,
	残高
FROM 
	口座
ORDER BY			
	残高 ASC,
	更新日 DESC
OFFSET 9 ROWS
FETCH NEXT 10 ROWS ONLY;

-- 29
SELECT
	口座番号
FROM
	口座

UNION
SELECT
	口座番号
FROM
	廃止口座
ORDER BY
	口座番号 ASC;

-- 30
SELECT DISTINCT
	名義
FROM
	口座
EXCEPT
SELECT DISTINCT
	名義
FROM
	廃止口座
ORDER BY
	名義 DESC;

-- 31
SELECT
	名義
FROM
	口座
INTERSECT
SELECT
	名義
FROM
	廃止口座
ORDER BY
	名義 ASC;

-- 32
SELECT
	口座番号,
	残高
FROM
	口座
WHERE
	残高 <> 0
UNION
SELECT
	口座番号,
FROM
	廃止口座
WHERE
	解約時残高 <> 0
ORDER BY
	口座番号 ASC;

-- 33
SELECT
	口座番号,
	残高,
	〇 AS 状況
FROM
	口座
UNION
SELECT
	口座番号,
	残高,
	× AS 状況
FROM
	廃止口座
ORDER BY
	名義 ASC;



	