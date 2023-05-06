-- [Nishikoto]
-- [v0.1]
-- [Server]

RegisterNetEvent('nishi:buyitem', function(item, price)
 
    local _src = source
    local pos = GetEntityCoords(GetPlayerPed(_src))
    
    local xPlayer = ESX.GetPlayerFromId(_src)
    if not xPlayer then return end
    if price == 0 then return end

    for _,v in pairs(Config.Supermarket) do
 
        if (v.position:Distance(pos) < 5) then
 
            local money = xPlayer.getMoney()

            if (money >= price) then

                xPlayer.removeMoney(price)
                xPlayer.addInventoryItem(item, 1)
                local label = ESX.GetItemLabel(item)
                xPlayer.showNotification(Language.PurchaseMade..'~y~'..label)

            else

                xPlayer.showNotification(Language.PurchaseNoMoney)

            end

            return
        end

    end

    console.err(xPlayer.name..' a tenter d\'utiliser l\'event ^1nishi:buyitem')
    xPlayer.kick('Ba alors ça essaye de cheat !?')

end)