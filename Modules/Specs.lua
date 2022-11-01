local SPEC_AURAS = {
    -- WARRIOR
    [GetSpellInfo(56638)] = "Arms Warriror", -- Taste for Blood
    [GetSpellInfo(64976)] = "Arms Warriror", -- Juggernaut
    [GetSpellInfo(57522)] = "Arms Warriror", -- Enrage
    [GetSpellInfo(52437)] = "Arms Warriror", -- Sudden Death
    [GetSpellInfo(46857)] = "Arms Warriror", -- Trauma
    [GetSpellInfo(56112)] = "Fury Warriror", -- Furious Attacks
    [GetSpellInfo(29801)] = "Fury Warriror", -- Rampage
    [GetSpellInfo(46916)] = "Fury Warriror", -- Slam!
    [GetSpellInfo(50227)] = "Protection Warrior", -- Sword and Board
    [GetSpellInfo(50720)] = "Protection Warrior", -- Vigilance
    [GetSpellInfo(74347)] = "Protection Warrior", -- Silenced - Gag Order
    -- PALADIN
    [GetSpellInfo(20375)] = "Retribution Paladin", -- Seal of Command
    [GetSpellInfo(59578)] = "Retribution Paladin", -- The Art of War
    [GetSpellInfo(31836)] = "Holy Paladin", -- Light's Grace
    [GetSpellInfo(53563)] = "Holy Paladin", -- Beacon of Light
    [GetSpellInfo(54149)] = "Holy Paladin", -- Infusion of Light
    [GetSpellInfo(63529)] = "Protection Paladin", -- Silenced - Shield of the Templar
    -- ROGUE
    [GetSpellInfo(36554)] = "Subtlety Rogue", -- Shadowstep
    [GetSpellInfo(44373)] = "Subtlety Rogue", -- Shadowstep Speed
    [GetSpellInfo(36563)] = "Subtlety Rogue", -- Shadowstep DMG
    [GetSpellInfo(51713)] = "Subtlety Rogue", -- Shadow Dance
    [GetSpellInfo(31665)] = "Subtlety Rogue", -- Master of Subtlety
    [GetSpellInfo(14278)] = "Subtlety Rogue", -- Ghostly Strike
    [GetSpellInfo(51690)] = "Combat Rogue", -- Killing Spree
    [GetSpellInfo(13877)] = "Combat Rogue", -- Blade Flurry
    [GetSpellInfo(13750)] = "Combat Rogue", -- Adrenaline Rush
    [GetSpellInfo(14177)] = "Assassination Rogue", -- Cold Blood
    -- PRIEST
    [GetSpellInfo(47788)] = "Holy Priest", -- Guardian Spirit
    [GetSpellInfo(52800)] = "Discipline Priest", -- Borrowed Time
    [GetSpellInfo(63944)] = "Discipline Priest", -- Renewed Hope
    [GetSpellInfo(15473)] = "Shadow Priest", -- Shadowform
    [GetSpellInfo(15286)] = "Shadow Priest", -- Vampiric Embrace
    -- DEATHKNIGHT
    [GetSpellInfo(49222)] = "Unholy DK", -- Bone Shield
    [GetSpellInfo(49016)] = "Blood DK", -- Hysteria
    [GetSpellInfo(53138)] = "Blood DK", -- Abomination's Might
    [GetSpellInfo(55610)] = "Frost DK", -- Imp. Icy Talons
    -- MAGE
    [GetSpellInfo(43039)] = "Frost Mage", -- Ice Barrier
    [GetSpellInfo(74396)] = "Frost Mage", -- Fingers of Frost
    [GetSpellInfo(57761)] = "Frost Mage", -- Fireball!
    [GetSpellInfo(11129)] = "Fire Mage", -- Combustion
    [GetSpellInfo(64346)] = "Fire Mage", -- Fiery Payback
    [GetSpellInfo(48108)] = "Fire Mage", -- Hot Streak
    [GetSpellInfo(54741)] = "Fire Mage", -- Firestarter
    [GetSpellInfo(55360)] = "Fire Mage", -- Living Bomb
    [GetSpellInfo(31583)] = "Arcane Mage", -- Arcane Empowerment
    [GetSpellInfo(44413)] = "Arcane Mage", -- Incanter's Absorption
    -- WARLOCK
    [GetSpellInfo(30302)] = "Destruction Warlock", -- Nether Protection
    [GetSpellInfo(63244)] = "Destruction Warlock", -- Pyroclasm
    [GetSpellInfo(54277)] = "Destruction Warlock", -- Backdraft
    [GetSpellInfo(47283)] = "Destruction Warlock", -- Empowered Imp
    [GetSpellInfo(34936)] = "Destruction Warlock", -- Backlash
    [GetSpellInfo(47193)] = "Demonology Warlock", -- Demonic Empowerment
    [GetSpellInfo(64371)] = "Affliction Warlock", -- Eradication
    -- SHAMAN
    [GetSpellInfo(57663)] = "Elemental Shaman", -- Totem of Wrath
    [GetSpellInfo(65264)] = "Elemental Shaman", -- Lava Flows
    [GetSpellInfo(51470)] = "Elemental Shaman", -- Elemental Oath
    [GetSpellInfo(52179)] = "Elemental Shaman", -- Astral Shift
    [GetSpellInfo(49284)] = "Restoration Shaman", -- Earth Shield
    [GetSpellInfo(53390)] = "Restoration Shaman", -- Tidal Waves
    [GetSpellInfo(30809)] = "Enhancement Shaman", -- Unleashed Rage
    [GetSpellInfo(53817)] = "Enhancement Shaman", -- Maelstrom Weapon
    [GetSpellInfo(63685)] = "Enhancement Shaman", -- Freeze (Frozen Power)
    -- HUNTER
    [GetSpellInfo(20895)] = "Beast Mastery Hunter", -- Spirit Bond
    [GetSpellInfo(34471)] = "Beast Mastery Hunter", -- The Beast Within
    [GetSpellInfo(75447)] = "Beast Mastery Hunter", -- Ferocious Inspiration
    [GetSpellInfo(19506)] = "Marksmanship Hunter", -- Trueshot Aura
    [GetSpellInfo(64420)] = "Survival Hunter", -- Sniper Training
    -- DRUID
    [GetSpellInfo(24932)] = "Feral Druid", -- Leader of the Pack
    [GetSpellInfo(16975)] = "Feral Druid", -- Predatory Strikes
    [GetSpellInfo(50334) .. " Feral"] = "Feral Druid", -- Berserk
    [GetSpellInfo(24907)] = "Balance Druid", -- Moonkin Aura
    [GetSpellInfo(24858)] = "Balance Druid", -- Moonkin Form
    [GetSpellInfo(48504)] = "Restoration Druid", -- Living Seed
    [GetSpellInfo(45283)] = "Restoration Druid", -- Natural Perfection
    [GetSpellInfo(53251)] = "Restoration Druid", -- Wild Growth
    [GetSpellInfo(16188)] = "Restoration Druid", -- Nature's Swiftness
    [GetSpellInfo(33891)] = "Restoration Druid", -- Tree of Life
}

