# (from InstaCart) Write the following queries in SQL and in Rails:
#
# "count all users",
# "count all active users (you define what active means)",
# "count all users who visited the site within a certain time period".

require 'pg'

def execute(sql)
  conn = PG::Connection.open(:dbname => 'InstaCart')
  query_result = conn.exec(sql).values
  conn.close

  query_result
end

def count_users
  execute(<<-SQL)
    SELECT
      COUNT(users.*)
    FROM
      users
  SQL
end
User.count

def active_users
  execute(<<-SQL)
    SELECT
      COUNT(*)
    FROM
      users
    WHERE
      users.active = true
  SQL
end
User.where(active: true).count

def users_last_visit(time_period_start, time_period_end)
  execute(<<-SQL, time_period_start, time_period_end)
    SELECT
      COUNT(*)
    FROM
      users
    WHERE
      users.last_visited BETWEEN ? AND ?
  SQL
end
User.where(last_login: (time_period_start..time_period_end)).count
