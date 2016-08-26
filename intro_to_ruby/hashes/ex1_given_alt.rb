family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"], 
           brothers: ["frank", "rob", "david"],
           aunts: ["mary", "sally", "susan"]
         }

immediate_family = family.values_at(:sisters, :brothers).flatten

p immediate_family