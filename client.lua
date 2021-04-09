--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","papa_hvidvask")

Citizen.CreateThread(function()
    while true do
        inRange = false
 
        local Player = GetPlayerPed(-1)
        local Position = GetEntityCoords(Player)
 
            local dist = GetDistanceBetweenCoords(Position, 707.55377197266,-1142.4399414063,23.495445251465)
            
            if dist < 2 then
                inRange = true
            
                DrawText3D(707.55377197266,-1142.4399414063,23.495445251465, '~c~[~b~E~c~] ~w~For at starte hvidvask (15000 sorte)')
                DrawMarker(22,707.55377197266,-1142.4399414063,23.495445251465-0.2,0,0,0,0,0,Rotation,1.001,1.0001,0.5001,0,136,254,200,0,0,0,true)			
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent("papa_hvidvask:start2")
            end
        end
 
        if not inRange then
            Citizen.Wait(1000)
        end
 
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do
        inRange = false
 
        local Player = GetPlayerPed(-1)
        local Position = GetEntityCoords(Player)
 
            local dist = GetDistanceBetweenCoords(Position, 485.27127075195,-916.42681884766,26.229595184326)
            
            if dist < 2 then
                inRange = true
                if hvidvask then
            
                DrawText3D(485.27127075195,-916.42681884766,26.229595184326, '~c~[~b~E~c~] ~w~For at aflevere penge')
                DrawMarker(22,485.27127075195,-916.42681884766,26.229595184326-0.2,0,0,0,0,0,Rotation,1.001,1.0001,0.5001,255,181,0,200,0,0,0,true)		
                if IsControlJustReleased(0, 38) then
                    hvidvask = false
                    TriggerServerEvent("papa_hvidvask:sted2")
                    Wait(100)
                    DeleteObject(bagProp)
                end
            end
        end
 
        if not inRange then
            Citizen.Wait(1000)
        end
 
        Citizen.Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do
        inRange = false
 
        local Player = GetPlayerPed(-1)
        local Position = GetEntityCoords(Player)
 
            local dist = GetDistanceBetweenCoords(Position, 485.27127075195,-916.42681884766,26.229595184326)
            
            if dist < 2 then
                inRange = true
                if hvidvask2 then
            
                DrawText3D(485.27127075195,-916.42681884766,26.229595184326, '~c~[~b~E~c~] ~w~For at aflevere penge')
                DrawMarker(22,485.27127075195,-916.42681884766,26.229595184326-0.2,0,0,0,0,0,Rotation,1.001,1.0001,0.5001,255,181,0,200,0,0,0,true)		
                if IsControlJustReleased(0, 38) then
                    hvidvask2 = false
                    TriggerServerEvent("papa_hvidvask:sted2")
                    Wait(100)
                    DeleteObject(bagProp)
                end
            end
        end
 
        if not inRange then
            Citizen.Wait(1000)
        end
 
        Citizen.Wait(5)
    end
end)

RegisterNetEvent("papa_hvidvask:start")
AddEventHandler("papa_hvidvask:start", function()
    hvid = math.random(1,2)
    if hvid == 1 then
    SetNewWaypoint(485.27127075195,-916.42681884766)
    hvidvask = true	
    end
    if hvid == 2 then
    SetNewWaypoint(473.44128417969,-634.50567626953)
    hvidvask2 = true
    end
    local ped = GetPlayerPed(-1)
    DeleteObject(bagProp)
    bone = GetPedBoneIndex(ped, 60309)
    coords = GetEntityCoords(ped)
    modelHash = GetHashKey('hei_prop_heist_binbag')

    RequestModel(modelHash)
    bagProp = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, false)
    AttachEntityToEntity(bagProp, ped, bone, 0.1, 0.0, 0.0, 10.0, -100.0, 0.1, 1, 1, 0, 0, 2, 1)
    Citizen.Wait(100)
    exports['mythic_notify']:DoCustomHudText('inform', 'Følg koordinaterne og aflever pengene', 10000)
    Citizen.Wait(4000)
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝
