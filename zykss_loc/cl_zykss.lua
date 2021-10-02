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
						TriggerServerEvent('location:panto',2500)
						open = false
					end
				})

				
				RageUI.Button("Scooter                                             ~g~500$", nil, {RightBadge = RageUI.BadgeStyle.Bike}, true , {
					onSelected = function()
						TriggerServerEvent('location:scoot',1000)
						open = false
					end
				})


				RageUI.Button("BMX                                                  ~g~250$", nil, {RightBadge = RageUI.BadgeStyle.Bike}, true , {
					onSelected = function()
						TriggerServerEvent('location:bmx',500)
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

            if dist <= 10.0 then
            wait = 0
			DrawMarker(20, -1037.96, -2738.03, 20.16, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 0, 124, 255, 255, 1, 2, 0, nil, nil, 0)

        
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