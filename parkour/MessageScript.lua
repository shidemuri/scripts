local m = {}

function cwrap(f) coroutine.wrap(f)() end
local tweenService = game:GetService("TweenService")
function commaValue(amount)
	local formatted = amount or 0
	while true do  
		local form,k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		formatted = form
		if (k==0) then
			break
		end
	end
	return formatted
end
function m.createMessage(data,customEndFunction)
	local plr = game.Players.LocalPlayer
	local nm = plr.PlayerGui:WaitForChild("Message"):Clone()
	cwrap(function()
		nm.Name = data.name or nm.Name
		nm.Text = data.text
		nm.TextColor3 = data.colour or Color3.new(1,1,1)
		nm.Position = UDim2.new(.5,0,.5,0)
		nm.Position = data.position and nm.Position + UDim2.new(0,data.position.X,0,data.position.Y) or nm.Position
		if data.randompos then
			nm.Position = nm.Position + UDim2.new(0,math.random(-80,80),0,math.random(-80,80))
		end
		nm.Font = data.font or Enum.Font.SourceSans
		nm.TextSize = data.fontSize or 32
		nm.TextStrokeColor3 = data.strokeColour or Color3.new()
		nm.TextStrokeTransparency = data.strokeTransparency or 1
		nm.Visible = true
		nm.Parent = plr.PlayerGui:WaitForChild("MessagesGui")
		if customEndFunction then customEndFunction(nm,data) else
			local origstroketrans,origpos = nm.TextStrokeTransparency,nm.Position
			local speed = data.speed or 1
			local t,st = 1/speed,tick()
			repeat
				local delta = (tick()-st)/t
				nm.Position = origpos + UDim2.new(0,0,0,-60*delta)
				nm.TextTransparency = delta
				nm.TextStrokeTransparency = origstroketrans+(delta*(1-origstroketrans))
				game["Run Service"].RenderStepped:wait()
			until tick()-st >= t
		end
		nm:remove()
	end)
	return nm
end
function m.bottomMessage(data)
	local plr = game.Players.LocalPlayer
	local nm = plr.PlayerGui:WaitForChild("BottomMessage"):Clone()
	cwrap(function()
		nm.Text = data.text
		nm.TextColor3 = data.colour or Color3.new(1,1,1)
		nm.Position = UDim2.new(.5,0,.8,0)
		nm.Position = data.position and nm.Position + UDim2.new(0,data.position.X,-.3,data.position.Y) or nm.Position
		if data.position or data.randompos then
			nm.Name = "BottomMessageNoDownShift"
		end
		if data.randompos then
			nm.Position = nm.Position + UDim2.new(0,math.random(-80,80),0,math.random(-80,80))
		end
		nm.Font = data.font or Enum.Font.SourceSansBold
		nm.TextSize = data.fontSize or 32
		for i,v in pairs(plr.PlayerGui:WaitForChild("MessagesGui"):GetChildren()) do
			if v.Name == "BottomMessage" then
				 v.Position = v.Position + UDim2.new(0,0,0,nm.TextSize)
			end
		end
		nm.TextStrokeColor3 = data.strokeColour or Color3.new()
		nm.TextStrokeTransparency = data.strokeTransparency or 1
		nm.Visible = true
		nm.Parent = plr.PlayerGui.MessagesGui
		local origstroketrans,origpos = nm.TextStrokeTransparency,nm.Position
		local speed = data.speed or 1
		local t = 3/speed
		wait(t)
		local st = tick()
		repeat
			local delta = (tick()-st)/t
			nm.TextTransparency = delta
			nm.TextStrokeTransparency = origstroketrans+(delta*(1-origstroketrans))
			game["Run Service"].RenderStepped:wait()
		until tick()-st >= t
		nm:remove()
	end)
end
function m.createPopup(text,textSize,mustread)
	local plr = game.Players.LocalPlayer
	local popup = plr.PlayerGui.GeneralPopup:Clone()
	popup.Label.Text = text or ""
	popup.Label.TextSize = textSize or 18
	popup.Close.MouseButton1Click:connect(function() popup:destroy() end)
	popup.Parent = plr.PlayerGui:WaitForChild("ScreenGui")
	if mustread then
		popup.Close.Visible = false
		cwrap(function()
			wait(5)
			popup.Close.Visible = true
		end)
	end
	return popup
