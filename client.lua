-- ========================================
-- SCRIPT PRINCIPAL DE ELEVADORES
-- ========================================
local elevatorActive = {}
local currentFloor = {}
local elevatorZones = {}
local function RemoveElevatorTargets()
    for _, zoneId in ipairs(elevatorZones) do
        exports.ox_target:removeZone(zoneId)
    end
    elevatorZones = {}
end
-- Criar targets OxTarget em cada andar (elevatorPos = interação)
function CreateElevatorTargets()
    RemoveElevatorTargets()
    for buildingId, building in ipairs(Config.Buildings) do
        for _, floor in ipairs(building.elevators) do
            if not floor.elevatorPos then
                print(("^1[ELEVADOR] Andar %s do prédio '%s' sem elevatorPos!^7"):format(floor.id, building.name or buildingId))
            else
                local zoneId = exports.ox_target:addBoxZone({
                    coords = floor.elevatorPos,
                    size = vector3(2.0, 2.0, 2.5),
                    rotation = 0,
                    debug = false,
                    options = {
                        {
                            name = "elevator_floor_" .. buildingId .. "_" .. floor.id,
                            icon = "fas fa-elevator",
                            label = "Chamar Elevador",
                            onSelect = function()
                                OpenElevatorMenuNUI(buildingId, building)
                            end,
                            distance = Config.MenuDistance
                        }
                    }
                })
                elevatorZones[#elevatorZones + 1] = zoneId
            end
        end
    end
end
-- Abrir menu com NUI
function OpenElevatorMenuNUI(buildingId, building)
    SendNUIMessage({
        type = "openMenu",
        building = buildingId,
        floors = building.elevators
    })
    SetNuiFocus(true, true)
end

-- Fechar menu NUI
function CloseElevatorMenuNUI()
    SendNUIMessage({
        type = "closeMenu"
    })
    SetNuiFocus(false, false)
end

-- Callback para selecionar floor
RegisterNUICallback('selectFloor', function(data, cb)
    local buildingId = data.building
    local floor = data.floor
    CloseElevatorMenuNUI()
    CallElevator(buildingId, floor)
    cb('ok')
end)

-- Callback para fechar menu
RegisterNUICallback('closeMenu', function(data, cb)
    CloseElevatorMenuNUI()
    cb('ok')
end)

-- Chamar elevador e transportar jogador
function CallElevator(buildingId, elevator)
    local playerPed = PlayerPedId()

    -- Notificação: elevador chamado
    lib.notify({
        title = "ELEVADOR",
        description = Config.Notifications.elevatorCalled,
        type = "inform",
        duration = 3000,
        position = "top-right"
    })

    -- Bloquear movimento
    SetBlockingOfNonTemporaryEvents(playerPed, true)

    -- Parar animações atuais
    ClearPedTasks(playerPed)

    -- Notificação: a chegar
    lib.notify({
        title = "ELEVADOR",
        description = Config.Notifications.arriving,
        type = "inform",
        duration = 3000,
        position = "top-right"
    })

    Wait(2000)

    -- Limpar tarefas antes de teleportar
    ClearPedTasks(playerPed)

    -- Teleportar
    RequestCollisionAtCoord(elevator.destination.x, elevator.destination.y, elevator.destination.z)
    SetEntityCoords(playerPed,
        elevator.destination.x,
        elevator.destination.y,
        elevator.destination.z,
        false, false, false, false
    )
    SetEntityHeading(playerPed, elevator.heading)

    ClearPedTasks(playerPed)

    -- Notificação de chegada
    lib.notify({
        title = "ELEVADOR",
        description = Config.Notifications.arrived .. elevator.label,
        type = "success",
        duration = 3000,
        position = "top-right"
    })

    Wait(500)
    SetBlockingOfNonTemporaryEvents(playerPed, false)
end

-- Loop principal
Citizen.CreateThread(function()
    CreateElevatorTargets()
    print("^2[ELEVADOR] Script iniciado com sucesso!^7")
    print("^3[ELEVADOR] " .. #Config.Buildings .. " prédios carregados!^7")
end)

-- Comando para recarregar targets
RegisterCommand('reloadElevators', function()
    CreateElevatorTargets()
    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"ADMIN", "Elevadores recarregados!"}
    })
end, false)
