local config = require 'config.server'
local utils = require 'server.utils'

if config.versionCheck then lib.versionCheck('t0r3tto/trt_jobvehicles') end

utils.checkDependencies()

lib.callback.register('trt_jobvehicles:server:spawnVehicle', function(source, model, coords)
    local netId = qbx.spawnVehicle({
        model = model,
        spawnSource = coords,
        warp = config.warp and GetPlayerPed(source)
    })

    local citizenid = exports.qbx_core:GetPlayer(source).PlayerData.citizenid
    local vehicleId, errorResult = exports.qbx_vehicles:CreatePlayerVehicle({
        model = model,
        citizenid = citizenid
    })

    local plate = qbx.getVehiclePlate(NetworkGetEntityFromNetworkId(netId))
    exports.qbx_vehiclekeys:GiveKeys(source, plate)

    return vehicleId, errorResult
end)