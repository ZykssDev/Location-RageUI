ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('location:panto')
AddEventHandler('location:panto', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
    local car = "panto"
    if playerMoney >= prix then
	xPlayer.removeMoney(prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez bien reçu votre ~b~véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez d\'argent")
    end
end)



RegisterNetEvent('location:scoot')
AddEventHandler('location:scoot', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
    local car = "faggio"
    if playerMoney >= prix then
	xPlayer.removeMoney(prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez bien reçu votre ~b~véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez d\'argent")
    end
end)


RegisterNetEvent('location:bmx')
AddEventHandler('location:bmx', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
    local car = "bmx"
    if playerMoney >= prix then
	xPlayer.removeMoney(prix)
    TriggerClientEvent('g:spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "~g~Vous avez bien reçu votre ~b~véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas assez d\'argent")
    end
end)
