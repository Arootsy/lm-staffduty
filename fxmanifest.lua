fx_version "adamant"
game "gta5"
use_fxv2_oal "yes"
lua54 "yes"

name "lm-staffduty"
author "Arootsy"
version "1.0.0"

client_scripts { "src/client/*.lua" }
server_scripts { "src/server/*.lua", "@oxmysql/lib/MySQL.lua" }
shared_scripts { "@es_extended/imports.lua", "@ox_lib/init.lua" }
file { "shared/*.lua", "locales/*.json" }	