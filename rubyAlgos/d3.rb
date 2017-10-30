# SQL + ActiveRecord
#
# (from InstaCart) Write the following queries in SQL and in Rails:
#
# a. "count all users",
# b. "count all active users (you define what active means)",
# c. "count all users who visited the site within a certain time period".


# a

SELECT
  COUNT(*)
FROM
  users;

# b
User.count

#b
SELECT
  COUNT(*)
FROM
  users;
WHERE
  users.year >= 2017


User.where( :year >= 2017 ).count

#c
SELECT
  COUNT(*);
FROM
  users;
WHERE
  users.visit BETWEEN :time_start AND :time_end

User.where( visit: (:time_start..:time_end) ).count


# folding_cipher

# Implement the Folding Cipher. It folds the alphabet in half and uses the adjacent letter. Ie. a <=> z, b <=> y, c <=> x, m <=> n.


def folding_cipher(str)
  result  = [];
  abc = ('a'..'z').to_a
  hash = {}
  (0..25).each do |n|
    hash[abc[n]] = n
  end
  split_str = str.split("")
  split_str.each do |ltr|
    new_idx = 25 - hash[ltr]
    result.push(abc[new_idx])
  end
  result.join

end
