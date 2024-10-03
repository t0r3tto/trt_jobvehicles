--- Vehicle configuration table for different job vehicles
--- @class Vehicles
--- @field jobName table<string, number> Vehicle model (key) and the minimum grade required (value)
local Vehicles <const> = {
    Police = {
        police = 1, -- vehicleModel = minGrade
        police2 = 2,
        police3 = 3,
        police4 = 4,
    },

    Sheriff = {
        sheriff = 1,
        sheriff2 = 2,
    }
}

--- Garage configuration for different jobs
--- @class GarageConfig
--- @field job string job allowed to use the garage (e.g., 'police', 'sheriff')
--- @field pos vector3 position of the garage
--- @field spawn vector4 spawn position and heading for the vehicle
--- @field vehicles table list of vehicles available for the job, referenced from the Vehicles table

--- Garages array with specific job configuration
--- @type GarageConfig[]
return {
    versionCheck = true,
    garages = {
        {
            job = 'police',
            pos = vec3(464.2764, -1019.8354, 28.0985),
            spawn = vec4(454.0334, -1025.3138, 28.4987, 358.4842),
            vehicles = Vehicles.Police
        },
        {
            job = 'sheriff',
            pos = vec3(1854.9135, 3679.3774, 33.8244),
            spawn = vec4(1853.7336, 3675.9800, 33.7613, 211.5319),
            vehicles = Vehicles.Sheriff
        },
    },
}