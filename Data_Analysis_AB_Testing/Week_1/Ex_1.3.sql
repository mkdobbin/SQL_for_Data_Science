select
  event_id,
  event_time,
  user_id,
  platform,
  MAX(CASE WHEN parameter_name = 'item_id'
        THEN CAST(parameter_value as INT)
        ELSE NULL
        END) as item_id,
  MAX(CASE WHEN parameter_name = 'referrer'
        THEN parameter_value
        ELSE NULL
        END) AS referrer
from
  dsv1069.events
WHERE
  event_name = 'view_item'
GROUP BY
  event_id,
  event_time,
  user_id,
  platform
