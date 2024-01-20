SELECT
  a,
  c
FROM (
  SELECT 
    a, 
    b 
  FROM x
) AS x
JOIN (
  SELECT 
    b, 
    c 
  FROM y
) AS y
  ON x.b = y.b
