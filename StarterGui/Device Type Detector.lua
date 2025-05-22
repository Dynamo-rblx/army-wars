-- @ScriptType: LocalScript
local UserInputService = game:GetService("UserInputService")
local TypeEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("deviceType")

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	TypeEvent:FireServer("Mobile")
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	TypeEvent:FireServer("Computer")
end