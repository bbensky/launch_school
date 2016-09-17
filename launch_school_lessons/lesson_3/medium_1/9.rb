munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_key do |munster|
  case munsters[munster]["age"]
  when (0..17)
    munsters[munster]["age_group"] = "kid"
  when (18..64)
    munsters[munster]["age_group"] = "adult"
  else
    munsters[munster]["age_group"] = "senior"
  end
end

# alt

munsters.each_value do |details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end  
end


