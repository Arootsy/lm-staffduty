AddStateBagChangeHandler('isOnDuty', nil, function(_, _, value)
    lib.callback('illenium-appearance:server:getAppearance', false, function(skin)
        if value then
            TriggerServerEvent('txsv:checkIfAdmin')
        else
            TriggerEvent('skinchanger:loadSkin', skin)
            TriggerEvent('txcl:setAdmin', false, false, locale('no_access'))
        end

        lib.notify({ title = value and locale('duty_on') or locale('duty_off'), type = 'info' })
    end, GetEntityModel(cache.ped))
end)
