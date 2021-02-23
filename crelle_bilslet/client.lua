vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","crelle_bilslet")

Citizen.CreateThread(function()
	while true do
    Citizen.Wait(0)
    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cfg.location.x, cfg.location.y, cfg.location.z, true ) < 5.5 then 
        DrawText3Ds(cfg.location.x, cfg.location.y, cfg.location.z+0.2, "E - PARKER KØRETØJ", 3.0, 7)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), cfg.location.x, cfg.location.y, cfg.location.z, true ) < 1.5 then
                    if IsControlJustPressed(0, 38) then 
                TriggerServerEvent("crellebil:tjek")
                end
			end
		end
	end
end)


RegisterNetEvent("crellebil:slet")
AddEventHandler("crellebil:slet", function()
    local player = GetPlayerPed(-1)
    local bil = GetVehiclePedIsIn(player, false)
    if IsPedSittingInAnyVehicle(player) then
    TaskLeaveVehicle(player, bil)
    SetVehicleDoorsLocked(bil,2)
    SetVehicleDoorsLockedForAllPlayers(bil, true)
    Citizen.Wait(3700)
    SetEntityAsMissionEntity(bil, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(bil))
    else
    exports['mythic_notify']:SendAlert('error', 'Du ikke i et køretøj!')
    end
end)


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end