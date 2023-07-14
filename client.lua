Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        -- Vérifier si le joueur est dans un véhicule
        if IsPedInAnyVehicle(playerPed, false) then
            local speed = GetEntitySpeed(vehicle)

            -- Vérifier si le véhicule est en mouvement
            if speed > 0 then
                -- Désactiver l'éjection du joueur
                SetVehicleCanBreak(vehicle, false)
                DisableVehicleWeapon(true, vehicle, playerPed)

                -- Vérifier si le véhicule a subi des dommages
                if GetVehicleEngineHealth(vehicle) < 300 then
                    -- Réduire les chances d'éjection
                    SetPlayerVehicleDamageModifier(PlayerId(), 0.1)
                end
            end
        end
    end
end)



-- Script fait par Backend

-- https://twitter.com/kingBackend_

-- https://discord.gg/nsXjRzWr7a