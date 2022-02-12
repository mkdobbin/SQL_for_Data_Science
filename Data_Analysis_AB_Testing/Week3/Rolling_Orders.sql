SELECT
  dates_rollup.date,
  COALESCE(SUM(orders), 0) AS orders,
  COALESCE(SUM(items_ordered), 0 ) as items_ordered
FROM
  dsv1069.dates_rollup
LEFT OUTER JOIN
  (
  SELECT
    date(paid_at) AS day,
    COUNT(DISTINCT invoice_id) AS orders,
    COUNT(DISTINCT line_item_id) AS items_ordered
  FROM
    dsv1069.orders
  GROUP BY
    date(paid_at)
  ) daily_orders
ON
  daily_orders.day = dates_rollup.date
GROUP BY
  dates_rollup.date


--Part 2
SELECT
  dates_rollup.date,
  COALESCE(SUM(orders), 0) AS orders,
  COALESCE(SUM(items_ordered), 0 ) as items_ordered
FROM
  dsv1069.dates_rollup
LEFT OUTER JOIN
  (
  SELECT
    date(paid_at) AS day,
    COUNT(DISTINCT invoice_id) AS orders,
    COUNT(DISTINCT line_item_id) AS items_ordered
  FROM
    dsv1069.orders
  GROUP BY
    date(paid_at)
  ) daily_orders
ON
  dates_rollup.date >= daily_orders.day
  AND
  dates_rollup.d7_ago < daily_orders.day
GROUP BY
  dates_rollup.date
