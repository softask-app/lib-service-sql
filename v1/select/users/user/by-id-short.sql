SELECT
  user_id,
  display_name
FROM
  users."user"
WHERE
  user_id = ?
;
