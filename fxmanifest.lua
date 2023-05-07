fx_version 'cerulean'
games { 'gta5', 'rdr3' }

author 'Nishikoto'
description 'Supermarket'
version '0.1'

shared_scripts {
    '@jClassLib/init.lua',
    '@jZoneLib/init.lua',
    '@jBlipLib/init.lua',

    "shared.lua",
}

client_scripts {
    "Nishi/src/RMenu.lua",
    "Nishi/src/menu/RageUI.lua",
    "Nishi/src/menu/Menu.lua",
    "Nishi/src/menu/MenuController.lua",
    "Nishi/src/components/*.lua",
    "Nishi/src/menu/elements/*.lua",
    "Nishi/src/menu/items/*.lua",
    "Nishi/src/menu/panels/*.lua",
    "Nishi/src/menu/windows/*.lua", 

    "client.lua",
}

server_scripts {
    "server.lua",
}

dependencies {'jZoneLib', 'jBlipLib'}
