--[[
  
  I DIDNT MAKE THIS SCRIPT
  THE ORIGINAL ONE WAS MADE BY https://www.roblox.com/users/4397833/profile/
  Original script: https://www.roblox.com/library/181259635/qPerfectionWeld-Perfect-welding-for-EVERY-situat

  i originally saved this here for my neko v4 convert but feel free to use it however you want

  usage: <function>(<Model>the thing that has all the baseparts u want to weld, <BasePart (THE NAME OF IT)> the core part that everything will be weld to, <BoolValue> break joints (refer to below))

  if you want to use this in yo code then use this code:

  

]]
	local NEVER_BREAK_JOINTS = breakjoints -- If you set this to true it will never break joints (this can create some welding issues, but can save stuff like hinges).


	local function CallOnChildren(Instance, FunctionToCall)
		FunctionToCall(Instance)
	
		for _, Child in next, Instance:GetChildren() do
			CallOnChildren(Child, FunctionToCall)
		end
	end
	
	local function GetNearestParent(Instancee, ClassName)
		local Ancestor = Instancee
		repeat
			Ancestor = Ancestor.Parent
			if Ancestor == nil then
				return nil
			end
		until Ancestor:IsA(ClassName)
	
		return Ancestor
	end
	
	local function GetBricks(StartInstance)
		local List = {}
		CallOnChildren(StartInstance, function(Item)
			if Item:IsA("BasePart") then
				List[#List+1] = Item;
			end
		end)
	
		return List
	end
	
	local function Modify(Instance, Values)
		assert(type(Values) == "table", "Values is not a table");
	
		for Index, Value in next, Values do
			if type(Index) == "number" then
				Value.Parent = Instance
			else
				Instance[Index] = Value
			end
		end
		return Instance
	end
	
	local function Make(ClassType, Properties)
		return Modify(Instance.new(ClassType), Properties)
	end
	
	local Surfaces = {"TopSurface", "BottomSurface", "LeftSurface", "RightSurface", "FrontSurface", "BackSurface"}
	local HingSurfaces = {"Hinge", "Motor", "SteppingMotor"}
	
	local function HasWheelJoint(Part)
		for _, SurfaceName in pairs(Surfaces) do
			for _, HingSurfaceName in pairs(HingSurfaces) do
				if Part[SurfaceName].Name == HingSurfaceName then
					return true
				end
			end
		end
		
		return false
	end
	
	local function ShouldBreakJoints(Part)
		if NEVER_BREAK_JOINTS then
			return false
		end
		
		if HasWheelJoint(Part) then
			return false
		end
		
		local Connected = Part:GetConnectedParts()
		
		if #Connected == 1 then
			return false
		end
		
		for _, Item in pairs(Connected) do
			if HasWheelJoint(Item) then
				return false
			elseif not Item:IsDescendantOf(model.Parent) then
				return false
			end
		end
		
		return true
	end
	
	local function WeldTogether(Part0, Part1, JointType, WeldParent)
		JointType = JointType or "Weld"
		local RelativeValue = Part1:FindFirstChild("qRelativeCFrameWeldValue")
		
		local NewWeld = Part1:FindFirstChild("qCFrameWeldThingy") or Instance.new(JointType)
		Modify(NewWeld, {
			Name = "qCFrameWeldThingy";
			Part0  = Part0;
			Part1  = Part1;
			C0     = CFrame.new();--Part0.CFrame:inverse();
			C1     = RelativeValue and RelativeValue.Value or Part1.CFrame:toObjectSpace(Part0.CFrame); --Part1.CFrame:inverse() * Part0.CFrame;-- Part1.CFrame:inverse();
			Parent = Part1;
		})
	
		if not RelativeValue then
			RelativeValue = Make("CFrameValue", {
				Parent     = Part1;
				Name       = "qRelativeCFrameWeldValue";
				Archivable = true;
				Value      = NewWeld.C1;
			})
		end
	
		return NewWeld
	end
	
	local function WeldParts(Parts, MainPart, JointType)
		for _, Part in pairs(Parts) do
			if ShouldBreakJoints(Part) then
				Part:BreakJoints()
			end
		end
		
		for _, Part in pairs(Parts) do
			if Part ~= MainPart then
				WeldTogether(MainPart, Part, JointType, MainPart)
			end
		end
	end
	
	local function PerfectionWeld()	
		local Tool = GetNearestParent(model, "Tool")
	
		local Parts = GetBricks(model)
		local PrimaryPart = model[basepart]
	
		if PrimaryPart then
			WeldParts(Parts, PrimaryPart, "Weld")
		else
			warn("qWeld - Unable to weld part")
		end
		
		return Tool
	end
	
	local Tool = PerfectionWeld()
	
	
	if Tool then
		model.AncestryChanged:connect(function()
			PerfectionWeld()
		end)
	end
