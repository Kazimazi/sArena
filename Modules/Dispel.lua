sArenaMixin.Dispels = {
	[GetSpellInfo(527)] = 8, -- priest (purify)
	[GetSpellInfo(4987)] = 8, -- paladin (cleanse)
	[GetSpellInfo(77130)] = 8, -- shaman (purify spirit)
	[GetSpellInfo(88423)] = 8, -- druid (nature's cure)
	[GetSpellInfo(115450)] = 8, -- monk (detox)
	[GetSpellInfo(2782)] = 8, -- dps druid (remove corruption)
	[GetSpellInfo(51886)] = 8, -- dps shaman (cleanse spirit)
	[GetSpellInfo(475)] = 8 -- dps mage (remove curse)
};

function sArenaFrameMixin:SetDispelTexture()
	local englishClass = self.class
	local spec = self.specName
	local dispellIcon = nil
	if englishClass == "PRIEST" then
		if spec == "Discipline" or spec == "Holy" then
			dispellIcon = "Interface\\Icons\\spell_holy_dispelmagic" -- OK
		end
	elseif englishClass == "SHAMAN" then
		dispellIcon = "Interface\\Icons\\ability_shaman_cleansespirit" -- OK
	elseif englishClass == "PALADIN" then
		dispellIcon = "Interface\\Icons\\spell_holy_purify" -- OK
	elseif englishClass == "DRUID" then
		if spec == "Restoration" then
			dispellIcon = "Interface\\Icons\\ability_shaman_cleansespirit" -- OK
		else
			dispellIcon = "Interface\\Icons\\spell_holy_removecurse" -- OK
		end
	elseif englishClass == "MAGE" then
		dispellIcon = "Interface\\Icons\\spell_nature_removecurse" -- OK
	elseif englishClass == "MONK" then
		dispellIcon = "Interface\\Icons\\spell_holy_dispelmagic" -- OK
	end
	if (dispellIcon) then
		self.Dispel.Texture:SetTexture(dispellIcon);
		self.Dispel:Show()
	end
end

function sArenaFrameMixin:UpdateDispel(duration)
	if duration then
		local currTime = GetTime();
		self.Dispel.Cooldown:SetCooldown(currTime, duration);
	end
end

function sArenaFrameMixin:GetDispelCD()
	local cd = 0
	local startTime, duration = self.Dispel.Cooldown:GetCooldownTimes()
	cd = ((startTime + duration) - GetTime())
	return cd
end

function sArenaFrameMixin:FindDispel(event, spell)
	self:SetDispelTexture()
	if (event ~= "SPELL_DISPEL") then return end
	local cd = sArenaMixin.Dispels[GetSpellInfo(spell)]
	if spell and cd then
		self:UpdateDispel(cd)
	end
end
