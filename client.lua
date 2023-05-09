CreateThread(function()
    local oldCamView = GetFollowPedCamViewMode()
    local wasAiming = false
    while true do
        local isAiming = (IsPedInAnyVehicle(PlayerPedId()) and GetPedConfigFlag(PlayerPedId(), 78, true))

        if isAiming ~= wasAiming then
            if isAiming then
                oldCamView = GetFollowPedCamViewMode()
                SetFollowVehicleCamViewMode(4)
            elseif Config.GoBakToOldCamView then
                SetFollowVehicleCamViewMode(oldCamView)
            end
            wasAiming = isAiming
        end

        Wait(0)
    end
end)