local Config = require 'config.shared_config'
local ServerConfig = require 'config.server_config'

lib.addCommand(Config.Command, {
    help = locale('command_help'),
    restricted = Config.AllowedGroups,
}, function(source)
    local state = Player(source).state
    state.isOnDuty = not state.isOnDuty

    if state.isOnDuty then
        TriggerClientEvent('illenium-appearance:client:loadJobOutfit', source, { outfitData = Config.Outfits[GetEntityModel(GetPlayerPed(source))] })
    end
end)

RegisterNetEvent('txsv:checkIfAdmin', function()
    local src = source
    Wait(100) -- Required for txAdmin Wait server side.

    if not Player(src).state.isOnDuty then
        TriggerClientEvent('txcl:setAdmin', src, false, false, locale('no_access'))
    end
end)
