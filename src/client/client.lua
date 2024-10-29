-- // [STARTUP] \\ --
lib.locale()

-- // [STATEBAG] \\ --

AddStateBagChangeHandler('isOnDuty', nil, function(bagName, key, value, _reserved, replicated)
    lib.callback('lm-staffduty:cb:getPlayerSkin', false, function(skin)
        if value then
            TriggerServerEvent('txsv:checkIfAdmin')

            return lib.notify({ title = locale("duty_on"), type = 'infrom', position = 'top' })
        else
            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('txcl:setAdmin', false, false, locale("no_access"))

            return lib.notify({ title = locale("duty_off"), type = 'infrom', position = 'top' })
        end
    end)
end)
