-- BanSystem para happymealcamp - va en ServerScriptService
local bannedPlayers = {}

local function checkBan(player)
    if bannedPlayers[player.Name] then
        player:Kick("Estás baneado de happymealcamp")
    end
end

game.Players.PlayerAdded:Connect(checkBan)

-- Necesitas un RemoteEvent en ReplicatedStorage llamado BanKickEvent
game.ReplicatedStorage:WaitForChild("BanKickEvent").OnServerEvent:Connect(function(plr, targetName, action)
    -- Solo tú puedes usarlo, pon aquí tu nombre
    if plr.Name ~= "TuNombreAquí" then return end

    local target = game.Players:FindFirstChild(targetName)

    if action == "BAN" then
        bannedPlayers[targetName] = true
        if target then
            target:Kick("Fuiste baneado por el admin")
        end
    elseif action == "KICK" then
        if target then
            target:Kick("Fuiste kickeado por el admin")
        end
    elseif action == "UNBAN" then
        bannedPlayers[targetName] = nil
    end
end)
