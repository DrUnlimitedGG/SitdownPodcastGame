local tweenservice = game:GetService("TweenService")
local knobEvent = game.ReplicatedStorage.Knobs.Door2

local knob = game.Workspace.BackstageHallwayDoor.Union

local twistInfo = {0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0}
local properties = {CFrame = knob.CFrame * CFrame.Angles(math.rad(60), 0, 0)}
local endProperties = {CFrame = knob.CFrame * CFrame.Angles(0,0,0)}


knobEvent:FireAllClients(knob, twistInfo, properties)
wait(4.25)
knobEvent:FireAllClients(knob, twistInfo, endProperties)