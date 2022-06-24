def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  len = those_actors.length

  Movie
    .select(:id, :title)
    .joins(:actors)
    .where('actors.name in (?)', those_actors)
    .group(:id)
    .having('COUNT(*) >= (?)',len)
end

def golden_age
  # Find the decade with the highest average movie score.
  # Movie
  # .select("
  #   CASE
  #   WHEN yr >= 2000 THEN 2000
  #   WHEN yr >= 1990 THEN 1990
  #   WHEN yr >= 1980 THEN 1980
  #   WHEN yr >= 1970 THEN 1970
  #   WHEN yr >= 1960 THEN 1960
  #   WHEN yr >= 1950 THEN 1950
  #   WHEN yr >= 1940 THEN 1940
  #   WHEN yr >= 1930 THEN 1930
  #   WHEN yr >= 1920 THEN 1920
  #   ELSE 1940
  #   END As Decade
  # ")
  # .group('Decade')
  # .order("AVG(score) DESC")
  # .limit(1)[0].decade

  Movie
    .select("yr / 10 as decade")
    .group('decade')
    .order("AVG(score) DESC")
    .limit(1)[0].decade * 10 
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  
  Movie
    .select('actors.name')
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
