local Config = require 'config.shared_config'
local ServerConfig = require 'config.server_config'

local function sendDiscordLog(message, color)
    local embed = {
        {
            ["color"] = color,
            ["description"] = message,
        }
    }

    PerformHttpRequest(ServerConfig.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = "Server Logs", embeds = embed}), {['Content-Type'] = 'application/json'})
end

lib.addCommand(Config.Command, {
    help = locale('command_help'),
    restricted = Config.AllowedGroups,
}, function(source)
    local state = Player(source).state
    state.isOnDuty = not state.isOnDuty

    if state.isOnDuty then
        sendDiscordLog(("**%s** is nu in dienst."):format(GetPlayerName(source)), 3066993) 
        TriggerClientEvent('illenium-appearance:client:loadJobOutfit', source, { outfitData = Config.Outfits[GetEntityModel(GetPlayerPed(source))] })
    else
        sendDiscordLog(("**%s** is nu uit dienst."):format(GetPlayerName(source)), 15158332) 
    end
end)

RegisterNetEvent('txsv:checkIfAdmin', function()
    local src = source
    Wait(100)

    if not Player(src).state.isOnDuty then
        TriggerClientEvent('txcl:setAdmin', src, false, false, locale('no_access'))
    end
end)


