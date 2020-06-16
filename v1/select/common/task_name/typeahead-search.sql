-- Performs a search for tags based on the tag name matching
-- the given pattern.
--
-- Results are ordered by global frequency of use for the
-- tags in descending order, then by tag name in ascending
-- order.
--
-- Eventually the "hits" value should be a materialized view
-- that is recached at some interval, but this should be
-- fine to get started.
SELECT
  *,
  (
    SELECT
      COUNT(1)
    FROM
      tasks.task AS k
    WHERE
      k.task_name_id = t.task_name_id
  ) AS hits
FROM
  common.task_name t
WHERE
  name LIKE ?
ORDER BY
  hits DESC,
  name ASC
LIMIT ?
;
