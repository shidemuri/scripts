--[[

sora wo miteiru to
chuu ni uku nanika wo mitsuketa	
yoku mitemiru to sore wa
kyodai na kurage datta

saizu wa hito no ookisa hodo
denchuu yori mo takaku tondeiru	

kono machi ni naze kita no ka
nan no tame ni kita no ka
soto wo aruku hito wa minn
herumetto wo kabutteiru

itsu kara iru no ka
doko kara kita no ka
dare mo shiranai
genkaku de mo ki no sei de mo nai
tashika ni soko ni iru

mado wo miteiru to
sora wo tobu nanika ga me ni tsuita
mado wo akeru to sore wa
kocchi ni chikazuitekita

kasa wa chiisaku ashi wa nagai
yoru ni naru to aojiroku hikaru no da

atama wo tsukande kuttsuite
zugaikotsu wo tokashiteiku n da
noumiso wo tabetsukushite
zoushokushiteku no da

emono wo sagashi chikazuite
ashi de tsukande mochiageru
takai tokoro kara otoshi
ikita mama tabeteku no

atama wo tsukande kuttsuite
zugaikotsu wo tokashiteiku n da
noumiso wo tabetsukushite
zoushokushiteku no da

emono wo sagashi chikazuite
ashi de tsukande mochiageru
takai tokoro kara otoshi
ikita mama tabeteku no

padero#0001

]]

module = {}

if not (syn or protect_gui or gethui) then
    warn("WARNING: protect_gui / gethui is not supported by your exploit. Using generic polyfill instead.")
    protect = function(screengui)
		screengui.Parent = game:GetService('CoreGui')
		coroutine.wrap(function()
			while task.wait() and screengui do
				screengui.Name = game:GetService('HttpService'):GenerateGUID()
			end
		end)()
	end
else
    if syn then 
		protect = syn.protect_gui 
	elseif protect_gui then 
		protect = protect_gui
	else protect = function(s) 
		s.Parent = gethui() 
	end
end end

function tween(obj, tweeninfo, goal)
	local t = game:GetService('TweenService'):Create(obj, tweeninfo, goal)
	t:Play()
end

