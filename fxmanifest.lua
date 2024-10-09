fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'trt_jobvehicles'
author 't0r3tto'
description 'Job & grade based vehicle obtention'
repository 'https://github.com/t0r3tto/trt_jobvehicles'
version '1.0.1'

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/modules/lib.lua'
}

server_scripts {
	'server/utils.lua',
	'server/main.lua'
}
client_scripts {
	'@qbx_core/modules/playerdata.lua',
	'client/main.lua'
}

ox_lib 'locale'

files {
	'config/client.lua',
	'locales/*.json'
}