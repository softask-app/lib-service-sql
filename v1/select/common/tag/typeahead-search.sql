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
      joins.task_to_tag AS j
    WHERE
      j.tag_id = t.tag_id
  ) AS hits
FROM
  common.tag t
WHERE
  name LIKE ?
ORDER BY
  hits DESC,
  name ASC
LIMIT ?
;