function Dragify(Frame)
	local dragToggle = nil
	local dragSpeed = 0.1
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local startPos = Frame.Position
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		Frame.Position = Position
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
function module:New(name)
    local window = {}
        ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = game:GetService("CoreGui")
        protect(ScreenGui)
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = ScreenGui
        Main.BackgroundColor3 = Color3.fromRGB(38, 45, 71)
        Main.BorderColor3 = Color3.fromRGB(100, 100, 100)
        Main.Position = UDim2.new(0.341675043, 0, 0.403705865, 0)
        Main.Size = UDim2.new(0, 602, 0, 403)

        local UIStroke = Instance.new('UIStroke')
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.fromRGB(102, 61, 255)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 2.5
        UIStroke.Transparency = 0
        UIStroke.Parent = Main

        Dragify(Main)

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Main

        local Title = Instance.new("TextLabel")
        Title.Name = name or ''
        Title.Parent = Main
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.0307328608, 0, 0, 0)
        Title.Size = UDim2.new(0, 410, 0, 37)
        Title.Font = Enum.Font.SourceSans
        Title.Text = name or ''
        Title.TextColor3 = Color3.fromRGB(255,255,255)
        Title.TextSize = 25.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local close = Instance.new("ImageButton")
        local min = Instance.new("ImageButton")
        close.Name = "close"
        close.Parent = Main
        close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        close.BackgroundTransparency = 1.000
        close.Position = UDim2.new(0.936877131, 0, 0.0148883387, 0)
        close.Size = UDim2.new(0, 25, 0, 25)
        close.Image = "http://www.roblox.com/asset/?id=6236220207"

        close.MouseButton1Click:Connect(function()
            ScreenGui:Destroy()
        end)

        min.Name = "min"
        min.Parent = Main
        min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        min.BackgroundTransparency = 1.000
        min.Position = UDim2.new(0.877076447, 0, 0.0148883387, 0)
        min.Size = UDim2.new(0, 25, 0, 25)
        min.Image = "rbxassetid://8836139185"

		local footer = Instance.new("TextLabel")
		footer.Parent = Main
		footer.Name = 'footer'
		footer.Text = ''
		footer.Position = UDim2.new(0, 20, 0, 380)
		footer.TextXAlignment = Enum.TextXAlignment.Left
		footer.Font = Enum.Font.Ubuntu
		footer.TextSize = 20
		footer.TextColor3 = Color3.fromRGB(255,255,255)

		coroutine.wrap(function()
		avatar = Instance.new("ImageLabel")
		avatar.Parent = Main
		avatar.Name = 'avatar'
		avatar.Position = UDim2.new(0, 550, 0, 359)
		avatar.Size = UDim2.new(0, 40, 0, 40)
		avatar.BackgroundTransparency = 1
		avatar.Image = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
		Instance.new('UICorner', avatar).CornerRadius = UDim.new(0, 20)
		end)()

        local tabbuttons = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")

        tabbuttons.Name = "tab buttons"
        tabbuttons.Parent = Main
        tabbuttons.Active = true
        tabbuttons.ScrollBarImageColor3 = Color3.fromRGB(69, 69, 107)
        tabbuttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabbuttons.BackgroundColor3 = Color3.fromRGB(26, 32, 58)
        tabbuttons.BorderSizePixel = 0
        tabbuttons.Position = UDim2.new(0, 0, 0.0918114111, 0)
        tabbuttons.Size = UDim2.new(0, 182, 0, 320)


        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0, 0)
        padding.Parent = Main

        local minimized = false
        local currenttab = nil

		local greetings = Instance.new("TextLabel")
		greetings.Parent = Main
		greetings.Name = 'greetings'
		greetings.Font = Enum.Font.Ubuntu
		greetings.Text = 'Hello, ' .. game.Players.LocalPlayer.DisplayName
		greetings.TextColor3 = Color3.fromRGB(255, 255, 255)
		greetings.BackgroundTransparency = 1
		greetings.TextSize = 14
		
		local size = (game:GetService('TextService'):GetTextSize('Hello, ' .. game.Players.LocalPlayer.DisplayName, 14, Enum.Font.Ubuntu, Vector2.new(Main.Size))).X
		greetings.Position = UDim2.new(0, 580-size, 0, 381)

        min.MouseButton1Click:Connect(function()
            minimized = not minimized
            if minimized then
                for _,v in pairs(Main:GetChildren()) do
                    if v:IsA('Frame') or v:IsA('ScrollingFrame') then
                        if v.Visible == true then currenttab = v end
                        v.Visible = false
                    end
                end
                Main.Size = UDim2.new(0, 602, 0, 40)
                padding.PaddingTop = UDim.new(0, 5)
                Title.Position = UDim2.new(0.031,0,-0.12,0)
				footer.Visible = false
				avatar.Visible = false
				greetings.Visible = false
               --Main.Position = UDim2.new(0.341675043, 0, 0.403705865, 0)
                --min.Image = "rbxassetid://8836139185"
            else
                Main.Size = UDim2.new(0, 602, 0, 403)
                if currenttab then currenttab.Visible = true end
                tabbuttons.Visible = true
                Title.Position = UDim2.new(0.031,0,0,0)
                padding.PaddingTop = UDim.new(0, 0)
				footer.Visible = true
				avatar.Visible = true
				greetings.Visible = true
                --Main.Position = UDim2.new(0.341675043, 0, 0.403705865, 0)
                --min.Image = "rbxassetid://8836139185"
            end
        end)

        local tabspacing = Instance.new("TextButton")
        tabspacing.Name = "tabspacing"
        tabspacing.Parent = tabbuttons
        tabspacing.Active = false
        tabspacing.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
        tabspacing.BackgroundTransparency = 1.000
        tabspacing.Position = UDim2.new(0.0449172594, 0, -3.76760227e-07, 0)
        tabspacing.Selectable = false
        tabspacing.Size = UDim2.new(0, 385, 0, 1)
        tabspacing.Font = Enum.Font.Roboto
        tabspacing.Text = " "
        tabspacing.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabspacing.TextSize = 22.000

        UIListLayout.Parent = tabbuttons
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 13)
        function window:SetMainTab(tab)
            if tab.Tab:IsA('Frame') and tab.Tab.Parent == Main then
                for _,v in next, Main:GetChildren() do
                    if v.Name == tab.Tab.Name then v.Visible = false end
                end
            end
            tab.Tab.Visible = true
        end
        function window:NewTab(namee)
            local tab = {}
            local Tab = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            Tab.Name = namee
            Tab.Parent = Main
            Tab.BackgroundColor3 = Color3.fromRGB(26,32,58)
            Tab.Position = UDim2.new(0.302325577, 0, 0.0918114111, 0)
            Tab.Size = UDim2.new(0, 420, 0, 320)
            Tab.Visible = false

			local currenttab = Instance.new("TextLabel")
			currenttab.Parent = Tab
			currenttab.Name = 'currenttab'
			currenttab.Text = namee
			currenttab.Position = UDim2.new(0, 20, 0, 11)
			currenttab.TextXAlignment = Enum.TextXAlignment.Left
			currenttab.TextSize = 14
			currenttab.Font = Enum.Font.Ubuntu
			currenttab.TextColor3 = Color3.fromRGB(255,255,255)

            UICorner_2.CornerRadius = UDim.new(0, 5)
            UICorner_2.Parent = Tab

            local tabbutton = Instance.new("TextButton")
            tabbutton.Name = "tabbutton"
            tabbutton.Parent = tabbuttons
            tabbutton.BackgroundColor3 = Color3.fromRGB(69, 69, 107)
            tabbutton.Position = UDim2.new(0.0405405387, 0, 0.0399999991, 0)
            tabbutton.Size = UDim2.new(0, 149, 0, 39)
            tabbutton.Font = Enum.Font.Ubuntu
            tabbutton.Text = namee
            tabbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
            tabbutton.TextSize = 17.000
			tabbutton.AutoButtonColor = false

			tabbutton.MouseEnter:Connect(function()
				tween(tabbutton,TweenInfo.new(0.4,Enum.EasingStyle.Linear),{BackgroundColor3 = Color3.fromRGB(103, 103, 158)})
			end)
			tabbutton.MouseLeave:Connect(function()
				tween(tabbutton,TweenInfo.new(0.4,Enum.EasingStyle.Linear),{BackgroundColor3 = Color3.fromRGB(69, 69, 107)})
			end)

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = tabbutton

            tabbutton.MouseButton1Click:Connect(function()
                for _,v in pairs(Main:GetChildren()) do
                    if v:IsA('Frame') and v.Name ~= 'tab buttons' then
                        v.Visible = false
                    end
                end
                Tab.Visible = true
            end)

            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Parent = Tab
            ScrollingFrame.Active = true
			ScrollingFrame.Size = UDim2.new(0, 420, 0, 261)
            ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(69, 69, 107)
            ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollingFrame.BackgroundTransparency = 1.000
            ScrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.Position = UDim2.new(0, 0, 0.082, 0)
            ScrollingFrame.CanvasSize = UDim2.new(0, 0, 15, 0)
			ScrollingFrame.Size = UDim2.new(0, 420, 0, 294)
            Tab.ChildAdded:Connect(function(child)
                if child.Name == 'SearchBar' then 
                    ScrollingFrame.Size = UDim2.new(0, 420, 0, 261)
                    ScrollingFrame.Position = UDim2.new(0, 0, 0.183206141, 0)
                end
            end)
            Tab.ChildRemoved:Connect(function(child)
                if child.Name == 'SearchBar' then 
                    ScrollingFrame.Size = UDim2.new(0, 420, 0, 294)
                    ScrollingFrame.Position = UDim2.new(0, 0, 0.082, 0)
                end
            end)

            local UIListLayout = Instance.new("UIListLayout")
            UIListLayout.Parent = ScrollingFrame
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 7)

            local tabspacing = Instance.new("TextButton")
            tabspacing.Name = "tabspacing"
            tabspacing.Parent = ScrollingFrame
            tabspacing.Active = false
            tabspacing.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
            tabspacing.BackgroundTransparency = 1.000
            tabspacing.Position = UDim2.new(0.0449172594, 0, -3.76760227e-07, 0)
            tabspacing.Selectable = false
            tabspacing.Size = UDim2.new(0, 385, 0, 1)
            tabspacing.Font = Enum.Font.Roboto
            tabspacing.Text = " "
            tabspacing.TextColor3 = Color3.fromRGB(255, 255, 255)
            tabspacing.TextSize = 22.000

            function tab:NewLabel(text)
                local label = Instance.new("TextLabel")
                local UICorner_3 = Instance.new("UICorner")
                label.Name = name
                label.Parent = ScrollingFrame
                label.BackgroundColor3 = Color3.fromRGB(70, 70, 224)
                label.Position = UDim2.new(0.150118202, 0, 0.000254076178, 0)
                label.Size = UDim2.new(0, 385, 0, 39)
                label.Font = Enum.Font.Roboto
                label.Text = text
                label.TextColor3 = Color3.fromRGB(255,255,255)
                label.TextSize = 14.000
                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = label
                ScrollingFrame.CanvasSize = UDim2.fromOffset(ScrollingFrame.CanvasSize.X.Offset,ScrollingFrame.CanvasSize.Y.Offset+50)
            end

            function tab:NewSearchBar()
                if Tab:FindFirstChild('SearchBar') then return end
                local SearchBar = Instance.new("TextBox")
                local UICorner_3 = Instance.new("UICorner")

                SearchBar.Name = "SearchBar"
                SearchBar.Parent = Tab
                SearchBar.BackgroundColor3 = Color3.fromRGB(69, 69, 107)
                SearchBar.Position = UDim2.new(0,12,0,21) --UDim2.new(0.0309039894, 0, 0.0229007639, 0)
                SearchBar.BackgroundTransparency = 0.5
                SearchBar.Size = UDim2.new(0, 396, 0, 34)
                SearchBar.Font = Enum.Font.SourceSans
                SearchBar.PlaceholderText = "search bar"
                SearchBar.Text = ""
                SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
                SearchBar.TextSize = 20.000

                local searchicon = Instance.new("ImageLabel")

                searchicon.Name = "searchicon"
                searchicon.Parent = SearchBar
                searchicon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                searchicon.BackgroundTransparency = 1.000
                searchicon.Position = UDim2.new(0.0379999988, 0, 0.230000004, 0)
                searchicon.Size = UDim2.new(0, 20, 0, 20)
                searchicon.Image = "rbxassetid://2804603863"
                
                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = SearchBar

                SearchBar.Changed:Connect(function()
					for _,v in pairs(ScrollingFrame:GetChildren()) do
						if v:IsA("GuiObject") then
							local Text = v.Name:lower()
							if Text:match(SearchBar.Text:lower()) or SearchBar.Text == "" or Text == 'decoylmao' then -- or v == SearchBar then
								v.Visible = true
							else
								v.Visible = false
							end
						end
					end
				end)
            end

            function tab:NewButton(name, desc, callback)
                local button = Instance.new("TextButton")
                local butcorner = Instance.new("UICorner")

                button.Name = name
                button.Parent = ScrollingFrame
                button.BackgroundColor3 = Color3.fromRGB(69, 69, 107)
    
                button.Position = UDim2.new(0.150118202, 0, 0.000254076178, 0)
                button.Size = UDim2.new(0, 385, 0, 39)
                button.Font = Enum.Font.Roboto
                button.Text = name
                button.TextColor3 = Color3.fromRGB(255,255,255)
                button.TextSize = 17.000
				button.AutoButtonColor = false

                butcorner.CornerRadius = UDim.new(0, 5)
                butcorner.Name = "butcorner"
                butcorner.Parent = button

                local infobutton = Instance.new("ImageButton")

                infobutton.Name = "infobutton"
                infobutton.Parent = button
                infobutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                infobutton.BackgroundTransparency = 1.000
                infobutton.Position = UDim2.new(0.0285714287, 0, 0.230769247, 0)
                infobutton.Size = UDim2.new(0, 20, 0, 21)
                infobutton.Image = "http://www.roblox.com/asset/?id=6294110112"

                ScrollingFrame.CanvasSize = UDim2.fromOffset(ScrollingFrame.CanvasSize.X.Offset,ScrollingFrame.CanvasSize.Y.Offset+50)

                local clicked = false
				local holding = false
				button.MouseButton1Down:Connect(function()
					if clicked then return end
					if holding == false then holding = true end
					tween(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(100, 100, 156)})
				end)
				button.MouseButton1Up:Connect(function()
					if clicked then return end
					if holding == true then holding = false end
					tween(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(69, 69, 107)})
				end)

				button.MouseLeave:Connect(function()
					if holding and not clicked then tween(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(69, 69, 107)}) end
				end)

                button.MouseButton1Click:Connect(callback)

                infobutton.MouseButton1Click:Connect(function()
                    clicked = not clicked
                    if clicked then
                        button.Text = desc
                        button.TextSize = 13.000
						tween(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(53, 53, 82)})
                    else 
                        button.Text = name
                        button.TextSize = 17.000
						tween(button,TweenInfo.new(0.2,Enum.EasingStyle.Linear), {BackgroundColor3 = Color3.fromRGB(69, 69, 107)})

                    end
                end)
            end
            tab.Tab = Tab
            return tab
        end

    function window:Hide()
        Main.Visible = false
    end
    function window:Show()
        Main.Visible = true
    end
	function window:SetFooter(text)
		footer.Text = text
	end
    return window
end
return module
