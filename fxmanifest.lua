fx_version 'cerulean'
game 'gta5'

author 'pika80'
description 'Script de Elevador Multi-Prédio com OxTarget e NUI'
version '1.0.0'
discord 'https://discord.gg/yourdiscordlink'

lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua',
    '@ox_lib/init.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html'
}

dependencies {
    'ox_lib',
    'ox_target'
}
