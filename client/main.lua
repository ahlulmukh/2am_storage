ESX = exports["es_extended"]:getSharedObject()
local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

---- OX TARGET FUNCTION ----
Citizen.CreateThread(function()
    for k,v in pairs(Config.Locations) do
        exports[Config.Target]:addBoxZone({
            coords = vector3(v.Coords.x, v.Coords.y, v.Coords.z),
            size = v.size or vector3(1.5, 1.5, 1.5),
            rotation = v.rotation or 0,
            debug = false,
            options = {
                {
                    name = 'storage_access',
                    icon = 'fa-solid fa-box',
                    label = v.label,
                    groups = v.job,
                    distance = 1,
                    canInteract = function(entity, distance, coords, name)
                        return true
                    end,
                    onSelect = function()
                        TriggerServerEvent('storage:openInventory', v.id, v.owner)
                    end,
                }
            }
        })
    end
end)
