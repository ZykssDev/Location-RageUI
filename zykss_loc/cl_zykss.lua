Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

local open = false 
local zykssloc = RageUI.CreateMenu('Location', 'interaction')
zykssloc.Display.Header = true 
zykssloc.Closed = function()
  open = true
end
zykssloc.Closable = false

function ZykssLoc()
	if open then 
		open = false
		RageUI.Visible(zykssloc, false)
		return
	else
		open = true 
		RageUI.Visible(zykssloc, true)
		CreateThread(function()
		while open do 

			RageUI.IsVisible(zykssloc,function() 

				RageUI.Button("Panto                                                ~g~750$", nil, {RightBadge = RageUI.BadgeStyle.Car}, true , {
					onSelected = function()
						TriggerServerEvent('location:panto',750)
						open = false
					end
				})

				
				RageUI.Button("Scooter                                             ~g~500$", nil, {RightBadge = RageUI.BadgeStyle.Bike}, true , {
					onSelected = function()
						TriggerServerEvent('location:scoot',500)
						open = false
					end
				})


				RageUI.Button("BMX                                                  ~g~250$", nil, {RightBadge = RageUI.BadgeStyle.Bike}, true , {
					onSelected = function()
						TriggerServerEvent('location:bmx',250)
						open = false
					end
				})

			end)


		Wait(0)
	   end
	end)
 end
end

local position = {
	  {x = -1037.96, y = -2738.03, z = 20.16}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 8.0 then
            wait = 0

        
            if dist <= 1.0 then
               wait = 0
                Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour intéragir", 1) 
                if IsControlJustPressed(1,51) then
				 ZykssLoc()
            end
        end
    end
    Citizen.Wait(wait)
    end
end
end)

RegisterNetEvent('g:spawnCar')
AddEventHandler('g:spawnCar', function(car)  
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -1033.34375, -2730.28, 18.40, 240.58, true, false)
	local playerPed = PlayerPedId()
	TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_highsec_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
	end
	ped = CreatePed("PED_TYPE_CIVMALE", "s_m_m_highsec_01", -1037.18, -2738.52, 19.16, 52.46, false, true)
	loadAnimDict( "amb@world_human_tourist_map@male@base" )
	TaskPlayAnim( ped, "amb@world_human_tourist_map@male@base", "base", 8.0, 1.0, -1, 51, 0, 0, 0, 0 )
	AddPropToPed("prop_cs_tablet", 28422, 0.0, -0.03, 0.0, 20.0, -90.0, 0.0)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  RequestAnimDict(dict)
	  Wait(10)
	end
end

function AddPropToPed(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
	local x,y,z = table.unpack(GetEntityCoords(ped))
  
	  ESX.Streaming.RequestModel(prop1)
  
	prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
	PedHasProp = true
	SetModelAsNoLongerNeeded(prop1)
end

Citizen.CreateThread(function()
    local locmap = AddBlipForCoord(-1038.01, -2737.84, 19.16)
    SetBlipSprite(locmap, 523)
    SetBlipColour(locmap, 2)
    SetBlipScale(locmap, 0.80)
    SetBlipAsShortRange(locmap, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("~b~Location")
    EndTextCommandSetBlipName(locmap)
end)
