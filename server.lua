--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","papa_hvidvask")

RegisterNetEvent("papa_hvidvask:start2")
AddEventHandler("papa_hvidvask:start2", function()
    local source = source
    local user_id = vRP.getUserId({source})
            if vRP.getInventoryItemAmount({user_id,'dirty_money'}) >= 15000 then
            TriggerClientEvent("papa_hvidvask:start", source)
        else
            TriggerClientEvent('mythic_notify:client:DoCustomHudText', source, { type = 'inform', text = 'Ikke nok sorte penge', length = '5000', style = {}})
    end
end)

RegisterNetEvent("papa_hvidvask:sted2")
AddEventHandler("papa_hvidvask:sted2", function()
    local source = source
    local user_id = vRP.getUserId({source})
           if vRP.tryGetInventoryItem({user_id,"dirty_money", 15000}) then
            TriggerClientEvent("papa_hvidvask:sted", source)
            vRP.giveMoney({user_id, 15000})
        else
            TriggerClientEvent('mythic_notify:client:DoCustomHudText', source, { type = 'inform', text = 'Ikke nok sorte penge!', length = '5000', style = {}})
        end
end)
--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝
