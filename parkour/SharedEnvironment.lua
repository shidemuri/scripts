local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
function lerp(a,b,t) return a*(1-t)+(b*t) end
local m={} 
m.comboMultipliers={1,2.5,5,10,15}
m.comboColours={Color3.new(1,.5,.5),Color3.new(1,0,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(1,1,0)}
m.bagNameToTier = {Common=1,Uncommon=2,Rare=3,Epic=4,Legendary=5,Ultimate=6,Resplendent=7,Limited=8,Unavailable=9,Halloween=10,Christmas=11}
m.rankInfo = {
	Unranked = {
		index = 0,
		MaxElo = 0,
		Kfactor = 64,
		EmblemId = "rbxassetid://6862611328",
		TierName = "Unranked",
		DisplayName = "Unranked",
		Color = Color3.new(0.141176, 0.145098, 0.172549)
	},
	Bronze5 = {
		index = 0,
		MinElo = 1,
		MaxElo = 99,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749508592",
		TierName = "Bronze",
		DisplayName = "Bronze V",
		Color = Color3.new(0.701961, 0.423529, 0.0862745)
	},
	Bronze4 = {
		index = 1,
		MinElo = 100,
		MaxElo = 199,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749508694",
		TierName = "Bronze",
		DisplayName = "Bronze IV",
		Color = Color3.new(0.701961, 0.423529, 0.0862745)
	},
	Bronze3 = {
		index = 2,
		MinElo = 200,
		MaxElo = 299,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749508766",
		TierName = "Bronze",
		DisplayName = "Bronze III",
		Color = Color3.new(0.701961, 0.423529, 0.0862745)
	},
	Bronze2 = {
		index = 3,
		MinElo = 300,
		MaxElo = 399,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749508852",
		TierName = "Bronze",
		DisplayName = "Bronze II",
		Color = Color3.new(0.701961, 0.423529, 0.0862745)
	},
	Bronze1 = {
		index = 4,
		MinElo = 400,
		MaxElo = 499,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749508967",
		TierName = "Bronze",
		DisplayName = "Bronze I",
		Color = Color3.new(0.701961, 0.423529, 0.0862745)
	},
	Silver5 = {
		index = 5,
		MinElo = 500,
		MaxElo = 599,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749505815",
		TierName = "Silver",
		DisplayName = "Silver V",
		Color = Color3.new(0.521569, 0.6, 0.701961)
	},
	Silver4 = {
		index = 6,
		MinElo = 600,
		MaxElo = 699,
		Kfactor = 64,
		EmblemId = "rbxassetid://6754104806",
		TierName = "Silver",
		DisplayName = "Silver IV",
		Color = Color3.new(0.521569, 0.6, 0.701961)
	},
	Silver3 = {
		index = 7,
		MinElo = 700,
		MaxElo = 799,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506117",
		TierName = "Silver",
		DisplayName = "Silver III",
		Color = Color3.new(0.521569, 0.6, 0.701961)
	},
	Silver2 = {
		index = 8,
		MinElo = 800,
		MaxElo = 899,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506253",
		TierName = "Silver",
		DisplayName = "Silver II",
		Color = Color3.new(0.521569, 0.6, 0.701961)
	},
	Silver1 = {
		index = 9,
		MinElo = 900,
		MaxElo = 999,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506412",
		TierName = "Silver",
		DisplayName = "Silver I",
		Color = Color3.new(0.521569, 0.6, 0.701961)
	},
	Gold5 = {
		index = 10,
		MinElo = 1000,
		MaxElo = 1099,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507485",
		TierName = "Gold",
		DisplayName = "Gold V",
		Color = Color3.new(1, 0.788235, 0.0117647)
	},
	Gold4 = {
		index = 11,
		MinElo = 1100,
		MaxElo = 1199,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507598",
		TierName = "Gold",
		DisplayName = "Gold IV",
		Color = Color3.new(1, 0.788235, 0.0117647)
	},
	Gold3 = {
		index = 12,
		MinElo = 1200,
		MaxElo = 1299,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507684",
		TierName = "Gold",
		DisplayName = "Gold III",
		Color = Color3.new(1, 0.788235, 0.0117647)
	},
	Gold2 = {
		index = 13,
		MinElo = 1300,
		MaxElo = 1399,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507769",
		TierName = "Gold",
		DisplayName = "Gold II",
		Color = Color3.new(1, 0.788235, 0.0117647)
	},
	Gold1 = {
		index = 14,
		MinElo = 1400,
		MaxElo = 1499,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507882",
		TierName = "Gold",
		DisplayName = "Gold I",
		Color = Color3.new(1, 0.788235, 0.0117647)
	},
	Platinum5 = {
		index = 15,
		MinElo = 1500,
		MaxElo = 1599,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506533",
		TierName = "Platinum",
		DisplayName = "Platinum V",
		Color = Color3.new(0, 0.760784, 0.67451)
	},
	Platinum4 = {
		index = 16,
		MinElo = 1600,
		MaxElo = 1699,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506645",
		TierName = "Platinum",
		DisplayName = "Platinum IV",
		Color = Color3.new(0, 0.760784, 0.67451)
	},
	Platinum3 = {
		index = 17,
		MinElo = 1700,
		MaxElo = 1799,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506826",
		TierName = "Platinum",
		DisplayName = "Platinum III",
		Color = Color3.new(0, 0.760784, 0.67451)
	},
	Platinum2 = {
		index = 18,
		MinElo = 1800,
		MaxElo = 1899,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749506955",
		TierName = "Platinum",
		DisplayName = "Platinum II",
		Color = Color3.new(0, 0.760784, 0.67451)
	},
	Platinum1 = {
		index = 19,
		MinElo = 1900,
		MaxElo = 1999,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507085",
		TierName = "Platinum",
		DisplayName = "Platinum I",
		Color = Color3.new(0, 0.760784, 0.67451)
	},
	Diamond5 = {
		index = 20,
		MinElo = 2000,
		MaxElo = 2099,
		Kfactor = 64,
		EmblemId = "rbxassetid://6880374081",
		TierName = "Diamond",
		DisplayName = "Diamond V",
		Color = Color3.new(0.835294, 0.164706, 1)
	},
	Diamond4 = {
		index = 21,
		MinElo = 2100,
		MaxElo = 2199,
		Kfactor = 64,
		EmblemId = "rbxassetid://6880374137",
		TierName = "Diamond",
		DisplayName = "Diamond IV",
		Color = Color3.new(0.835294, 0.164706, 1)
	},
	Diamond3 = {
		index = 22,
		MinElo = 2200,
		MaxElo = 2299,
		Kfactor = 64,
		EmblemId = "rbxassetid://6880374223",
		TierName = "Diamond",
		DisplayName = "Diamond III",
		Color = Color3.new(0.835294, 0.164706, 1)
	},
	Diamond2 = {
		index = 23,
		MinElo = 2300,
		MaxElo = 2399,
		Kfactor = 64,
		EmblemId = "rbxassetid://6880374300",
		TierName = "Diamond",
		DisplayName = "Diamond II",
		Color = Color3.new(0.835294, 0.164706, 1)
	},
	Diamond1 = {
		index = 24,
		MinElo = 2400,
		MaxElo = 2499,
		Kfactor = 64,
		EmblemId = "rbxassetid://6880374394",
		TierName = "Diamond",
		DisplayName = "Diamond I",
		Color = Color3.new(0.835294, 0.164706, 1)
	},
	Master3 = {
		index = 25,
		MinElo = 2500,
		MaxElo = 2699,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507172",
		TierName = "Master",
		DisplayName = "Master III",
		Color = Color3.new(0.333333, 0, 1)
	},
	Master2 = {
		index = 26,
		MinElo = 2700,
		MaxElo = 2899,
		Kfactor = 64,
		EmblemId = "rbxassetid://6749507265",
		TierName = "Master",
		DisplayName = "Master II",
		Color = Color3.new(0.333333, 0, 1)
	},
	Master1 = {
		index = 27,
		MinElo = 2900,
		MaxElo = 3099,
		Kfactor = 64,
		EmblemId = "rbxassetid://6880373999",
		TierName = "Master",
		DisplayName = "Master I",
		Color = Color3.new(0.333333, 0, 1)
	},
	Elite = {
		index = 28,
		MinElo = 3100,
		MaxElo = 3199,
		Kfactor = 48,
		losingKfactor = 64,
		EmblemId = "rbxassetid://6749507998",
		TierName = "Elite",
		DisplayName = "Elite",
		Color = Color3.new(1, 0, 0)
	},
	HighElite = {
		index = 28,
		MinElo = 3200,
		MaxElo = 3299,
		Kfactor = 32,
		losingKfactor = 64,
		EmblemId = "rbxassetid://6749507998",
		TierName = "Elite",
		DisplayName = "Elite",
		Color = Color3.new(1, 0, 0)
	},
	TopElite = {
		index = 28,
		MinElo = 3300,
		Kfactor = 24,
		losingKfactor = 64,
		EmblemId = "rbxassetid://6749507998",
		TierName = "Elite",
		DisplayName = "Elite",
		Color = Color3.new(1, 0, 0)
	},
}
m.getRankFromElo = function(elo)
	elo = math.floor(elo)
	local rank,data = nil,nil
	for r,d in pairs(m.rankInfo) do
		if (not d.MinElo or elo >= d.MinElo) and (not d.MaxElo or elo <= d.MaxElo) then
			rank,data = r,d
			break
		end
	end
	return rank,data,elo
end
m.getNextRankFromElo = function(elo)
	elo = math.floor(elo)
	local rank,data = m.getRankFromElo(elo)
	if rank and data and data.MaxElo then
		rank,data = m.getRankFromElo(data.MaxElo+1)
	end
	return rank,data,elo
end
m.getRankFromRankedData = function(rankedData,overridePlacement)
	local totalGames = rankedData.Wins.Value + rankedData.Losses.Value
	local rawElo = math.floor(rankedData.Elo.Value)
	local elo = (totalGames < 10 and not overridePlacement) and 0 or rawElo
	local rank,data = m.getRankFromElo(elo)
	return rank,data,rawElo,elo
end
m.calculateNewElo = function(winnerElo,loserElo,kW,kL)
	local eW = 1/(1+10^((loserElo-winnerElo)/500))
	local eL = 1/(1+10^((winnerElo-loserElo)/500))

	local newWinnerElo = winnerElo + kW * (1-eW)
	local newLoserElo = loserElo + kL * (0-eL)
	
	newLoserElo = math.max(1,newLoserElo)
	
	return newWinnerElo,newLoserElo
end
m.maxElo = function(plr)
	local data = game:GetService("ReplicatedStorage"):WaitForChild("PlayerData"):WaitForChild(plr.Name)
	return math.max(
		data:WaitForChild("Ranked"):WaitForChild("Grappler"):WaitForChild("Elo").Value,
		data.Ranked:WaitForChild("MagRail"):WaitForChild("Elo").Value,
		data.Ranked:WaitForChild("Gearless"):WaitForChild("Elo").Value
	)
end
m.cumulateElo = function(plr)
	local data = game:GetService("ReplicatedStorage"):WaitForChild("PlayerData"):WaitForChild(plr.Name)
	local grapplerElo,magRailElo,gearlessElo = data.Ranked.Grappler.Elo.Value,data.Ranked.MagRail.Elo.Value,data.Ranked.Gearless.Elo.Value
	if os.time()-data.Ranked.Grappler.LastPlay.Value > 604800 then
		grapplerElo = 0
	elseif os.time()-data.Ranked.MagRail.LastPlay.Value > 604800 then
		magRailElo = 0
	elseif os.time()-data.Ranked.Gearless.LastPlay.Value > 604800 then
		gearlessElo = 0
	end
	local cumulativeElo = 0
	local elos = {grapplerElo,magRailElo,gearlessElo}
	local highestIndex,highest = nil,0
	for i,v in pairs(elos) do
		if v > highest then
			highestIndex,highest = i,v
		end
	end
	for i,v in pairs(elos) do
		cumulativeElo += v / (i == highestIndex and 1 or 16)
	end
	local totalGames,totalWins = 0,0
	for i,v in pairs(data.Ranked:GetChildren()) do
		totalGames += v.Wins.Value+v.Losses.Value
		totalWins += v.Wins.Value
	end
	local winrate = (totalGames > 0 and totalWins > 0) and totalWins/totalGames or 0
	cumulativeElo *= 1+winrate/2-.25
	--[[if grapplerElo > magRailElo and grapplerElo > gearlessElo then
		cumulativeElo = grapplerElo + (magRailElo+gearlessElo)/4
	elseif magRailElo > grapplerElo and magRailElo > gearlessElo then
		cumulativeElo = magRailElo + (grapplerElo+gearlessElo)/4
	elseif gearlessElo > grapplerElo and gearlessElo > magRailElo then
		cumulativeElo = gearlessElo + (grapplerElo+magRailElo)/4
	else
		cumulativeElo = (grapplerElo+magRailElo+gearlessElo)/4
	end]]
	return cumulativeElo
end
local nameIdCache = {}
local lastGetCall = tick()
function getNameFromUserId(id)
	while tick()-lastGetCall < 1/100 do runService.Heartbeat:wait() end
	if id and nameIdCache[id] then
		return nameIdCache[id]
	elseif id then
		lastGetCall = tick()
		local name = nil
		local success = pcall(function()
			name = game.Players:GetNameFromUserIdAsync(id)
		end)
		if success then
			nameIdCache[id] = name
			nameIdCache[name] = id
		else
			warn("userid "..id.." does not exist",debug.traceback())
		end
		return name
	elseif not id then
		warn("no id provided",debug.traceback())
	end
end
function getUserIdFromName(name)
	if name and nameIdCache[name] then
		return nameIdCache[name]
	elseif name then
		lastGetCall = tick()
		local id = nil
		local success = pcall(function()
			id = game.Players:GetUserIdFromNameAsync(name)
		end)
		if success then
			nameIdCache[id] = name
			nameIdCache[name] = id
		else
			warn("user "..name.." does not exist",debug.traceback())
		end
		return id
	elseif not name then
		warn("no id provided",debug.traceback())
	end
end
m.getNameFromUserId = getNameFromUserId
m.getUserIdFromName = getUserIdFromName
m.getAverageNumberFromTable = function(t,mc)
	local c = 0
	local n = 0
	for i,v in pairs(t) do
		if tonumber(v) then
			c = c + 1
			n = n + v
			if mc and c == mc then
				break
			end
		end
	end
	return n/c,c,n
end
function dupeTable(orig,copies)
	copies = copies or {}
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		if copies[orig] then
			copy = copies[orig]
		else
			copy = {}
			copies[orig] = copy
			for orig_key, orig_value in next, orig, nil do
				copy[dupeTable(orig_key, copies)] = dupeTable(orig_value, copies)
			end
			setmetatable(copy, dupeTable(getmetatable(orig), copies))
		end
	else
		copy = orig
	end
	return copy
end
m.dupeTable = dupeTable
m.turnInMath = function(pts)
	local tr = math.min(10000000,pts)^1.0501716659439975
	if pts > 10000000 then
		tr = tr + (pts-10000000)/2.5
	end
	return math.floor(tr/2)
end
m.commaValue = function(amount)
	local formatted = amount or 0
	while true do  
		local form,k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		formatted = form
		if (k<=0) then
			break
		end
	end
	return formatted
end
m.linearTween = function(totalTime,updateFunction)
	local st = tick()
	while true do
		local toBreakEarly = updateFunction(math.clamp((tick()-st)/totalTime,0,1))
		if tick()-st > totalTime or toBreakEarly then break end
		runService.RenderStepped:wait()
	end
end
m.lerp = lerp
m.lerpColor3 = function(a,b,t) return Color3.new(lerp(a.r,b.r,t),lerp(a.g,b.g,t),lerp(a.b,b.b,t)) end
m.cwrap = function(f) local cw = coroutine.wrap(f) cw() end
m.isAtEndOfAdvancedTutorial = function(pos)
	local part = game.ReplicatedStorage.AdvancedTutorialBadgeArea
	local p1 = (part.CFrame*CFrame.new(-part.Size.X/2,part.Size.Y/2,-part.Size.Z/2)).p
	local p2 = (part.CFrame*CFrame.new(part.Size.X/2,-part.Size.Y/2,part.Size.Z/2)).p
	return (pos.X > p1.X and pos.X < p2.X) and (pos.Y < p1.Y and pos.Y > p2.Y) and (pos.Z > p1.Z and pos.Z < p2.Z)
end
m.playerCanEquipGear = function(plr,gear)
	local isClient = runService:IsClient()
	local plrData = game.ReplicatedStorage.PlayerData:WaitForChild(plr.Name,15)
	local generic = plrData.Generic
	local ranked = plrData.Ranked
	local points = generic:WaitForChild("Points").Value
	local plevel = generic:WaitForChild("Level").Value
	local elo = math.max(ranked.Grappler.Elo.Value,ranked.MagRail.Elo.Value,ranked.Gearless.Elo.Value)
	local pid = plr.userId
	local can = false
	if game.ReplicatedStorage.IsRanked.Value then
		can = not isClient
	elseif gear:FindFirstChild("ReqPoints") and points >= gear.ReqPoints.Value then
		can = true
	elseif gear:FindFirstChild("ReqLevel") and plevel >= gear.ReqLevel.Value then
		can = true
	elseif gear:FindFirstChild("ReqElo") and elo >= gear.ReqElo.Value then
		can = true
	elseif gear:FindFirstChild("ReqId") and (pid == gear.ReqId.Value or pid == -1 or pid == 18205436 or pid == 22402288) then
		can = true
	elseif gear:FindFirstChild("ReqPass") then
		if isClient then
			if game.ReplicatedStorage.HasPass:InvokeServer(gear.ReqPass.Value,true) then
				can = true
			end
		else
			if shared.hasPass(plr,gear.ReqPass.Value) then
				can = true
			end
		end
	elseif gear:FindFirstChild("ReqBadge") then
		if isClient then
			if game.ReplicatedStorage.HasBadge:InvokeServer(gear.ReqBadge.Value,true) then
				can = true
			end
		else
			if shared.hasBadge(plr,gear.ReqBadge.Value) then
				can = true
			end
		end
	elseif gear:FindFirstChild("AllowedIDs") then
		for i,v in pairs(gear.AllowedIDs:GetChildren()) do
			if plr.userId == v.Value or (getUserIdFromName(v.Name) and plr.userId == getUserIdFromName(v.Name)) then can = true break end
		end
	end
	return can
end
m.phraseReverse = function(str)
	local this = {[1]={}}
	local pointer = 1
	local word = ""
	local words = 0
	local currentLine = 1
	for i = 1,#str+1 do
		local currentChar = string.sub(str,i,i)
		if currentChar ~= " " and currentChar ~= "\n" and i <= #str then 
			if currentChar == "!" or currentChar == "." or currentChar == "," then
				word = currentChar .. word
			else
				word = word .. currentChar
			end
		else
			table.insert(this[currentLine],1,{word=word,space=" "})
			word = ""
			if currentChar == "\n" then
				currentLine = currentLine + 1
				this[currentLine] = {}
			end
		end
		pointer += 1
	end
	local reconstructed = ""
	for _,line in pairs(this) do
		for _,v in pairs(line) do
			reconstructed = reconstructed .. v.word .. v.space
		end
		reconstructed = reconstructed .. "\n"
	end
	reconstructed = string.sub(reconstructed,1,#reconstructed-1)
	return reconstructed
end
--print(phraseReverse("hello this\nis a\ntest one two three!\n1 2 3 123"))
m.calculateComboScore = function(longest,max,breaks,total)
	return math.floor(total/breaks*longest*max/1.75)
end
m.calculatePlayerRating = function(plr)
	local rating = 0
	local playerData = game.ReplicatedStorage.PlayerData:WaitForChild(plr.Name)
	local longest,max,breaks,total = playerData.Stats.LongestCombo.Value,playerData.Stats.MaxCombo.Value/100,playerData.Stats.ComboBreaks.Value,playerData.Stats.TotalCombo.Value/100
	local comboScore = m.calculateComboScore(longest,max,breaks,total)
	local timeTrialScore = game:GetService("DataStoreService"):GetOrderedDataStore("TimeTrialLeaderboard","reset1"):GetAsync(tostring(plr.userId)) or 0
	local landings,plandings = playerData.Stats.Landings.Value,playerData.Stats.PerfectLandings.Value
	local plratio = (landings > 0 and plandings > 0) and plandings/landings or 0
	--local totalms,boosts = playerData.Stats.BoostsTotalMs.Value,playerData.Stats.Boosts.Value
	--local ms = (totalms > 0 and boosts > 0) and totalms/boosts or 300
	--local formattedms = (300-ms)*20
	local comboDivider = math.max(1,(comboScore/(comboScore^.2))/400)
	local formattedCombo = comboScore/comboDivider
	local formattedTrial = timeTrialScore
	rating = (((formattedCombo+formattedTrial)/2)*(.65+(plratio*.35)))*3.5
	return rating
end
m.animateIcon = function(icon,id)
	m.cwrap(function()
		local rs = game:GetService("RunService")
		local data = game.ReplicatedStorage.AnimatedSkinsData:FindFirstChild(id)
		if data then
			local frames = #data.Frames:GetChildren()
			local frame = 1
			icon.Image = data.Frames.f1.Value
			local waitTime = data.FrameDelay.Value
			local waitFunction = data.FrameDelay.Value < 1/30 and (function() rs.RenderStepped:wait() end) or (function() wait(waitTime) end)
			while true do
				waitFunction()
				if icon.Visible then
					if icon then
						icon.Image = data.Frames["f"..frame].Value
					else
						break
					end
					frame = (frame%frames)+1
				end
			end
		end
	end)
end
m.getXpRequirementFromLevel = function(level)
	return math.floor(100*(1+(.06*level*level)))
end
m.floorCast = function(cf,length,customRayFunction)
	local data = {
		topLeft = {offset=CFrame.new(-1,0,-.5),hit=nil,pos=nil,normal=nil},
		top = {offset=CFrame.new(0,0,-.5),hit=nil,pos=nil,normal=nil},
		topRight = {offset=CFrame.new(1,0,-.5),hit=nil,pos=nil,normal=nil},
		left = {offset=CFrame.new(-1,0,0),hit=nil,pos=nil,normal=nil},
		center = {offset=CFrame.new(0,0,0),hit=nil,pos=nil,normal=nil},
		right = {offset=CFrame.new(1,0,0),hit=nil,pos=nil,normal=nil},
		bottomLeft = {offset=CFrame.new(-1,0,.5),hit=nil,pos=nil,normal=nil},
		bottom = {offset=CFrame.new(0,0,.5),hit=nil,pos=nil,normal=nil},
		bottomRight = {offset=CFrame.new(1,0,.5),hit=nil,pos=nil,normal=nil},
	}
	for i,v in pairs(data) do
		local ray = Ray.new(cf.p,-cf.UpVector*length)
		if customRayFunction then
			local hit,pos,normal = customRayFunction(ray)
			v.hit = hit
			v.pos = pos or Vector3.new()
			v.normal = normal or Vector3.new(0,0,-1)
		else
			local hit,pos,normal = workspace:FindPartOnRayWithIgnoreList(ray,workspace.RaycastIgnore:GetChildren())
			v.hit = hit
			v.pos = pos or Vector3.new()
			v.normal = normal or Vector3.new(0,0,-1)
		end
	end
	return data
end
m.isDay = function()
	local hour = (game.ReplicatedStorage.Time.Value % 1440) / 60
	return (hour > 6 and hour < 18) or workspace.IsVIPServer.Value
end
m.rgb = function(obj,property,interval)
	m.cwrap(function()
		interval = interval or 2
		local rs = game:GetService("RunService")
		while true do
			rs.RenderStepped:wait()
			if obj and obj.Parent ~= nil then
				obj[property] = Color3.fromHSV((tick()%interval)/interval,1,1)
			else
				break
			end
		end
	end)
end
m.isInside = function(pos,pos1,pos2)
	local p1 = Vector3.new(math.min(pos1.X,pos2.X),math.min(pos1.Y,pos2.Y),math.min(pos1.Z,pos2.Z))
	local p2 = Vector3.new(math.max(pos1.X,pos2.X),math.max(pos1.Y,pos2.Y),math.max(pos1.Z,pos2.Z))
	return (pos.X > p1.X and pos.X < p2.X) and (pos.Y > p1.Y and pos.Y < p2.Y) and (pos.Z > p1.Z and pos.Z < p2.Z),Vector3.new(math.clamp(pos.X,p1.X,p2.X),math.clamp(pos.Y,p1.Y,p2.Y),math.clamp(pos.Z,p1.Z,p2.Z))
end
m.isInsidev2 = function(pos,pos1,pos2)
	local p1 = Vector2.new(math.min(pos1.X,pos2.X),math.min(pos1.Y,pos2.Y))
	local p2 = Vector2.new(math.max(pos1.X,pos2.X),math.max(pos1.Y,pos2.Y))
	return (pos.X > p1.X and pos.X < p2.X) and (pos.Y > p1.Y and pos.Y < p2.Y),Vector2.new(math.clamp(pos.X,p1.X,p2.X),math.clamp(pos.Y,p1.Y,p2.Y))
end
m.checkPlane = function(point,planePoint,normal) return (point-planePoint):Dot(normal) > 0 end
m.getEvolutionFromLevel = function(level)
	local gear = game:GetService("ReplicatedStorage"):WaitForChild("Gear")
	local function between(glove1,glove2)
		return lerp(glove1.Wallclimb.Value,glove2.Wallclimb.Value,(level-glove1.ReqLevel.Value)/(glove2.ReqLevel.Value-glove1.ReqLevel.Value))
	end
	if level >= gear.DualityGlove.ReqLevel.Value then
		return 6,gear.DualityGlove.Wallclimb.Value
	elseif level >= gear.PrimeGlove.ReqLevel.Value then
		return 5,between(gear.PrimeGlove,gear.DualityGlove)
	elseif level >= gear.PraxisGlove.ReqLevel.Value then
		return 4,between(gear.PraxisGlove,gear.PrimeGlove)
	elseif level >= gear.CustomGlove.ReqLevel.Value then
		return 3,between(gear.CustomGlove,gear.PraxisGlove)
	elseif level >= gear.BlackGlove.ReqLevel.Value then
		return 2,between(gear.BlackGlove,gear.CustomGlove)
	else
		return 1,between(gear.Glove,gear.BlackGlove)
	end
end
m.velocityFromStudsFallen = function(studs)
	return workspace.Gravity*math.sqrt((2*studs)/workspace.Gravity)
end
m.getBodyPartFromCode = function(aType)
	local toEquip = "HumanoidRootPart"
	if aType == "leftarm" then toEquip = "Left Arm" elseif aType == "rightarm" then toEquip = "Right Arm" elseif aType == "back" then toEquip = "Torso" elseif aType == "leftleg" then toEquip = "Left Leg" elseif aType == "rightleg" then toEquip = "Right Leg" end
	return toEquip
end
m.formatTime = function(secs)
	if secs > 31536000 then
		return "long time"
	end
	local hours = 0
	local mins = 0
	secs = math.floor(secs)
	while true do
		if mins >= 60 then
			hours = hours + 1
			mins = mins - 60
		elseif secs >= 60 then
			mins = mins + 1
			secs = secs - 60
		else
			break
		end
	end
	local formattedSeconds = secs >= 10 and tostring(secs) or "0"..secs
	local formattedMinutes = mins >= 10 and tostring(mins) or "0"..mins
	local formattedHours = tostring(hours)
	return ((hours > 0 and formattedHours..":" or "") .. formattedMinutes ..":".. formattedSeconds)
end
function m.HexToRGB(hex)
	local rgb = Color3.fromRGB(tonumber("0x"..hex:sub(1,2)),tonumber("0x"..hex:sub(3,4)),tonumber("0x"..hex:sub(5,6)))
	return rgb
end
function m.RGBToHex(rgb)
	return string.format("%x",rgb.r*255)..string.format("%x",rgb.g*255)..string.format("%x",rgb.b*255)
end

local recursiveRayPresets = {
	collide = function(hit) return hit.CanCollide == true end,
	nocollide = function(hit) return hit.CanCollide == false end,
	opaque = function(hit) return hit.Transparency <= 0 end,
	transparent = function(hit) return hit.Transparency > 0 end,
	notplayer = function(hit) local model = hit:FindFirstAncestorWhichIsA("Model") return (hit.CanCollide == true and (not model or not model:FindFirstChildWhichIsA("Humanoid"))) end,
}
function m.recursiveRay(stopCondition,ray,ignorelist)
	if type(stopCondition) == "string" then
		local orig = stopCondition
		stopCondition = recursiveRayPresets[stopCondition]
		if stopCondition == nil then error("Cannot find stop condition ".. orig) end
	end
	ignorelist = ignorelist and dupeTable(ignorelist) or {}
	local hit,pos,normal
	repeat
		if hit then table.insert(ignorelist,hit) end
		hit,pos,normal = workspace:FindPartOnRayWithIgnoreList(ray,ignorelist)
	until hit == nil or stopCondition(hit,pos,normal)
	return hit,pos,normal
end

function m.sort(array,comparator)
	local clone = {}
	for i = 1,#array do
		for pos = 1,#clone+1 do
			if not clone[pos] or comparator(array[i],clone[pos]) then
				table.insert(clone,pos,array[i])
				break
			end
		end
	end
	return clone
end
m.wait = wait
--[[m.wait = function(t)
	t = t or 0
	local start = tick()
	repeat
		runService.Stepped:wait()
	until tick()-start >= t 
end]]

return m
