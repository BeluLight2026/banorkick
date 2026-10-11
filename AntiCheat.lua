game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        local hum = char:WaitForChild("Humanoid")
        local root = char:WaitForChild("HumanoidRootPart")
        local lastPos = root.Position

        while hum.Parent do
            task.wait(1)
            local dist = (root.Position - lastPos).Magnitude
            -- si se movio mas de 120 studs en 1 seg = TP / Speed
            if dist > 120 then
                plr:Kick("Movimiento sospechoso detectado")
                break
            end
            lastPos = root.Position
        end
    end)
end)
