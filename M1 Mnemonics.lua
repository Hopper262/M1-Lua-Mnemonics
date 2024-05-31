-- M1 Lua Mnemonics version 1.0
-- by Hopper
-- thanks to Loren Petrich and all others who reverse-engineered Marathon

-- Copy the function "apply_m1_mnemonics" into your script,
-- or use this file as a template.

Triggers = {}

function Triggers.init(restoring_game)
  apply_m1_mnemonics()
  
  -- do work here

end

function Triggers.idle()

  -- more work here

end

-- etc...

function apply_m1_mnemonics()

  function set(coll, key, val)
    if coll[key] ~= nil then
      coll[key].mnemonic = val
    end
  end
  function clear(coll, key)
    if coll[key] ~= nil then
      coll[key].mnemonic = "unused " .. coll[key].index
    end
  end
  function clear_range(coll, ...)
    local arg = {...}
    if coll == nil then return end
    local max = #coll - 1
    local i = 1
    local j, first, last
    while i <= #arg do
      first = arg[i]
      i = i + 1
      if i <= #arg then 
        last = arg[i]
        i = i + 1
      else
        last = max
      end
      for j = first,last do
        clear(coll, j)
      end
    end
  end
  function clear_list(coll, ...)
    local arg = {...}
    local i
    for i = 1,#arg do
      clear(coll, arg[i])
    end
  end
  function set_list(coll, first, ...)
    local arg = {...}
    local i, key, val
    for i = 1,#arg do
      key = first + i - 1
      val = arg[i]
      if val ~= nil then
        set(coll, key, val)
      else
        clear(coll, key, val)
      end
    end
  end
  
  clear_list(Collections, "pfhor", "trooper", 11, 13)
  clear_range(Collections, 17)
  set(Collections, 2, "pfhor")
  set(Collections, 3, "looker")
  set(Collections, 8, "marathon panels")
  set(Collections, 10, "main menu")
  set(Collections, 15, "hulk")
  set_list(Collections, 17,
        "warm",
        "cool",
        "lava",
        nil,
        "juggernaut",
        "madd",
        "marathon scenery",
        "pfhor panels",
        "pfhor scenery",
        "trooper",
        "wasp",
        nil,
        "alien leader")

  clear_range(DamageTypes, 20)  

  clear_range(EffectTypes, 11)
  set_list(EffectTypes, 13,
      "enforcer blood splash",
      "minor hulk blood splash",
      "major hulk blood splash",
      "hulk melee detonation",
      "compiler bolt minor detonation",
      "compiler bolt major detonation",
      "compiler bolt major contrail",
      "fighter projectile detonation",
      "hunter projectile detonation",  
      "hunter spark",
      "minor fusion detonation",
      "major fusion detonation",
      "major fusion contrail",
      "fist detonation",
      nil,
      "wasp detonation",
      "wasp projectile detonation",
      "wasp blood splash",
      "trooper blood splash",
      nil,
      "madd spark",
      "juggernaut spark",
      "alien leader blood splash",
      "metallic clang")

  clear_range(FadeTypes, 23)
  set_list(FadeTypes, 23,
    "dodge purple",
    "burn cyan",
    "dodge yellow",
    "burn green")
  
  clear_range(ItemTypes, 20)
  set_list(ItemTypes, 18,
    "repair chip",
    "energy converter")
  
  clear_range(MonsterClasses, 3)
  set_list(MonsterClasses, 3,
    "fighter",
    "trooper",
    "hunter",
    "enforcer",
    "juggernaut",
    nil,
    "compiler",
    "hulk",
    nil,
    "looker",
    nil,
    "wasp",
    "explodabob")

  clear_range(MonsterTypes, 1)
  set_list(MonsterTypes, 1,
    "explodabob",
    "minor fighter",
    "major fighter",
    "minor projectile fighter",
    "major projectile fighter",
    "crew bob",
    "science bob",
    "security bob",
    "engineering bob",
    nil,
    nil,
    "minor enforcer",
    "major enforcer",
    "minor compiler",
    "major compiler",
    "minor invisible compiler",
    "major invisible compiler",
    "minor hulk",
    "major hulk",
    "minor hunter",
    "major hunter",
    "minor juggernaut",
    "major juggernaut",
    "minor looker",
    "major looker",
    "invisible looker",
    "madd",
    nil,
    nil,
    "minor trooper",
    "major trooper",
    "minor wasp",
    "major wasp",
    nil,
    nil,
    nil,
    nil,
    "alien leader",
    "possessed madd")
  
  clear_list(PlatformTypes, "pfhor door", "pfhor platform")
  clear_range(PlatformTypes, 6)
  set_list(PlatformTypes, 0,
    "marathon door",
    "marathon platform",
    "noisy marathon platform",
    "pfhor door",
    "pfhor platform",
    "noisy pfhor platform")
  
  clear_list(PlayerColors, "violet", "yellow")
  set(PlayerColors, 0, "violet")
  set_list(PlayerColors, 2,
    "tan",
    "light blue",
    "yellow",
    "brown")
  
  clear_range(ProjectileTypes, 4)
  set_list(ProjectileTypes, 4,
    "staff",
    "staff bolt",
    "flamethrower burst",
    nil,
    "hulk slap minor",
    "hulk slap major",
    "compiler bolt minor",
    "compiler bolt major",
    "alien weapon",
    "fusion bolt minor",
    "fusion bolt major",
    "hunter",
    "fist",
    nil,
    nil,
    "juggernaut rocket",
    "trooper bullet",
    "trooper grenade",
    "wasp sting",
    "wasp goo",
    "juggernaut missile")
  
  clear_range(SceneryTypes, 17)
  set_list(SceneryTypes, 0,
    "upright waste",
    "sideways waste",
    "upright cylinder",
    "sideways cylinder",
    "paper",
    "comm satellite",
    "escape pod",
    "biohazard crate",
    "pfhor ship",
    "soft dead bob",
    "dissected bob",
    "pfhor dormant",
    "empty armor",
    "examination bob",
    "electrosynth",
    "orb",
    "marathon ship")

  clear_range(WeaponTypes, 7)
end
