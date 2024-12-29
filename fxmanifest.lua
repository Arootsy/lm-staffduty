fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'lm-staffduty'
author 'Arootsy'
version '1.0.0'

dependencies {
	'ox_lib'
}

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'src/client/*.lua'
}

server_scripts {
    'src/server/*.lua'
}

files {
    'locales/*.json',
    'shared/*.lua'
}

ox_libs {
    'locale'
}
