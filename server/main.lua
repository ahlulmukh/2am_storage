ESX = exports["es_extended"]:getSharedObject()
local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
		for i=1, #(Config.Locations) do
			local stash = Config.Locations[i]
			ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner, stash.jobs)
		end
	end
end)

RegisterNetEvent('storage:openInventory')
AddEventHandler('storage:openInventory', function(id, owner)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowedJobs = { 'mechanic', 'ambulance', 'pedagang' }
    
    for _, job in ipairs(allowedJobs) do
        if xPlayer.job.name == job then
            TriggerClientEvent('ox_inventory:openInventory', source, 'stash', {id = id, owner = owner})
            return
        end
    end
end)

