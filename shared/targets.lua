local TargetType = Config.CoreSettings.Target.Type


if TargetType == 'qb' then
    for k, v in pairs(Config.InteractionLocations.JobAreas) do
        exports['qb-target']:AddBoxZone(v.Name, v.Location, v.Width, v.Height, {
            name = v.Name,
            heading = v.Heading,
            debugPoly = Config.DebugPoly,
            minZ = v.MinZ,
            maxZ = v.MaxZ,
        }, {
            options = {
            {
                type = "client",
                event = v.Event,
                icon = v.Icon,
                label = v.Label,
                job = v.Job,
            }
            },
            distance = v.Distance,
        })
    end
elseif TargetType == 'ox' then
    for k, v in pairs(Config.InteractionLocations.JobAreas) do
        exports.ox_target:addBoxZone({
        coords = v.Location,
        size = v.Size,
        rotation = v.Heading,
        debug = Config.DebugPoly,
            options = {
                {
                    id = v.Name,
                    groups = v.Job,
                    event = v.Event,
                    label = v.Label,
                    icon = v.Icon,
                    distance = v.Distance,
                }
            }
        })
    end
elseif TargetType == 'custom' then
    --insert custom target code here
end