end
function m.pointsPopup(added,addedxp,rawpts,hasPointsPass,metatitle,customMessageData)
	local text = "+".. commaValue(math.floor(added))
	if rawpts > 100 then text = text.."!" end
	local xptext = ""
	if addedxp > 0 then xptext = xptext .. "(+" .. commaValue(math.floor(addedxp)) .. ")" end
	if added < 1 and added >= 0 then text = "" end
	local isWeekend = workspace.Weekend.Value
	local fontsize = math.clamp(28+(18*(rawpts/(150))),28,46)
	local msgPos = Vector2.new(math.random(-90,90),math.random(-45,45))
	local colour = Color3.new(1,1,1)
	if game.ReplicatedStorage.IsHalloween.Value then
		if game.ReplicatedStorage.IsBloodmoon.Value then
			colour = Color3.new(1,0,0)
		else
			colour = Color3.new(1,.5,0)
		end
	else
		if shared.env.isDay() then
			colour = isWeekend and Color3.new(0,1,0) or colour
		else
			colour = isWeekend and Color3.new(0,1,1) or Color3.new(0,.25,.5)
		end
	end
	local messageData = {
		name = "pointspopup",
		text=customMessageData and customMessageData.text or text,
		colour=customMessageData and customMessageData.colour or colour,
		position=customMessageData and customMessageData.pos or msgPos,
		font=customMessageData and customMessageData.font or (isWeekend and Enum.Font.SourceSansItalic or Enum.Font.SourceSans),
		fontSize=customMessageData and customMessageData.fontsize or fontsize,
		strokeColour=customMessageData and customMessageData.strokeColour or (hasPointsPass and Color3.new(1,1,.5) or Color3.new()),
		strokeTransparency=customMessageData and customMessageData.strokeTransparency or (hasPointsPass and .5 or 1)
	}
	local plr = game.Players.LocalPlayer
	local fancyPoints = true
	if plr and plr.PlayerGui.ScreenGui:FindFirstChild("PointsBuildup") then
		plr.PlayerGui.ScreenGui.PointsBuildup.Label.TextColor3 = messageData.colour
		plr.PlayerGui.ScreenGui.PointsBuildup.Label.TextStrokeColor3 = messageData.strokeColour
		plr.PlayerGui.ScreenGui.PointsBuildup.Label.TextStrokeTransparency = messageData.strokeTransparency
		plr.PlayerGui.ScreenGui.PointsBuildup.Label.Font = messageData.font
		local localSettings = game.ReplicatedStorage:FindFirstChild("PlayerData") and game.ReplicatedStorage.PlayerData:FindFirstChild(plr.Name) and game.ReplicatedStorage.PlayerData[plr.Name]:FindFirstChild("Settings")
		if localSettings then
			fancyPoints = localSettings:FindFirstChild("FancyPoints") and localSettings.FancyPoints.Value
		end
	end
	local customEndFunction = function(nm,data)
		local ti = TweenInfo.new(fancyPoints and (customMessageData and customMessageData.tweenTime or .65) or 1,fancyPoints and Enum.EasingStyle.Sine or Enum.EasingStyle.Linear,Enum.EasingDirection.In)
		local tween = tweenService:Create(nm,ti,{Position=UDim2.new(.5,fancyPoints and 0 or msgPos.X,0,235+(data.position.Y-msgPos.Y)),TextTransparency=1,TextStrokeTransparency=1})
		tween:Play()
		wait(fancyPoints and .65 or 1)
		if data.name == "pointspopup" then shared.pointsBuildup = shared.pointsBuildup+added end
	end
	m.createMessage(messageData,customEndFunction)
	m.createMessage({
		name = "experiencepopup",
		text=xptext,
		colour=Color3.new(1,1,1),
		position=msgPos+Vector2.new(0,(fontsize/2)+9),
		font=isWeekend and Enum.Font.SourceSansItalic or Enum.Font.SourceSans,
		fontSize=18,
		strokeColour=Color3.fromRGB(170,255,255),
		strokeTransparency=.8
	},customEndFunction)
	if metatitle then
		m.createMessage({
			name = "metatitle",
			text=metatitle,
			colour=Color3.new(.45,1,1),
			position=msgPos+Vector2.new(0,-(fontsize/2)-8),
			font=isWeekend and Enum.Font.SourceSansItalic or Enum.Font.SourceSans,
			fontSize=16,
			strokeColour=Color3.fromRGB(170,255,255),
			strokeTransparency=.8
		},customEndFunction)
	end
end

return m
