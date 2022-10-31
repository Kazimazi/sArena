local GetTime = GetTime

local trinketSpells = {
	[42292] = 120, -- Trinket
	[59752] = 120, -- Will to survive	
}

-- Spells that trigger a shared cd with pvp trinkets
local sharedSpells = {
	[7744] = 45 -- Will of the forsaken
}

local trinketData = {
	["Alliance"] = { texture = 133452},
	["Horde"] = { texture = 133453},
	["Human"] = { texture = 136129},
}

local function GetRemainingCD(frame)
    local startTime, duration = frame:GetCooldownTimes()
    if ( startTime == 0 ) then return 0 end

    local currTime = GetTime()

    return (startTime + duration) / 1000 - currTime
end

function sArenaFrameMixin:FindTrinket(event, spellID, duration)
    if ( event ~= "SPELL_CAST_SUCCESS" ) then return end

	local currentCD = GetRemainingCD(self.Trinket.Cooldown)
	if sharedSpells[spellID]
		and currentCD < sharedSpells[spellID] 
	then
		duration = sharedSpells[spellID]
	end

    duration = duration or trinketSpells[spellID]

    if ( duration ) then
        local currTime = GetTime()
		self.Trinket.spellID = spellID
		self.Trinket.Cooldown:SetCooldown(currTime, duration)
	end
end

function sArenaFrameMixin:UpdateTrinket()	
	local raceId = select(3, UnitRace(self.unit))
	local faction = UnitFactionGroup(self.unit)
	if (raceId == 1) then
		self.Trinket.Texture:SetTexture(trinketData["Human"].texture)
	else 
		if (faction) then
			self.Trinket.Texture:SetTexture(trinketData[faction].texture)
		end
	end
end

function sArenaFrameMixin:ResetTrinket()
	self.Trinket.spellID = nil
    self.Trinket.Texture:SetTexture(nil)
    self.Trinket.Cooldown:Clear()
    self:UpdateTrinket()
end
