sArenaMixin.drCategories = {
	"incapacitate",
	"stun",
	"random_stun",
	"random_root",
	"root",
	"disarm",
	"fear",
	"scatter",
	"silence",
	"horror",
	"mind_control",
	"cyclone",
	"charge",
	"opener_stun",
	"counterattack",
}

sArenaMixin.defaultSettings.profile.drCategories = {
	incapacitate = true,
	stun = true,
	random_stun = true,
	random_root = true,
	root = true,
	disarm = true,
	fear = true,
	scatter = true,
	silence = true,
	horror = true,
	mind_control = true,
	cyclone = true,
	charge = true,
	opener_stun = true,
	counterattack = true,
}

sArenaMixin.activeDRs = {

}

local drCategories = sArenaMixin.drCategories
local drList
local drTime = 18.5
drFractionSeverityColor = {
	[1] = { 0, 1, 0, 1 },
	[2] = { 1, 1, 0, 1 },
	[3] = { 1, 0, 0, 1 },
}

local GetTime = GetTime

local function insertDR(drTable, category, timeStamp, stopTime, texture, severity)
	drTable[category] = { drCategory = category, startTime = timeStamp, timer = stopTime, drTexture = texture,
		drSeverity = severity }
end

function sArenaFrameMixin:FindDR(combatEvent, spellID)
	local frameName = self:GetName()

	if not self.parent.activeDRs[frameName] then
		self.parent.activeDRs[frameName] = {}
	end

	local drTable = self.parent.activeDRs[frameName]
	local category = drList[spellID]
	if (not category) then return end
	if (not self.parent.db.profile.drCategories[category]) then return end

	local frame = self[category]
	local currTime = GetTime()
	if (combatEvent == "SPELL_AURA_REMOVED" or combatEvent == "SPELL_AURA_BROKEN") then
		local startTime, startDuration = frame.Cooldown:GetCooldownTimes()
		startTime, startDuration = startTime / 1000, startDuration / 1000

		-- Was unable to reproduce bug where CC would break
		-- instantly after appliction (Shatter pet nova) but DR timer didnt start on SPELL_AURA_APPLIED
		-- So on SPELL_AURA_BROKEN frame.Cooldown:GetCooldownTimes() gave 0.

		if not (startTime == 0 or startDuration == 0) then

			local newDuration = drTime / (1 - ((currTime - startTime) / startDuration))
			local newStartTime = drTime + currTime - newDuration

			frame:Show()
			frame.Cooldown:SetCooldown(newStartTime, newDuration)
			insertDR(drTable, category, newStartTime, newDuration, select(3, GetSpellInfo(spellID)), frame.severity)

		else
			frame:Show()
			frame.Cooldown:SetCooldown(currTime, drTime)
			insertDR(drTable, category, currTime, drTime, select(3, GetSpellInfo(spellID)), frame.severity)
		end
		return
	elseif (combatEvent == "SPELL_AURA_APPLIED" or combatEvent == "SPELL_AURA_REFRESH") then
		local unit = self.unit

		for i = 1, 30 do
			local _, _, _, _, duration, _, _, _, _, _spellID = UnitAura(unit, i, "HARMFUL")

			if (not _spellID) then break end

			if (duration and spellID == _spellID) then
				frame:Show()
				frame.Cooldown:SetCooldown(currTime, duration + drTime)
				insertDR(drTable, category, currTime, duration + drTime, select(3, GetSpellInfo(spellID)), frame.severity)

				break
			end
		end
	end

	frame.Icon:SetTexture(select(3, GetSpellInfo(spellID)))
	frame.Border:SetVertexColor(unpack(drFractionSeverityColor[frame.severity]))

	frame.severity = frame.severity + 1
	if frame.severity > 3 then
		frame.severity = 3
	end
end

