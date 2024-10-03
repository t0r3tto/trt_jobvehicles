local Utils = {}

function Utils.checkDependencies()
    local dependencies = {
        'ox_lib',
        'qbx_core',
        'qbx_vehicles',
        'qbx_vehiclekeys'
    }

    for _, resource in pairs(dependencies) do
        assert(GetResourceState(resource) ~= 'stopped', ('Missing dependency %s'):format(resource))
    end
end

return Utils