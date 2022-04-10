--[[

atama wo tsukande kuttsuite
zugaikotsu wo tokashiteiku n da
noumiso wo tabetsukushite
zoushokushiteku no da

padero#0001

]]

module = {}

if not (syn or protect_gui) then
    warn("protect_gui is not supported by your exploit. using empty polyfill instead.")
    protect = function() end
else
    if syn then protect = syn.protect_gui else protect = protect_gui end
end
function Dragify(Frame)
	local dragToggle = nil
	local dragSpeed = 0
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
        tabbuttons.Size = UDim2.new(0, 182, 0, 366)

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
            Tab.Size = UDim2.new(0, 420, 0, 365)
            Tab.Visible = false

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
            tabbutton.TextSize = 22.000

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
            ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(69, 69, 107)
            ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollingFrame.BackgroundTransparency = 1.000
            ScrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.Size = UDim2.new(0, 420, 0, 334)
            ScrollingFrame.Position = UDim2.new(0, 0, 0.082, 0)
            ScrollingFrame.CanvasSize = UDim2.new(0, 0, 15, 0)
            Tab.ChildAdded:Connect(function(child)
                if child.Name == 'SearchBar' then 
                    print(1)
                    ScrollingFrame.Size = UDim2.new(0, 420, 0, 298)
                    ScrollingFrame.Position = UDim2.new(0, 0, 0.183206141, 0)
                end
            end)
            Tab.ChildRemoved:Connect(function(child)
                if child.Name == 'SearchBar' then 
                    ScrollingFrame.Size = UDim2.new(0, 420, 0, 334)
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
                label.TextSize = 15.000
                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = label
                ScrollingFrame.CanvasSize = UDim2.fromOffset(ScrollingFrame.CanvasSize.X.Offset,ScrollingFrame.CanvasSize.Y.Offset+50)
            end

            function tab:NewSearchBar()
                local SearchBar = Instance.new("TextBox")
                local UICorner_3 = Instance.new("UICorner")

                SearchBar.Name = "SearchBar"
                SearchBar.Parent = Tab
                SearchBar.BackgroundColor3 = Color3.fromRGB(69, 69, 107)
                SearchBar.Position = UDim2.new(0.0309039894, 0, 0.0229007639, 0)
                SearchBar.BackgroundTransparency = 0.5
                SearchBar.Size = UDim2.new(0, 396, 0, 34)
                SearchBar.Font = Enum.Font.SourceSans
                SearchBar.PlaceholderText = "search bar"
                SearchBar.Text = ""
                SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
                SearchBar.TextSize = 20.000
                
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
                button.TextSize = 22.000

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

                button.MouseButton1Click:Connect(callback)

                infobutton.MouseButton1Click:Connect(function()
                    clicked = not clicked
                    if clicked then
                        button.Text = desc
                        button.TextSize = 15.000
                        button.BackgroundColor3 = Color3.fromRGB(53, 53, 82)
                    else 
                        button.Text = name
                        button.TextSize = 22.000
                        button.BackgroundColor3 = Color3.fromRGB(69, 69, 107)
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
    return window
end
return module
