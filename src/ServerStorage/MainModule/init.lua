local module = {}

function module.Load(genSign, signName)
	
	if genSign == true then
		script.SitdownSign:Clone().Parent = workspace
	elseif genSign == false then
		local sign = game.Workspace:FindFirstChild(signName)
		script["Flash"]:Clone().Parent = sign
	end
	
	warn("Loaded SitdownSign")
end

return module

-- ;s require(10098815141).Load(false, "SitdownSign")