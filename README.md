# trt_jobvehicles

![Preview](https://i.ibb.co/5x9BBD7/Screenshot-2024-10-03-050135.png)

This resource is specifically made for QBox users since many scripts directly access SQL tables, which is bad practice and often doesn't work properly—99% of the time.

It provides a job vehicle system that allows players with certain jobs and ranks to create and spawn owned vehicles from designated locations.
For example, LEO-type jobs can have their own vehicles, instead of having to spawn and customize them each time. Might add a limit if requested in the future.

## Features

- Job & rank based vehicle spawning access
- Multiple jobs & different vehicle lists can be easily added

## Dependencies

### [ox_lib](https://github.com/overextended/ox_lib)

### [qbx_core](https://github.com/Qbox-project/qbx_core)

### [qbx_vehicles](https://github.com/Qbox-project/qbx_vehicles)

### [qbx_vehiclekeys](https://github.com/Qbox-project/qbx_vehiclekeys)

## Configuration

The configuration can be found in the `./config/` directory:

### Example config

```lua
Vehicles <const> = {
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

garages = {
    {
        job = 'police',
        pos = vec3(464.2764, -1019.8354, 28.0985),
        spawn = vec4(454.0334, -1025.3138, 28.4987, 358.4842),
        vehicles = Vehicles.Police
    },
}
```
