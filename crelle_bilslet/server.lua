local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","crelle_bilslet")

RegisterNetEvent("crellebil:tjek")
AddEventHandler("crellebil:tjek", function(lPed)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, cfg.job}) then 
        TriggerClientEvent("crellebil:slet", source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du ikke betjent'}, 5000)
    end
end)
































































