function sArenaFrameMixin:UpdateDRPositions()
	local layoutdb = self.parent.layoutdb
	local numActive = 0
	local frame, prevFrame
	local spacing = layoutdb.dr.spacing
	local growthDirection = layoutdb.dr.growthDirection

	for i = 1, #drCategories do
		frame = self[drCategories[i]]


		if (frame:IsShown()) then
			frame:ClearAllPoints()
			if (numActive == 0) then
				frame:SetPoint("CENTER", self, "CENTER", layoutdb.dr.posX, layoutdb.dr.posY)
			else
				if (growthDirection == 4) then frame:SetPoint("RIGHT", prevFrame, "LEFT", -spacing, 0)
				elseif (growthDirection == 3) then frame:SetPoint("LEFT", prevFrame, "RIGHT", spacing, 0)
				elseif (growthDirection == 1) then frame:SetPoint("TOP", prevFrame, "BOTTOM", 0, -spacing)
				elseif (growthDirection == 2) then frame:SetPoint("BOTTOM", prevFrame, "TOP", 0, spacing)
				end
			end
			numActive = numActive + 1
			prevFrame = frame
		end
	end
end

function sArenaFrameMixin:ResetDR()
	for i = 1, #drCategories do
		self[drCategories[i]].Cooldown:Clear()
		--DR frames would somehow persist through several games, showing just icon and no DR, havent found the cause
		self[drCategories[i]]:Hide()
	end
end