local SPEC_SPELLS = {
    -- WARRIOR
    [GetSpellInfo(47486)] = "Arms Warrior", -- Mortal Strike
    [GetSpellInfo(46924)] = "Arms Warrior", -- Bladestorm
    [GetSpellInfo(23881)] = "Fury Warrior", -- Bloodthirst
    [GetSpellInfo(12809)] = "Protection Warrior", -- Concussion Blow
    [GetSpellInfo(47498)] = "Protection Warrior", -- Devastate
    [GetSpellInfo(46968)] = "Protection Warrior", -- Shockwave
    [GetSpellInfo(50720)] = "Protection Warrior", -- Vigilance
    -- PALADIN
    [GetSpellInfo(48827)] = "Protection Paladin", -- Avenger's Shield
    [GetSpellInfo(48825)] = "Holy Paladin", -- Holy Shock
    [GetSpellInfo(53563)] = "Holy Paladin", -- Beacon of Light
    [GetSpellInfo(35395)] = "Retribution Paladin", -- Crusader Strike
    [GetSpellInfo(66006)] = "Retribution Paladin", -- Divine Storm
    [GetSpellInfo(20066)] = "Retribution Paladin", -- Repentance
    -- ROGUE
    [GetSpellInfo(48666)] = "Assassination Rogue", -- Mutilate
    [GetSpellInfo(14177)] = "Assassination Rogue", -- Cold Blood
    [GetSpellInfo(51690)] = "Combat Rogue", -- Killing Spree
    [GetSpellInfo(13877)] = "Combat Rogue", -- Blade Flurry
    [GetSpellInfo(13750)] = "Combat Rogue", -- Adrenaline Rush
    [GetSpellInfo(36554)] = "Subtlety Rogue", -- Shadowstep
    [GetSpellInfo(48660)] = "Subtlety Rogue", -- Hemorrhage
    [GetSpellInfo(51713)] = "Subtlety Rogue", -- Shadow Dance
    -- PRIEST
    [GetSpellInfo(53007)] = "Discipline Priest", -- Penance
    [GetSpellInfo(10060)] = "Discipline Priest", -- Power Infusion
    [GetSpellInfo(33206)] = "Discipline Priest", -- Pain Suppression
    [GetSpellInfo(34861)] = "Holy Priest", -- Circle of Healing
    [GetSpellInfo(15487)] = "Shadow Priest", -- Silence
    [GetSpellInfo(48160)] = "Shadow Priest", -- Vampiric Touch
    -- DEATHKNIGHT
    [GetSpellInfo(55262)] = "Blood DK", -- Heart Strike
    [GetSpellInfo(49203)] = "Frost DK", -- Hungering Cold
    [GetSpellInfo(55268)] = "Frost DK", -- Frost Strike
    [GetSpellInfo(51411)] = "Frost DK", -- Howling Blast
    [GetSpellInfo(55271)] = "Unholy DK", -- Scourge Strike
    -- MAGE
    [GetSpellInfo(44781)] = "Arcane Mage", -- Arcane Barrage
    [GetSpellInfo(55360)] = "Fire Mage", -- Living Bomb
    [GetSpellInfo(42950)] = "Fire Mage", -- Dragon's Breath
    [GetSpellInfo(42945)] = "Fire Mage", -- Blast Wave
    [GetSpellInfo(44572)] = "Frost Mage", -- Deep Freeze
    -- WARLOCK
    [GetSpellInfo(59164)] = "Affliction Warlock", -- Haunt
    [GetSpellInfo(47843)] = "Affliction Warlock", -- Unstable Affliction
    [GetSpellInfo(59672)] = "Demonology Warlock", -- Metamorphosis
    [GetSpellInfo(47193)] = "Demonology Warlock", -- Demonic Empowerment
    [GetSpellInfo(47996) .. " Felguard"] = "Demonology Warlock", -- Intercept Felguard
    [GetSpellInfo(59172)] = "Destruction Warlock", -- Chaos Bolt
    [GetSpellInfo(47847)] = "Destruction Warlock", -- Shadowfury
    -- SHAMAN
    [GetSpellInfo(59159)] = "Elemental Shaman", -- Thunderstorm
    [GetSpellInfo(16166)] = "Elemental Shaman", -- Elemental Mastery
    [GetSpellInfo(51533)] = "Enhancement Shaman", -- Feral Spirit
    [GetSpellInfo(30823)] = "Enhancement Shaman", -- Shamanistic Rage
    [GetSpellInfo(17364)] = "Enhancement Shaman", -- Stormstrike
    [GetSpellInfo(61301)] = "Restoration Shaman", -- Riptide
    [GetSpellInfo(51886)] = "Restoration Shaman", -- Cleanse Spirit
    -- HUNTER
    [GetSpellInfo(19577)] = "Beast Mastery Hunter", -- Intimidation
    [GetSpellInfo(34490)] = "Marksmanship Hunter", -- Silencing Shot
    [GetSpellInfo(53209)] = "Marksmanship Hunter", -- Chimera Shot
    [GetSpellInfo(60053)] = "Survival Hunter", -- Explosive Shot
    [GetSpellInfo(49012)] = "Survival Hunter", -- Wyvern Sting
    -- DRUID
    [GetSpellInfo(53201)] = "Balance Druid", -- Starfall
    [GetSpellInfo(61384)] = "Balance Druid", -- Typhoon
    [GetSpellInfo(24858)] = "Balance Druid", -- Moonkin Form
    [GetSpellInfo(48566)] = "Feral Druid", -- Mangle (Cat)
    [GetSpellInfo(48564)] = "Feral Druid", -- Mangle (Bear)
    [GetSpellInfo(50334) .. " Feral"] = "Feral Druid", -- Berserk
    [GetSpellInfo(18562)] = "Restoration Druid", -- Swiftmend
    [GetSpellInfo(17116)] = "Restoration Druid", -- Nature's Swiftness
    [GetSpellInfo(33891)] = "Restoration Druid", -- Tree of Life
    [GetSpellInfo(53251)] = "Restoration Druid", -- Wild Growth
}
local SPEC_TEXTURES = {
    ["Arms Warrior"] = "Interface\\Icons\\Ability_warrior_bladestorm",
    ["Furry Warrior"] = "Interface\\Icons\\Ability_warrior_innerrage",
    ["Protection Warrior"] = "Interface\\Icons\\Inv_shield_06",

    ["Holy Paladin"] = "Interface\\Icons\\Spell_holy_holybolt",
    ["Retribution Paladin"] = "Interface\\Icons\\Spell_holy_auraoflight",
    ["Protection Paladin"] = "Interface\\Icons\\Inv_shield_06",

    ["Assassination Rogue"] = "Interface\\Icons\\Ability_rogue_eviscerate",
    ["Combat Rogue"] = "Interface\\Icons\\Ability_backstab",
    ["Subtlety Rogue"] = "Interface\\Icons\\Ability_stealth",

    ["Discipline Priest"] = "Interface\\Icons\\Spell_holy_penance",
    ["Shadow Priest"] = "Interface\\Icons\\Spell_shadow_shadowform",
    ["Holy Priest"] = "Interface\\Icons\\Spell_holy_holybolt",

    ["Blood DK"] = "Interface\\Icons\\Spell_deathknight_bloodpresence",
    ["Frost DK"] = "Interface\\Icons\\Spell_deathknight_frostpresence",
    ["Unholy DK"] = "Interface\\Icons\\Spell_deathknight_unholypresence",

    ["Arcane Mage"] = "Interface\\Icons\\Spell_arcane_blast",
    ["Fire Mage"] = "Interface\\Icons\\Spell_fire_fireball02",
    ["Frost Mage"] = "Interface\\Icons\\Spell_frost_frostbolt02",

    ["Affliction Warlock"] = "Interface\\Icons\\Spell_shadow_unstableaffliction_3",
    ["Demonology Warlock"] = "Interface\\Icons\\Spell_shadow_demonform",
    ["Destruction Warlock"] = "Interface\\Icons\\Spell_shadow_shadowfury",

    ["Elemental Shaman"] = "Interface\\Icons\\Spell_shaman_thunderstorm",
    ["Enhancement Shaman"] = "Interface\\Icons\\Ability_shaman_stormstrike",
    ["Restoration Shaman"] = "Interface\\Icons\\Spell_nature_magicimmunity",

    ["Beast Mastery Hunter"] = "Interface\\Icons\\Ability_hunter_beastwithin",
    ["Marksmanship Hunter"] = "Interface\\Icons\\Ability_marksmanship",
    ["Survival Hunter"] = "Interface\\Icons\\Ability_hunter_swiftstrike",

    ["Balance Druid"] = "Interface\\Icons\\Spell_nature_starfall",
    ["Feral Druid"] = "Interface\\Icons\\Ability_racial_bearform",
    ["Restoration Druid"] = "Interface\\Icons\\Spell_nature_healingtouch",
}
