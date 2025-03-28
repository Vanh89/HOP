getgenv().Dark = function()
    local url = 'https://donebell.vercel.app/api/Dark'
    local chooses
    local foundServers = game:GetService('HttpService'):JSONDecode(game:HttpGet(url))
    for i,v in foundServers do 
        if v.jobId ~= game.JobId then 
            chooses = v
        end
    end
    game:GetService("TeleportService"):TeleportToPlaceInstance(4442272183, chooses.jobId, game.Players.LocalPlayer)
end
function CheckBossAttack()
    for ,Boss in pairs(game.Workspace.Enemies:GetChildren()) do
        if Boss.Name == "Darkbeard" and DetectingPart(Boss) and Boss.Humanoid.Health > 0 then
            return Boss
        end
    end
    for ,Boss in pairs(game.ReplicatedStorage:GetChildren()) do
        if Boss.Name == "Darkbeard" then
            return Boss
        end
    end
end
function DetectingPart(v1)
    return v1 and v1:FindFirstChild("HumanoidRootPart") and v1:FindFirstChild("Humanoid")
end
spawn(function()
  while task.wait(3) do
    pcall(function()
      if not CheckBossAttack() then
        return Dark()
      end
    end)
  end
end)