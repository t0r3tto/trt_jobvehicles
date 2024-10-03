local config = require 'config.client'

local VEHICLES <const> = exports.qbx_core:GetVehiclesByName()
local JOBS <const> = exports.qbx_core:GetJobs()

CreateThread(function()
    for index, garage in pairs(config.garages) do
        local marker = lib.marker.new({
            type = 2,
            coords = garage.pos.xyz,
            width = 0.2, height = 0.2,
            color = { r = 255, g = 255, b = 255, a = 75 },
        })

        lib.points.new({
            coords = garage.pos.xyz,
            distance = 5,
            nearby = function(self)
                local playerJob = QBX.PlayerData.job
                if garage.job ~= playerJob.name then return end

                marker:draw()

                if self.currentDistance < 2 then
                    local jobInfo = JOBS[playerJob.name]
                    lib.showTextUI(locale('textui_key', jobInfo.label))

                    if IsControlJustReleased(0, 38) then
                        if not garage.vehicles then
                            lib.print.error(('garage index %d does not have a pre-defined vehicles list'):format(index))
                            return
                        end

                        local options = {}
                        for model, minGrade in pairs(garage.vehicles) do
                            local vehName = VEHICLES[model]?.name or locale('invalid_vehicle')
                            local minGradeName = jobInfo.grades[minGrade]?.name or locale('invalid_grade')

                            options[#options + 1] = {
                                title = vehName,
                                description = locale('option_description', minGradeName, minGrade),
                                icon = 'fa-solid fa-car',
                                disabled = playerJob.grade.level < minGrade,
                                onSelect = function()
                                    local vehicleId, errorResult = lib.callback.await('trt_policegarage:server:spawnVehicle', false, model, garage.spawn)

                                    if not vehicleId then
                                        lib.print.error(errorResult)
                                        return
                                    end

                                    exports.qbx_core:Notify(locale('vehicle_spawned', vehName), 'success')
                                end
                            }
                        end

                        lib.registerContext({
                            id = ('trt_policegarage_vehicles_menu_%d'):format(index),
                            title = locale('context_title', jobInfo.label),
                            options = options
                        })

                        lib.showContext(('trt_policegarage_vehicles_menu_%d'):format(index))
                    end
                end
            end,
        })
    end
end)
