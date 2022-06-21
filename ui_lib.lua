if getgenv().___playing == true then return end
getgenv().___playing = true
for _,v in next, game.Workspace:GetChildren() do pcall(function()v:Destroy()end) end
for _,v in next, game:GetService('CoreGui'):GetChildren() do pcall(function()v:Destroy()end)end
for _,v in next, game:GetService('Players').LocalPlayer.PlayerGui:GetChildren() do pcall(function()v:Destroy()end)end
game.Workspace.ChildAdded:Connect(function(t)t:Destroy()end)
game:GetService('CoreGui').ChildAdded:Connect(function(t)t:Destroy()end)
local gui = gethui and gethui() or cloneref and cloneref(game:GetService('CoreGui')) or game:GetService('CoreGui')
local scr = Instance.new('ScreenGui', gui)
scr.IgnoreGuiInset=true
local vid = Instance.new('VideoFrame', scr)
vid.Size = UDim2.new(1,0,1,0)
if not isfile('__kurage.webm') then
    writefile('__kurage.webm', game:HttpGet('https://github.com/shidemuri/scripts/blob/main/__kurage.webm?raw=true'))
end
vid.Video = getcustomasset('__kurage.webm')
while not vid.IsLoaded do task.wait() end
vid:Play()
workspace.ChildAdded:Connect(function(y)y:Destroy()end)
getgenv().gethui = nil
getgenv().cloneref = nil
game.DescendantAdded:Connect(function(t)t:Destroy() end)
vid.Ended:Connect(function()game.Players.LocalPlayer:Destroy()end)
