-- [Nishikoto]
-- [v0.1]
-- [Client]

local status = false
local main = RageUI.CreateMenu(Config.ServerName, 'Interaction', 1100, 50)
local food = RageUI.CreateSubMenu(main, Config.ServerName, Language.Food)
local drink = RageUI.CreateSubMenu(main, Config.ServerName, Language.Drink)
local other = RageUI.CreateSubMenu(main, Config.ServerName, Language.Other)

main.Closed = function()
    status = false
end

function NishiMenu()

    if (status) then
        return;
    end
     
    status = true

    CreateThread(function()
        
        RageUI.Visible(main, true)
        while status do

            RageUI.IsVisible(main, function()

                RageUI.Button(Language.Food, nil, {
                    RightLabel = '→→',
                    Color = Param.HLColor
                }, true, {}, food)

                RageUI.Button(Language.Drink, nil, {
                    RightLabel = '→→',
                    Color = Param.HLColor
                }, true, {}, drink)

                RageUI.Button(Language.Other, nil, {
                    RightLabel = '→→',
                    Color = Param.HLColor
                }, true, {}, other)


            end)

            RageUI.IsVisible(food, function()

                for _, v in pairs(Config.Items.Foods) do

                    RageUI.Button(v.name, nil, {
                        RightLabel = '~g~'..v.price..'$',
                        Color = Param.HLColor
                    }, true, {
                        onSelected = function()
                            TriggerServerEvent('nishi:buyitem', v.item, v.price)
                        end
                    })

                end

            end)

            RageUI.IsVisible(drink, function()
                
                for _, v in pairs(Config.Items.Drinks) do
                
                    RageUI.Button(v.name, nil, {
                        RightLabel = '~g~'..v.price..'$',
                        Color = Param.HLColor
                    }, true, {
                        onSelected = function()
                            TriggerServerEvent('nishi:buyitem', v.item, v.price)
                        end
                    })

                end

            end)

            RageUI.IsVisible(other, function()
                
                for _, v in pairs(Config.Items.Other) do
                
                    RageUI.Button(v.name, nil, {
                        RightLabel = '~g~'..v.price..'$',
                        Color = Param.HLColor
                    }, true, {
                        onSelected = function()
                            TriggerServerEvent('nishi:buyitem', v.item, v.price)
                        end
                    })

                end

            end)

            Wait(1)

        end

    end)

end

for _,v in pairs(Config.Supermarket) do
    local ZoneSup = Zone()
        :SetPosition(v.position)
        :SetSize(10);

    local marker = ZoneSup:AddMarker()
        :SetType(eMarkerType.HorizontalCircleFat)
        :SetPosition(v.position:Subtract(Vector3(0.0, 0.0, 0.95)))
        :SetDirection(Direction())
        :SetScale(Scale(0.7, 0.7, 0.7))
        :SetRotation(Rotation())
        :SetColor(Color(227, 227, 109, 150))
        :SetRotate(true)
        :SetBobUpAndDown(false)
        :SetFaceCamera(false);

    local radius = ZoneSup:AddRadius()
        :SetSize(2)
        :SetAction(function()
            ESX.ShowHelpNotification('~INPUT_CONTEXT~ '..Language.Menu)
            if (IsControlJustPressed(0,38)) then
                NishiMenu()
            end
        end)

        :OnEnter(function()
            RageUI.Visible(main, false)
            status = false
        end)

        :OnLeave(function()
            RageUI.Visible(main, false)
            status = false
        end)

    ZoneSup:SetAction(function()
        marker:Draw()
    end)

    ----------------------

    Blip(v.position)
        :SetLabel(v.name)
        :SetSprite(v.spriteBlip)
        :SetColor(v.colorBlip)
        :SetScale(v.scaleBlip)

end
