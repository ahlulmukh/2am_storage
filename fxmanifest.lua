fx_version 'bodacious'
game 'gta5'
description 'Custom Storage'
author 'Ahmuq'
version '1.0'
lua54 'yes'

server_scripts {
	'config.lua',
	'server/main.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	--'@es_extended/locale.lua',
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended'
}
