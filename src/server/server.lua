-- // [STARTUP] \\ --

lib.locale()
local Config = require('shared.config')

-- // [COMMANDS] \\ --

lib.addCommand(Config.Command, {
    help = locale("command_help"),
    restricted = function()
        local restricted = {}

        for group, allowed in pairs(Config.AllowedGroups) do
            if allowed then
                table.insert(restricted, 'group.' .. group)
            end
        end

        return restricted
    end,
}, function(source, args, raw)
    Player(source).state.isOnDuty = not Player(source).state.isOnDuty

    if Player(source).state.isOnDuty then
        TriggerClientEvent('illenium-appearance:client:loadJobOutfit', source, { outfitData = Config.Outfits[GetEntityModel(GetPlayerPed(source))] })
    end
end)

-- // [EVENTS] \\ --

RegisterNetEvent('txsv:checkIfAdmin', function()
    local src = source
    Wait(100) -- Required for txAdmin Wait server side.
    
    if not Player(src).state.isOnDuty then
        TriggerClientEvent("txcl:setAdmin", src, false, false, locale("no_access"))
    end
end)