drList = {
	[49203] = "incapacitate", -- Hungering Cold
	[2637]  = "incapacitate", -- Hibernate (Rank 1)
	[18657] = "incapacitate", -- Hibernate (Rank 2)
	[18658] = "incapacitate", -- Hibernate (Rank 3)
	[60210] = "incapacitate", -- Freezing Arrow Effect (Rank 1)
	[3355]  = "incapacitate", -- Freezing Trap Effect (Rank 1)
	[14308] = "incapacitate", -- Freezing Trap Effect (Rank 2)
	[14309] = "incapacitate", -- Freezing Trap Effect (Rank 3)
	[19386] = "incapacitate", -- Wyvern Sting (Rank 1)
	[24132] = "incapacitate", -- Wyvern Sting (Rank 2)
	[24133] = "incapacitate", -- Wyvern Sting (Rank 3)
	[27068] = "incapacitate", -- Wyvern Sting (Rank 4)
	[49011] = "incapacitate", -- Wyvern Sting (Rank 5)
	[49012] = "incapacitate", -- Wyvern Sting (Rank 6)
	[118]   = "incapacitate", -- Polymorph (Rank 1)
	[12824] = "incapacitate", -- Polymorph (Rank 2)
	[12825] = "incapacitate", -- Polymorph (Rank 3)
	[12826] = "incapacitate", -- Polymorph (Rank 4)
	[28271] = "incapacitate", -- Polymorph: Turtle
	[28272] = "incapacitate", -- Polymorph: Pig
	[61721] = "incapacitate", -- Polymorph: Rabbit
	[61780] = "incapacitate", -- Polymorph: Turkey
	[61305] = "incapacitate", -- Polymorph: Black Cat
	[20066] = "incapacitate", -- Repentance
	[1776]  = "incapacitate", -- Gouge
	[6770]  = "incapacitate", -- Sap (Rank 1)
	[2070]  = "incapacitate", -- Sap (Rank 2)
	[11297] = "incapacitate", -- Sap (Rank 3)
	[51724] = "incapacitate", -- Sap (Rank 4)
	[710]   = "incapacitate", -- Banish (Rank 1)
	[18647] = "incapacitate", -- Banish (Rank 2)
	[9484]  = "incapacitate", -- Shackle Undead (Rank 1)
	[9485]  = "incapacitate", -- Shackle Undead (Rank 2)
	[10955] = "incapacitate", -- Shackle Undead (Rank 3)
	[51514] = "incapacitate", -- Hex
	[13327] = "incapacitate", -- Reckless Charge (Rocket Helmet)
	[4064]  = "incapacitate", -- Rough Copper Bomb
	[4065]  = "incapacitate", -- Large Copper Bomb
	[4066]  = "incapacitate", -- Small Bronze Bomb
	[4067]  = "incapacitate", -- Big Bronze Bomb
	[4068]  = "incapacitate", -- Iron Grenade
	[12421] = "incapacitate", -- Mithril Frag Bomb
	[4069]  = "incapacitate", -- Big Iron Bomb
	[12562] = "incapacitate", -- The Big One
	[12543] = "incapacitate", -- Hi-Explosive Bomb
	[19769] = "incapacitate", -- Thorium Grenade
	[19784] = "incapacitate", -- Dark Iron Bomb
	[30216] = "incapacitate", -- Fel Iron Bomb
	[30461] = "incapacitate", -- The Bigger One
	[30217] = "incapacitate", -- Adamantite Grenade

	[47481] = "stun", -- Gnaw (Ghoul Pet)
	[5211]  = "stun", -- Bash (Rank 1)
	[6798]  = "stun", -- Bash (Rank 2)
	[8983]  = "stun", -- Bash (Rank 3)
	[22570] = "stun", -- Maim (Rank 1)
	[49802] = "stun", -- Maim (Rank 2)
	[24394] = "stun", -- Intimidation
	[50519] = "stun", -- Sonic Blast (Pet Rank 1)
	[53564] = "stun", -- Sonic Blast (Pet Rank 2)
	[53565] = "stun", -- Sonic Blast (Pet Rank 3)
	[53566] = "stun", -- Sonic Blast (Pet Rank 4)
	[53567] = "stun", -- Sonic Blast (Pet Rank 5)
	[53568] = "stun", -- Sonic Blast (Pet Rank 6)
	[50518] = "stun", -- Ravage (Pet Rank 1)
	[53558] = "stun", -- Ravage (Pet Rank 2)
	[53559] = "stun", -- Ravage (Pet Rank 3)
	[53560] = "stun", -- Ravage (Pet Rank 4)
	[53561] = "stun", -- Ravage (Pet Rank 5)
	[53562] = "stun", -- Ravage (Pet Rank 6)
	[44572] = "stun", -- Deep Freeze
	[853]   = "stun", -- Hammer of Justice (Rank 1)
	[5588]  = "stun", -- Hammer of Justice (Rank 2)
	[5589]  = "stun", -- Hammer of Justice (Rank 3)
	[10308] = "stun", -- Hammer of Justice (Rank 4)
	[2812]  = "stun", -- Holy Wrath (Rank 1)
	[10318] = "stun", -- Holy Wrath (Rank 2)
	[27139] = "stun", -- Holy Wrath (Rank 3)
	[48816] = "stun", -- Holy Wrath (Rank 4)
	[48817] = "stun", -- Holy Wrath (Rank 5)
	[408]   = "stun", -- Kidney Shot (Rank 1)
	[8643]  = "stun", -- Kidney Shot (Rank 2)
	[58861] = "stun", -- Bash (Spirit Wolves)
	[30283] = "stun", -- Shadowfury (Rank 1)
	[30413] = "stun", -- Shadowfury (Rank 2)
	[30414] = "stun", -- Shadowfury (Rank 3)
	[47846] = "stun", -- Shadowfury (Rank 4)
	[47847] = "stun", -- Shadowfury (Rank 5)
	[12809] = "stun", -- Concussion Blow
	[60995] = "stun", -- Demon Charge
	[30153] = "stun", -- Intercept (Felguard Rank 1)
	[30195] = "stun", -- Intercept (Felguard Rank 2)
	[30197] = "stun", -- Intercept (Felguard Rank 3)
	[47995] = "stun", -- Intercept (Felguard Rank 4)
	[20253] = "stun", -- Intercept Stun (Rank 1)
	[20614] = "stun", -- Intercept Stun (Rank 2)
	[20615] = "stun", -- Intercept Stun (Rank 3)
	[25273] = "stun", -- Intercept Stun (Rank 4)
	[25274] = "stun", -- Intercept Stun (Rank 5)
	[46968] = "stun", -- Shockwave
	[20549] = "stun", -- War Stomp (Racial)

	[16922] = "random_stun", -- Celestial Focus (Starfire Stun)
	[28445] = "random_stun", -- Improved Concussive Shot
	[12355] = "random_stun", -- Impact
	[20170] = "random_stun", -- Seal of Justice Stun
	[39796] = "random_stun", -- Stoneclaw Stun
	[12798] = "random_stun", -- Revenge Stun
	[5530]  = "random_stun", -- Mace Stun Effect (Mace Specialization)
	[15283] = "random_stun", -- Stunning Blow (Weapon Proc)
	[56]    = "random_stun", -- Stun (Weapon Proc)
	[34510] = "random_stun", -- Stormherald/Deep Thunder (Weapon Proc)

	[1513]  = "fear", -- Scare Beast (Rank 1)
	[14326] = "fear", -- Scare Beast (Rank 2)
	[14327] = "fear", -- Scare Beast (Rank 3)
	[10326] = "fear", -- Turn Evil
	[8122]  = "fear", -- Psychic Scream (Rank 1)
	[8124]  = "fear", -- Psychic Scream (Rank 2)
	[10888] = "fear", -- Psychic Scream (Rank 3)
	[10890] = "fear", -- Psychic Scream (Rank 4)
	[2094]  = "fear", -- Blind
	[5782]  = "fear", -- Fear (Rank 1)
	[6213]  = "fear", -- Fear (Rank 2)
	[6215]  = "fear", -- Fear (Rank 3)
	[6358]  = "fear", -- Seduction (Succubus)
	[5484]  = "fear", -- Howl of Terror (Rank 1)
	[17928] = "fear", -- Howl of Terror (Rank 2)
	[5246]  = "fear", -- Intimidating Shout
	[5134]  = "fear", -- Flash Bomb Fear (Item)

	[339]   = "root", -- Entangling Roots (Rank 1)
	[1062]  = "root", -- Entangling Roots (Rank 2)
	[5195]  = "root", -- Entangling Roots (Rank 3)
	[5196]  = "root", -- Entangling Roots (Rank 4)
	[9852]  = "root", -- Entangling Roots (Rank 5)
	[9853]  = "root", -- Entangling Roots (Rank 6)
	[26989] = "root", -- Entangling Roots (Rank 7)
	[53308] = "root", -- Entangling Roots (Rank 8)
	[19975] = "root", -- Nature's Grasp (Rank 1)
	[19974] = "root", -- Nature's Grasp (Rank 2)
	[19973] = "root", -- Nature's Grasp (Rank 3)
	[19972] = "root", -- Nature's Grasp (Rank 4)
	[19971] = "root", -- Nature's Grasp (Rank 5)
	[19970] = "root", -- Nature's Grasp (Rank 6)
	[27010] = "root", -- Nature's Grasp (Rank 7)
	[53312] = "root", -- Nature's Grasp (Rank 8)
	[50245] = "root", -- Pin (Rank 1)
	[53544] = "root", -- Pin (Rank 2)
	[53545] = "root", -- Pin (Rank 3)
	[53546] = "root", -- Pin (Rank 4)
	[53547] = "root", -- Pin (Rank 5)
	[53548] = "root", -- Pin (Rank 6)
	[33395] = "root", -- Freeze (Water Elemental)
	[122]   = "root", -- Frost Nova (Rank 1)
	[865]   = "root", -- Frost Nova (Rank 2)
	[6131]  = "root", -- Frost Nova (Rank 3)
	[10230] = "root", -- Frost Nova (Rank 4)
	[27088] = "root", -- Frost Nova (Rank 5)
	[42917] = "root", -- Frost Nova (Rank 6)
	[39965] = "root", -- Frost Grenade (Item)
	[63685] = "root", -- Freeze (Frost Shock)

	[12494] = "random_root", -- Frostbite
	[55080] = "random_root", -- Shattered Barrier
	[58373] = "random_root", -- Glyph of Hamstring
	[23694] = "random_root", -- Improved Hamstring
	[47168] = "random_root", -- Improved Wing Clip
	[19185] = "random_root", -- Entrapment

	[53359] = "disarm", -- Chimera Shot (Scorpid)
	[50541] = "disarm", -- Snatch (Rank 1)
	[53537] = "disarm", -- Snatch (Rank 2)
	[53538] = "disarm", -- Snatch (Rank 3)
	[53540] = "disarm", -- Snatch (Rank 4)
	[53542] = "disarm", -- Snatch (Rank 5)
	[53543] = "disarm", -- Snatch (Rank 6)
	[64058] = "disarm", -- Psychic Horror Disarm Effect
	[51722] = "disarm", -- Dismantle
	[676]   = "disarm", -- Disarm

	[47476] = "silence", -- Strangulate
	[34490] = "silence", -- Silencing Shot
	[35334] = "silence", -- Nether Shock 1 -- TODO: verify
	[44957] = "silence", -- Nether Shock 2 -- TODO: verify
	[18469] = "silence", -- Silenced - Improved Counterspell (Rank 1)
	[55021] = "silence", -- Silenced - Improved Counterspell (Rank 2)
	[63529] = "silence", -- Silenced - Shield of the Templar
	[15487] = "silence", -- Silence
	[1330]  = "silence", -- Garrote - Silence
	[18425] = "silence", -- Silenced - Improved Kick
	[24259] = "silence", -- Spell Lock
	[43523] = "silence", -- Unstable Affliction 1
	[31117] = "silence", -- Unstable Affliction 2
	[18498] = "silence", -- Silenced - Gag Order (Shield Slam)
	[74347] = "silence", -- Silenced - Gag Order (Heroic Throw?)
	[50613] = "silence", -- Arcane Torrent (Racial, Runic Power)
	[28730] = "silence", -- Arcane Torrent (Racial, Mana)
	[25046] = "silence", -- Arcane Torrent (Racial, Energy)

	[64044] = "horror", -- Psychic Horror
	[6789]  = "horror", -- Death Coil (Rank 1)
	[17925] = "horror", -- Death Coil (Rank 2)
	[17926] = "horror", -- Death Coil (Rank 3)
	[27223] = "horror", -- Death Coil (Rank 4)
	[47859] = "horror", -- Death Coil (Rank 5)
	[47860] = "horror", -- Death Coil (Rank 6)

	[1833]  = "opener_stun", -- Cheap Shot
	[9005]  = "opener_stun", -- Pounce (Rank 1)
	[9823]  = "opener_stun", -- Pounce (Rank 2)
	[9827]  = "opener_stun", -- Pounce (Rank 3)
	[27006] = "opener_stun", -- Pounce (Rank 4)
	[49803] = "opener_stun", -- Pounce (Rank 5)

	[31661] = "scatter", -- Dragon's Breath (Rank 1)
	[33041] = "scatter", -- Dragon's Breath (Rank 2)
	[33042] = "scatter", -- Dragon's Breath (Rank 3)
	[33043] = "scatter", -- Dragon's Breath (Rank 4)
	[42949] = "scatter", -- Dragon's Breath (Rank 5)
	[42950] = "scatter", -- Dragon's Breath (Rank 6)
	[19503] = "scatter", -- Scatter Shot

	-- Spells that DR with itself only
	[33786] = "cyclone", -- Cyclone
	[605]   = "mind_control", -- Mind Control
	[13181] = "mind_control", -- Gnomish Mind Control Cap
	[7922]  = "charge", -- Charge Stun
	[19306] = "counterattack", -- Counterattack 1
	[20909] = "counterattack", -- Counterattack 2
	[20910] = "counterattack", -- Counterattack 3
	[27067] = "counterattack", -- Counterattack 4
	[48998] = "counterattack", -- Counterattack 5
	[48999] = "counterattack", -- Counterattack 6
}
