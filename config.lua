-- ========================================
-- CONFIGURAÇÃO DE ELEVADORES
-- ========================================
-- Script de Elevadores Multi-Prédio

Config = {}

-- Configuração de Prédios e Elevadores
Config.Buildings = {
    -- PRÉDIO 1: Vanilla
    {
        id = 1,
        name = "Vanilla",
        elevators = {
            {
                id = 1,
                floor = 0,
                label = "Lobby",
                icon = "couch",
                elevatorPos = vector3(-707.20, -685.01, 30.50), -- Target (porta do elevador)
                destination = vector3(-708.83, -686.71, 29.30),  -- Onde o jogador aterra
                heading = 0.0
            },
            {
                id = 2,
                floor = 1,
                label = "Bar Privado",
                icon = "champagne-glasses",
                elevatorPos = vector3(-690.26, -688.99, 35.92),
                destination = vector3(-691.29, -690.52, 35.75),
                heading = 351.18
            },
            {
                id = 3,
                floor = 2,
                label = "RoofTop",
                icon = "city",
                elevatorPos = vector3(-692.16, -688.80, 55.2),
                destination = vector3(-690.59, -689.71, 54.95),
                heading = 88.04
            }
        }
    },

    {
        id = 2,
        name = "VanillaPrivado",
        elevators = {
            {
                id = 1,
                floor = 0,
                label = "Escritório",
                icon = "briefcase",
                elevatorPos = vector3(-674.74, -690.27, 30.56), -- Target (porta do elevador)
                destination = vector3(-673.84, -688.87, 30.32),  -- Onde o jogador aterra
                heading = 178.64
            },
            {
                id = 2,
                floor = 1,
                label = "Apartamento Vip",
                icon = "crown",
                elevatorPos = vector3(-690.32, -688.32, 50.45),
                destination = vector3(-691.32, -690.72, 50.25),
                heading = 1.66
            },
            {
                id = 3,
                floor = -1,
                label = "Garagem",
                icon = "car",
                elevatorPos = vector3(-672.60, -686.69, 25.85),
                destination = vector3(-673.50, -688.29, 25.65),
                heading = 3.86
            }
        }
    },

    -- PRÉDIO 2: Diamond Casino
    {
        id = 3,
        name = "Diamond Casino",
        elevators = {
            {
                id = 1,
                floor = 1,
                label = "Lobby",
                icon = "couch",
                elevatorPos = vector3(950.0, 50.0, 58.0),
                destination = vector3(950.0, 50.0, 58.0),
                heading = 0.0
            },
            {
                id = 2,
                floor = 2,
                label = "VIP Area",
                icon = "gem",
                elevatorPos = vector3(950.0, 50.0, 68.0),
                destination = vector3(950.0, 50.0, 68.0),
                heading = 0.0
            },
            {
                id = 3,
                floor = 3,
                label = "Penthouse",
                icon = "house-chimney",
                elevatorPos = vector3(950.0, 50.0, 78.0),
                destination = vector3(950.0, 50.0, 78.0),
                heading = 0.0
            },
            {
                id = 4,
                floor = 4,
                label = "Rooftop",
                icon = "city",
                elevatorPos = vector3(950.0, 50.0, 88.0),
                destination = vector3(950.0, 50.0, 88.0),
                heading = 0.0
            }
        }
    },

    -- PRÉDIO 3: Police Station
    {
        id = 4,
        name = "Police Station",
        elevators = {
            {
                id = 1,
                floor = 1,
                label = "Recepção",
                icon = "bell-concierge",
                elevatorPos = vector3(465.17, -998.66, 31.22),
                destination = vector3(462.92, -997.65, 30.69),
                heading = 268.69
            },
            {
                id = 2,
                floor = 2,
                label = "Escritório do Chefe",
                icon = "briefcase",
                elevatorPos = vector3(465.17, -998.65, 35.82),
                destination = vector3(462.99, -997.68, 35.68),
                heading = 264.18
            },
            {
                id = 3,
                floor = 4,
                label = "Telhado",
                icon = "helicopter-symbol",
                elevatorPos = vector3(461.96, -996.56, 43.84),
                destination = vector3(463.81, -997.52, 43.68),
                heading = 92.89
            },
            {
                id = 4,
                floor = 0,
                label = "Celas",
                icon = "table-cells",
                elevatorPos = vector3(465.17, -998.66, 26.58),
                destination = vector3(462.68, -997.47, 26.39),
                heading = 266.44
            }
        }
    }
}

-- Configurações gerais
Config.ElevatorDuration = 5000 -- Duração da viagem em ms
Config.MenuDistance = 2.0 -- Distância para abrir o menu

-- Notificações
Config.Notifications = {
    elevatorCalled = "Elevador chamado!",
    arriving = "Elevador chegando...",
    arrived = "Elevador chegou!",
    travelingTo = "Viajando para: "
}
