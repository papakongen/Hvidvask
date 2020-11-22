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
    Citizen.Wait(0)
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 707.55377197266,-1142.4399414063,23.495445251465, true ) < 35 then
          DrawMarker(22,707.55377197266,-1142.4399414063,23.495445251465-0.2,0,0,0,0,0,Rotation,1.001,1.0001,0.5001,0,136,254,200,0,0,0,true)				
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 707.55377197266,-1142.4399414063,23.495445251465, true ) < 1 then 
                DrawText3Ds(707.40795898438,-1142.3310546875,23.495164871216+0.15, "~c~[~b~E~c~] ~w~For at starte hvidvask (15000 sorte)", 3.0, 7)	
                  if IsControlJustPressed(1, 38) then
                    TriggerServerEvent("papa_hvidvask:start2")
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if hvidvask then
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 485.27127075195,-916.42681884766,26.229595184326, true ) < 35 then
            DrawMarker(22,485.27127075195,-916.42681884766,26.229595184326-0.2,0,0,0,0,0,Rotation,1.001,1.0001,0.5001,255,181,0,200,0,0,0,true)						
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 485.27127075195,-916.42681884766,26.229595184326, true ) < 1 then 
                DrawText3Ds(485.27127075195,-916.42681884766,26.229595184326+0.15, "~c~[~b~E~c~] ~w~For at aflevere penge", 3.0, 7)
                if IsControlJustPressed(1, 38) then
                    hvidvask = false
                    TriggerServerEvent("papa_hvidvask:sted2")
                    Wait(100)
                    DeleteObject(bagProp)
                end
            end
        end
    end
  end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if hvidvask2 then
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 474.43212890625,-634.82861328125,25.648370742798, true ) < 35 then 
            DrawMarker(22,474.43212890625,-634.82861328125,25.648370742798-0.2,0,0,0,0,0,Rotation,1.001,1.0001,0.5001,255,181,0,200,0,0,0,true)						
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 474.43212890625,-634.82861328125,25.648370742798, true ) < 1 then 
                DrawText3Ds(474.43212890625,-634.82861328125,25.648370742798+0.15, "~c~[~b~E~c~] ~w~For at aflevere penge", 3.0, 7)
                if IsControlJustPressed(1, 38) then
                    hvidvask2 = false
                    TriggerServerEvent("papa_hvidvask:sted2")
                    Wait(100)
                    DeleteObject(bagProp)
                end
            end
        end
    end
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

RegisterNetEvent("papa_hvidvask:sted")
AddEventHandler("papa_hvidvask:sted", function()
    if IsControlJustPressed(1, 38) then
        TriggerServerEvent("papa_hvidvask:sted2")
    end
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