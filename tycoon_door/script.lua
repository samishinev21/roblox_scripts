-- Tycoon door that lets only a single player to let in.
-- Link to the full Roblox asset: https://web.roblox.com/library/10568472823/Tycoon-door

local head = script.Parent
local portal = script.Parent.Parent
local ownerTitle = portal["Owner Title Block"]['SurfaceGui']["OwnerTitle"]
local portalHumanoid = portal:FindFirstChild("Humanoid")
local ownerName = ""
local claimed = false


local function openPortal(part)
	local humanoid = part.Parent:FindFirstChild("Humanoid")
	if humanoid and (claimed == false or ownerName == humanoid.DisplayName) then
		claimed = true
		ownerName = humanoid.DisplayName
		portalHumanoid.DisplayName = "Claimed"
		ownerTitle.Text = humanoid.DisplayName .. "'s Tycoon"
		head.Transparency = 0.5
		head.CanCollide = false
	end
end

local function closePortal()
	head.Transparency = 0
	head.CanCollide = true
	
end

head.Touched:Connect(openPortal)
head.TouchEnded:Connect(closePortal)