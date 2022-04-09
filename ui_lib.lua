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
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = game:GetService("CoreGui")
        protect(ScreenGui)
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = ScreenGui
        Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Main.BorderColor3 = Color3.fromRGB(100, 100, 100)
        Main.Position = UDim2.new(0.335526317, 0, 0.324372768, 0)
        Main.Size = UDim2.new(0, 423, 0, 304)

        local UIStroke = Instance.new('UIStroke')
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.new(0, 0.8, 1)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 2.5
        UIStroke.Transparency = 0
        UIStroke.Parent = Main

        Dragify(Main)
        local ImageLabel = Instance.new("ImageLabel")
        local UICorner_6 = Instance.new("UICorner")
        ImageLabel.Parent = Main
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.Position = UDim2.new(-0.0002643466, 0, 0.141350254, 0)
        ImageLabel.Size = UDim2.new(0, 423, 0, 261)
        ImageLabel.ZIndex = 0
        ImageLabel.Image = "http://www.roblox.com/asset/?id=2062021684"
        ImageLabel.ImageColor3 = Color3.fromRGB(17, 17, 17)

        local UIStroke = Instance.new('UIStroke')
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.new(0, 0.8, 1)
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Thickness = 2.5
        UIStroke.Transparency = 0
        UIStroke.Parent = ImageLabel

        UICorner_6.CornerRadius = UDim.new(0, 5)
        UICorner_6.Parent = ImageLabel

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Main

        local Title = Instance.new("TextLabel")
        Title.Name = name or 'cool ui lib'
        Title.Parent = Main
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.0307328608, 0, 0, 0)
        Title.Size = UDim2.new(0, 410, 0, 37)
        Title.Font = Enum.Font.SourceSans
        Title.Text = name or 'cool ui lib'
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 35.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local tabbuttons = Instance.new("Frame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        tabbuttons.Name = "tab buttons"
        tabbuttons.Parent = Main
        tabbuttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        tabbuttons.BackgroundTransparency = 1.000
        tabbuttons.Position = UDim2.new(0.0141843967, 0, 0.835526228, 0)
        tabbuttons.Size = UDim2.new(0, 410, 0, 50)

        UIListLayout_2.Parent = tabbuttons
        UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
        UIListLayout_2.Padding = UDim.new(0, 13)
        function window:SetMainTab(tab)
            if tab:IsA('Frame') and tab.Parent == Main then
                for _,v in next, Main:GetChildren() do
                    if v.Name == tab.Name then v.Visible = false end
                end
            end
            tab.Visible = true
        end
        function window:NewTab(namee)
            local tab = {}
            local Tab = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            Tab.Name = namee
            Tab.Parent = Main
            Tab.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Tab.BackgroundTransparency = 1.000
            Tab.Position = UDim2.new(-0.000171124935, 0, 0.136029392, 0)
            Tab.Size = UDim2.new(0, 423, 0, 262)
            Tab.Visible = false

            UICorner_2.CornerRadius = UDim.new(0, 5)
            UICorner_2.Parent = Tab

            local TabSwitch1 = Instance.new("TextButton")
            TabSwitch1.Name = "TabSwitch1"
            TabSwitch1.Parent = tabbuttons
            TabSwitch1.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
            TabSwitch1.Position = UDim2.new(0, 0, 0.109999999, 0)
            TabSwitch1.Size = UDim2.new(0, 128, 0, 39)
            TabSwitch1.Font = Enum.Font.Roboto
            TabSwitch1.Text = namee
            TabSwitch1.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabSwitch1.TextSize = 22.000

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Parent = TabSwitch1

            local UIStroke = Instance.new('UIStroke')
            UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            UIStroke.Color = Color3.new(198, 198, 198)
            UIStroke.LineJoinMode = Enum.LineJoinMode.Round
            UIStroke.Thickness = 1
            UIStroke.Transparency = 0
            UIStroke.Parent = TabSwitch1

            TabSwitch1.MouseButton1Click:Connect(function()
                for _,v in pairs(Main:GetChildren()) do
                    if v.Name == Tab.Name then
                        v.Visible = false
                    end
                end
                Tab.Visible = true
            end)

            ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Parent = Tab
            ScrollingFrame.Active = true
            ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScrollingFrame.BackgroundTransparency = 1.000
            ScrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.Position = UDim2.new(0, 0, 0.183206111, 0)
            ScrollingFrame.Size = UDim2.new(0, 423, 0, 162)
            ScrollingFrame.CanvasSize = UDim2.new(0, 0, 15, 0)

            local UIListLayout = Instance.new("UIListLayout")
            UIListLayout.Parent = ScrollingFrame
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 7)

            local button1 = Instance.new("TextButton")
            button1.Name = "decoylmao"
            button1.Parent = ScrollingFrame
            button1.Active = false
            button1.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
            button1.BackgroundTransparency = 1.000
            button1.Position = UDim2.new(0.0449172594, 0, -3.76760227e-07, 0)
            button1.Selectable = false
            button1.Size = UDim2.new(0, 385, 0, 1)
            button1.Font = Enum.Font.Roboto
            button1.Text = " "
            button1.TextColor3 = Color3.fromRGB(255, 255, 255)
            button1.TextSize = 22.000 --this literally only gives a space to the first button

            function tab:NewLabel(text)
                local label = Instance.new("TextLabel")
                local UICorner_3 = Instance.new("UICorner")
                label.Name = name
                label.Parent = ScrollingFrame
                label.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
                label.Position = UDim2.new(0, 0, -0.0249363855, 0)
                label.Size = UDim2.new(0, 385, 0, 39)
                label.Font = Enum.Font.Roboto
                label.Text = text
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextSize = 15.000
                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = label
            end

            function tab:NewSearchBar()
                local SearchBar = Instance.new("TextBox")
                local UICorner_3 = Instance.new("UICorner")

                SearchBar.Name = "SearchBar"
                SearchBar.Parent = Tab
                SearchBar.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
                SearchBar.Position = UDim2.new(0.0309039894, 0, 0.0229007639, 0)
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
                local button1_2 = Instance.new("TextButton")
                local UICorner_4 = Instance.new("UICorner")

                button1_2.Name = name
                button1_2.Parent = ScrollingFrame
                button1_2.BackgroundColor3 = Color3.fromRGB(44,44,44)
                button1_2.Position = UDim2.new(0.055555556, 0, -3.76760227e-07, 0)
                button1_2.Size = UDim2.new(0, 385, 0, 39)
                button1_2.Font = Enum.Font.Roboto
                button1_2.Text = name
                button1_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                button1_2.TextSize = 22.000

                UICorner_4.CornerRadius = UDim.new(0, 5)
                UICorner_4.Parent = button1_2

                local UIStroke = Instance.new('UIStroke')
                UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UIStroke.Color = Color3.new(198, 198, 198)
                UIStroke.LineJoinMode = Enum.LineJoinMode.Round
                UIStroke.Thickness = 1
                UIStroke.Transparency = 0
                UIStroke.Parent = button1_2

                local ImageButton = Instance.new("ImageButton")

                ImageButton.Parent = button1_2
                ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageButton.BackgroundTransparency = 1.000
                ImageButton.Position = UDim2.new(0.0285714287, 0, 0.230769247, 0)
                ImageButton.Size = UDim2.new(0, 20, 0, 21)
                ImageButton.Image = "http://www.roblox.com/asset/?id=6294110112"

                ScrollingFrame.CanvasSize = UDim2.fromOffset(ScrollingFrame.CanvasSize.X.Offset,ScrollingFrame.CanvasSize.Y.Offset+39)

                local clicked = false

                button1_2.MouseButton1Click:Connect(callback)
                ImageButton.MouseButton1Click:Connect(function()
                    clicked = not clicked
                    if clicked then
                        button1_2.Text = desc
                        button1_2.TextSize = 15.000
                        button1_2.BackgroundColor3 = Color3.fromRGB(78, 78, 78)
                    else 
                        button1_2.Text = name
                        button1_2.TextSize = 22.000
                        button1_2.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
                    end
                end)
            end
            tab.Tab = Tab
            return tab
        end
    return window
end
return module
