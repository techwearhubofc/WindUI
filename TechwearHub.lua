local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/techwearhubofc/Tech/refs/heads/main/Library"))()

local Window = redzlib:MakeWindow({
  Title = "Techwear Hub | Brookhaven RP",
  SubTitle = "by Kaelix",
  SaveFolder = "TechwearHub"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://76005132888448", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local InfoTab = Window:MakeTab({"| credits", "info"})

InfoTab:AddDiscordInvite({
    Name = "Techwear Hub | Community",
    Description = "Junte-se à nossa comunidade discord para receber informações sobre a próxima atualização",
    Banner = "rbxassetid://84129109856875",
    Logo = "rbxassetid://76005132888448",
    Invite = "https://discord.gg/chsMcbRZQE",
	Members = 999, 
	Online = 999, 
})

InfoTab:AddSection({ "Informações do Script" })
InfoTab:AddParagraph({ "Owner / Developer:", "Kaelix" })
InfoTab:AddParagraph({ "Você está usando:", "Techwear Hub Brookhaven " })
InfoTab:AddParagraph({"Your executor:", executor})

InfoTab:AddSection({ "Rejoin" })
InfoTab:AddButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

local LocalPlayerTab = Window:MakeTab({"| visual/client", "user"})

local Section = LocalPlayerTab:AddSection({
    Name = "Velocidade, Gravidade e Pulo"
})

LocalPlayerTab:AddTextBox({
    Name = "Velocidade do Player",
    PlaceholderText = "Digite a velocidade",
    Callback = function(value)
        local speed = tonumber(value)
        if speed and pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.WalkSpeed = speed
        else
            warn("Velocidade inválida ou personagem não encontrado!")
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Resetar velocidade",
    Callback = function()
        if pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.WalkSpeed = 16
        end
    end
})

LocalPlayerTab:AddTextBox({
    Name = "Tamanho do Pulo",
    PlaceholderText = "Digite a altura do pulo",
    Callback = function(value)
        local jumpHeight = tonumber(value)
        if jumpHeight and pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.JumpPower = jumpHeight
        else
            warn("Altura de pulo inválida ou personagem não encontrado!")
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Resetar Pulo",
    Callback = function()
        if pl.Character and pl.Character:FindFirstChild("Humanoid") then
            pl.Character.Humanoid.JumpPower = 50
        end
    end
})

LocalPlayerTab:AddTextBox({
    Name = "Gravidade",
    PlaceholderText = "Digite a gravidade",
    Callback = function(value)
        local gravity = tonumber(value)
        if gravity then
            workspace.Gravity = gravity
        else
            warn("Gravidade inválida!")
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Resetar Gravidade",
    Callback = function()
        workspace.Gravity = 196.2
    end
})

Section = LocalPlayerTab:AddSection({
    Name = "Spam Chat"
})

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration and tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)
    if not msg or msg == "" then return end
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
        end)
        if not success then
            warn("Erro ao enviar chat: " .. err)
        end
    elseif chat then
        local success, err = pcall(function()
            chat:SendAsync(msg)
        end)
        if not success then
            warn("Erro ao enviar chat: " .. err)
        end
    end
end

LocalPlayerTab:AddTextBox({
    Name = "Enter text",
    PlaceholderText = "Digite a mensagem",
    Callback = function(text)
        TextSave = text
    end
})

LocalPlayerTab:AddButton({
    Name = "Send Chat",
    Callback = function()
        sendchat(TextSave)
    end
})

getgenv().TechwearHubEnviarDelay = 1

LocalPlayerTab:AddSlider({
    Name = "Delay do Spam",
    Min = 0.4,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(Value)
        getgenv().TechwearHubEnviarDelay = Value
    end
})

LocalPlayerTab:AddToggle({
    Name = "Spam Chat",
    Default = false,
    Flag = "Spawn de textos",
    Callback = function(Value)
        getgenv().TechwearHubSpawnText = Value
        while getgenv().TechwearHubSpawnText do
            sendchat(TextSave)
            task.wait(getgenv().TechwearHubEnviarDelay)
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Spam chat Hacked By Tech",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rServer: Hacked by Techwear Hub")
        else 
            print("Nadaa")
    end
end
})

LocalPlayerTab:AddButton({
    Name = "Clear Chat",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rServer: Chat Cleared")
        else 
            print("Nadaa")
    end
end
})

Section = LocalPlayerTab:AddSection({
    Name = "Headsit"
})

local selectedHeadSit = nil
local headSitConnection = nil

local headSitDropdown = LocalPlayerTab:AddDropdown({
    Name = "Selecionar Player",
    Default = "",
    Options = players,
    Callback = function(Value)
        selectedHeadSit = Value
    end
})

LocalPlayerTab:AddToggle({
    Name = "Head Sit (Cavalinho)",
    Default = false,
    Callback = function(bool)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local humanoid = character:WaitForChild("Humanoid")

        if not selectedHeadSit or selectedHeadSit == "" then
            warn("Nenhum jogador selecionado para Head Sit!")
            return false
        end

        local selectedPlayer = game.Players:FindFirstChild(selectedHeadSit)

        if bool then
            if selectedPlayer and selectedPlayer.Character then
                humanoid.Sit = true

                if headSitConnection then
                    headSitConnection:Disconnect()
                end

                headSitConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Head") and humanoid.Sit then
                        local targetHead = selectedPlayer.Character.Head
                        humanoidRootPart.CFrame = targetHead.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)
                    else
                        if headSitConnection then
                            headSitConnection:Disconnect()
                            headSitConnection = nil
                            humanoid.Sit = false
                        end
                    end
                end)
            else
                warn("Jogador selecionado não encontrado ou sem Character!")
                return false
            end
        else
            if headSitConnection then
                headSitConnection:Disconnect()
                headSitConnection = nil
            end
            humanoid.Sit = false
        end
    end
})

LocalPlayerTab:AddButton({
    Name = "Atualizar tabela",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if headSitDropdown and updatedPlayers then
            pcall(function()
                headSitDropdown:Refresh(updatedPlayers)
            end)
            if selectedHeadSit and not game.Players:FindFirstChild(selectedHeadSit) then
                selectedHeadSit = nil
                pcall(function()
                    headSitDropdown:Set("")
                end)
            end
        end
    end
})

----------------------------------------------------------------------------------------------------------------------------------
                                                         -- Tab3:  Avatar Editor--
----------------------------------------------------------------------------------------------------------------------------------

local Tab3 = Window:MakeTab({"| avatar", "rbxassetid://10734952036"})

local Section = Tab3:AddSection({"Copy Avatar"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local valor_do_nome_do_joagdor
local Target = nil

local function GetPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = Tab3:AddDropdown({
    Name = "Players List",
    Description = "",
    Options = GetPlayerNames(),
    Default = "",
    Flag = "player list",
    Callback = function(playername)
        valor_do_nome_do_joagdor = playername
        Target = playername -- Conectar o dropdown ao Copy Avatar
    end
})

local function UptadePlayers()
    Dropdown:Set(GetPlayerNames())
end

UptadePlayers()

Tab3:AddButton({"Atualizar lista", function()
    UptadePlayers()
end})

Players.PlayerAdded:Connect(UptadePlayers)
Players.PlayerRemoving:Connect(UptadePlayers)

Tab3:AddButton({
    Name = "Copy Avatar",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                -- RESETAR LOCALPLAYER
                local LDesc = LHumanoid:GetAppliedDescription()

                -- Remover acessórios, roupas e face atuais
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                -- Enviar partes do corpo
                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                -- Nome, bio e cor
                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

------------------------------------------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"Roupas 3D"})

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Namespace para evitar conflitos
local AvatarManager = {}
AvatarManager.ReplicatedStorage = ReplicatedStorage

-- Função para exibir notificação
function AvatarManager:MostrarNotificacao(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Aviso",
            Text = mensagem,
            Duration = 5
        })
    end)
end

-- Tabela de avatares
AvatarManager.Avatares = {
    { Nome = "Gato de Manga", ID = 124948425515124 },
    { Nome = "Tung Saur", ID = 117098257036480 },
    { Nome = "Tralaleiro", ID = 99459753608381 },
    { Nome = "Monstro S.A", ID = 123609977175226 },
    { Nome = "Trenzinho", ID = 80468697076178 },
    { Nome = "Dino", ID = 11941741105 },
    { Nome = "Pou idoso", ID = 15742966010  },
    { Nome = "Coco/boxt@", ID = 77013984520332  },
    { Nome = "Coelho", ID = 71797333686800  },
    { Nome = "Hipopótamo", ID = 73215892129281 },
    { Nome = "Ratatui", ID = 108557570415453 },
    { Nome = "Galinha", ID = 71251793812515 },
    { Nome = "Pepa pig", ID = 92979204778377 },
    { Nome = "pinguin", ID = 94944293759578 },
    { Nome = "Sid", ID = 87442757321244 },
    { Nome = "puga grande", ID = 111436158728716 },
    { Nome = "SHREK AMALDIÇOADO", ID = 120960401202173 },
    { Nome = "mosquito grande", ID = 108052868536435 },
    { Nome = "Noob Invertido", ID = 106596990206151 },
    { Nome = "Pato(a)", ID = 135132836238349 },
    { Nome = "Cachorro Chihuahua", ID = 18656467256 },
    { Nome = "Gato sla", ID = 18994959003 },
    { Nome = "Gato fei ", ID = 77506186615650 },
    { Nome = "Inpostor", ID = 18234669337 },
    { Nome = "Simon amarelo", ID = 75183593514657 },
    { Nome = "Simon azul", ID = 76155710249925 }
    
}
-- Função para obter os nomes dos avatares para o dropdown
function AvatarManager:GetAvatarNames()
    local nomes = {}
    for _, avatar in ipairs(self.Avatares) do
        table.insert(nomes, avatar.Nome)
    end
    return nomes
end

-- Função para equipar o avatar
function AvatarManager:EquiparAvatar(avatarName)
    for _, avatar in ipairs(self.Avatares) do
        if avatar.Nome == avatarName then
            local args = { avatar.ID }
            local success, result = pcall(function()
                return self.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
            end)
            if success then
                self:MostrarNotificacao("Avatar " .. avatarName .. " equipado com sucesso!")
            else
                self:MostrarNotificacao("Falha ao equipar o avatar " .. avatarName .. "!")
            end
            return
        end
    end
    self:MostrarNotificacao("Avatar " .. avatarName .. " não encontrado!")
end

-- Tab3: Opção de Avatar
-- Dropdown para avatares
local AvatarDropdown = Tab3:AddDropdown({
    Name = "Assesorios 3D",
    Description = "Selecione  para equipar",
    Default = nil,
    Options = AvatarManager:GetAvatarNames(),
    Callback = function(avatarSelecionado)
        _G.SelectedAvatar = avatarSelecionado
    end
})

-- Botão para equipar avatar
Tab3:AddButton({
    Name = "Equipar ",
    Description = "Equipar selecionado",
    Callback = function()
        if not _G.SelectedAvatar or _G.SelectedAvatar == "" then
            AvatarManager:MostrarNotificacao("Nenhum avatar selecionado!")
            return
        end
        AvatarManager:EquiparAvatar(_G.SelectedAvatar)
    end
})



local colors = {
    Color3.new(1, 0, 0),       -- Vermelho
    Color3.new(0, 1, 0),       -- Verde
    Color3.new(0, 0, 1),       -- Azul
    Color3.new(1, 1, 0),       -- Amarelo
    Color3.new(0, 1, 1),       -- Ciano
    Color3.new(1, 0, 1)        -- Magenta
}

-- Variável para controlar o estado do toggle House RGB
local isHouseRGBActive = false

-- Função para alterar a cor da casa
local function changeColor()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = replicatedStorage:FindFirstChild("RE") and replicatedStorage.RE:FindFirstChild("1Player1sHous1e")
    
    if not remoteEvent then
        warn("RemoteEvent '1Player1sHous1e' não encontrado.")
        return
    end

    while isHouseRGBActive do
        for _, color in ipairs(colors) do
            if not isHouseRGBActive then return end
            local args = {
                [1] = "ColorPickHouse",
                [2] = color
            }
            pcall(function()
                remoteEvent:FireServer(unpack(args))
            end)
            task.wait(0.8)
        end
    end
end

local function toggleHouseRGB(state)
    isHouseRGBActive = state
    if isHouseRGBActive then
        print("House RGB Activated")
        spawn(changeColor)
    else
        print("House RGB Deactivated")
    end
end

-- Variáveis globais
local isUnbanActive = false
local HouseTab = Window:MakeTab({"| casas", "home"})
local SelectHouse = nil
local NoclipDoor = nil

-- Função para obter lista de casas
local function getHouseList()
    local Tabela = {}
    local lots = workspace:FindFirstChild("001_Lots")
    if lots then
        for _, House in ipairs(lots:GetChildren()) do
            if House.Name ~= "For Sale" and House:IsA("Model") then
                table.insert(Tabela, House.Name)
            end
        end
    end
    return Tabela
end

-- Dropdown para selecionar casas
pcall(function()
    HouseTab:AddDropdown({
        Name = "Selecione a Casa",
        Options = getHouseList(),
        Default = "...",
        Callback = function(Value)
            SelectHouse = Value
            if NoclipDoor then
                NoclipDoor:Set(false)
            end
            print("Casa selecionada: " .. tostring(Value))
        end
    })
end)

-- Função para atualizar a lista de casas
local function DropdownHouseUpdate()
    local Tabela = getHouseList()
    print("DropdownHouseUpdate called. Houses found:", #Tabela)
    pcall(function()
        HouseTab:ClearDropdown("Selecione a Casa") -- Tentar limpar dropdown, se suportado
        HouseTab:AddDropdown({
            Name = "Selecione a Casa",
            Options = Tabela,
            Default = "...",
            Callback = function(Value)
                SelectHouse = Value
                if NoclipDoor then
                    NoclipDoor:Set(false)
                end
            end
        })
    end)
end

-- Inicializar dropdown
pcall(DropdownHouseUpdate)

-- Botão para atualizar lista de casas
pcall(function()
    HouseTab:AddButton({
        Name = "Atualizar Lista de Casas",
        Callback = function()
            print("Atualizar Lista de Casas button clicked.")
            pcall(DropdownHouseUpdate)
        end
    })
end)

-- Botão para teleportar para casa
pcall(function()
    HouseTab:AddButton({
        Name = "Teleportar para Casa",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(House.WorldPivot.Position)
            else
                print("Casa não encontrada: " .. tostring(SelectHouse))
            end
        end
    })
end)

-- Botão para teleportar para cofre
pcall(function()
    HouseTab:AddButton({
        Name = "Teleportar para Cofre",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and House:FindFirstChild("HousePickedByPlayer") and game.Players.LocalPlayer.Character then
                local safe = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_Safe")
                if safe then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(safe.WorldPivot.Position)
                else
                    print("Cofre não encontrado na casa: " .. tostring(SelectHouse))
                end
            else
                print("Casa não encontrada: " .. tostring(SelectHouse))
            end
        end
    })
end)

-- Toggle para atravessar porta
pcall(function()
    NoclipDoor = HouseTab:AddToggle({
        Name = "Atravessar Porta da Casa",
        Description = "",
        Default = false,
        Callback = function(Value)
            pcall(function()
                local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                if House and House:FindFirstChild("HousePickedByPlayer") then
                    local housepickedbyplayer = House.HousePickedByPlayer
                    local doors = housepickedbyplayer.HouseModel:FindFirstChild("001_HouseDoors")
                    if doors and doors:FindFirstChild("HouseDoorFront") then
                        for _, Base in ipairs(doors.HouseDoorFront:GetChildren()) do
                            if Base:IsA("BasePart") then
                                Base.CanCollide = not Value
                            end
                        end
                    end
                end
            end)
        end
    })
end)

-- Toggle para tocar campainha
pcall(function()
    HouseTab:AddToggle({
        Name = "Tocar Campainha",
        Description = "",
        Default = false,
        Callback = function(Value)
            getgenv().ChaosHubAutoSpawnDoorbellValue = Value
            spawn(function()
                while getgenv().ChaosHubAutoSpawnDoorbellValue do
                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                    if House and House:FindFirstChild("HousePickedByPlayer") then
                        local doorbell = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_DoorBell")
                        if doorbell and doorbell:FindFirstChild("TouchBell") then
                            pcall(function()
                                fireclickdetector(doorbell.TouchBell.ClickDetector)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end)

-- Toggle para bater na porta
pcall(function()
    HouseTab:AddToggle({
        Name = "Bater na Porta",
        Description = "",
        Default = false,
        Callback = function(Value)
            getgenv().ChaosHubAutoSpawnDoorValue = Value
            spawn(function()
                while getgenv().ChaosHubAutoSpawnDoorValue do
                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                    if House and House:FindFirstChild("HousePickedByPlayer") then
                        local doors = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors")
                        if doors and doors:FindFirstChild("HouseDoorFront") and doors.HouseDoorFront:FindFirstChild("Knock") then
                            pcall(function()
                                fireclickdetector(doors.HouseDoorFront.Knock.TouchBell.ClickDetector)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end)
pcall(function()
    HouseTab:AddSection({ Name = "Teleporte Para Casas" })
end)

-- Lista de casas para teletransporte
local casas = {
    ["Casa 1"] = Vector3.new(260.29, 4.37, 209.32),
    ["Casa 2"] = Vector3.new(234.49, 4.37, 228.00),
    ["Casa 3"] = Vector3.new(262.79, 21.37, 210.84),
    ["Casa 4"] = Vector3.new(229.60, 21.37, 225.40),
    ["Casa 5"] = Vector3.new(173.44, 21.37, 228.11),
    ["Casa 6"] = Vector3.new(-43, 21, -137),
    ["Casa 7"] = Vector3.new(-40, 36, -137),
    ["Casa 11"] = Vector3.new(-21, 40, 436),
    ["Casa 12"] = Vector3.new(155, 37, 433),
    ["Casa 13"] = Vector3.new(255, 35, 431),
    ["Casa 14"] = Vector3.new(254, 38, 394),
    ["Casa 15"] = Vector3.new(148, 39, 387),
    ["Casa 16"] = Vector3.new(-17, 42, 395),
    ["Casa 17"] = Vector3.new(-189, 37, -247),
    ["Casa 18"] = Vector3.new(-354, 37, -244),
    ["Casa 19"] = Vector3.new(-456, 36, -245),
    ["Casa 20"] = Vector3.new(-453, 38, -295),
    ["Casa 21"] = Vector3.new(-356, 38, -294),
    ["Casa 22"] = Vector3.new(-187, 37, -295),
    ["Casa 23"] = Vector3.new(-410, 68, -447),
    ["Casa 24"] = Vector3.new(-348, 69, -496),
    ["Casa 28"] = Vector3.new(-103, 12, 1087),
    ["Casa 29"] = Vector3.new(-730, 6, 808),
    ["Casa 30"] = Vector3.new(-245, 7, 822),
    ["Casa 31"] = Vector3.new(639, 76, -361),
    ["Casa 32"] = Vector3.new(-908, 6, -361),
    ["Casa 33"] = Vector3.new(-111, 70, -417),
    ["Casa 34"] = Vector3.new(230, 38, 569),
    ["Casa 35"] = Vector3.new(-30, 13, 2209)
}

-- Criar lista de nomes de casas ordenada
local casasNomes = {}
for nome, _ in pairs(casas) do
    table.insert(casasNomes, nome)
end

table.sort(casasNomes, function(a, b)
    local numA = tonumber(a:match("%d+")) or 0
    local numB = tonumber(b:match("%d+")) or 0
    return numA < numB
end)

-- Dropdown para teletransporte
pcall(function()
    HouseTab:AddDropdown({
        Name = "Selecionar Casa",
        Options = casasNomes,
        Callback = function(casaSelecionada)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(casas[casaSelecionada])
            end
        end
    })
end)

-- Label após dropdown
pcall(function()
    HouseTab:AddLabel("Teleporte para a Casa que Quiser")
end)

-- Seção para Auto Unban
pcall(function()
    HouseTab:AddSection({ Name = "Auto Unban" })
end)

-- Toggle para Auto Unban
pcall(function()
    HouseTab:AddToggle({
        Name = "Auto Unban",
        Default = false,
        Callback = function(state)
            isUnbanActive = state
            if isUnbanActive then
                print("Auto Unban Activated")
                spawn(startAutoUnban)
            else
                print("Auto Unban Deactivated")
            end
        end
    })
end)

-- Label após Auto Unban
pcall(function()
    HouseTab:AddLabel("Te desbane automaticamente das Casas")
end)

-- Seção para Casa RGB
pcall(function()
    HouseTab:AddSection({ Name = "Casa RGB" })
end)

-- Toggle para Casa RGB
pcall(function()
    HouseTab:AddToggle({
        Name = "Casa RGB",
        Default = false,
        Callback = function(state)
            toggleHouseRGB(state)
        end
    })
end)

-- Label após Casa RGB
pcall(function()
    HouseTab:AddLabel("Deixa a sua casa RGB")
end)

-- Função para Auto Unban
function startAutoUnban()
    while isUnbanActive do
        pcall(function()
            for _, v in pairs(game:GetService("Workspace"):WaitForChild("001_Lots"):GetDescendants()) do
                if v.Name:match("^BannedBlock%d+$") then
                    v:Destroy()
                end
            end
        end)
        task.wait(1)
    end
end

---------------------------------------------------------------------------------------------------------------------------------
                                          -- === CarTab: Car === --
---------------------------------------------------------------------------------------------------------------------------------
local CarTab = Window:MakeTab({"| carro", "car"})
local colors = {
    Color3.new(1, 0, 0),     -- Red
    Color3.new(0, 1, 0),     -- Green
    Color3.new(0, 0, 1),     -- Blue
    Color3.new(1, 1, 0),     -- Yellow
    Color3.new(1, 0, 1),     -- Magenta
    Color3.new(0, 1, 1),     -- Cyan
    Color3.new(0.5, 0, 0.5), -- Purple
    Color3.new(1, 0.5, 0)    -- Orange
}

-- Replicated Storage Service
local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")

-- RGB Color Change Logic
local isColorChanging = false
local colorChangeCoroutine = nil

local function changeCarColor()
    while isColorChanging do
        for _, color in ipairs(colors) do
            if not isColorChanging then return end
            local args = {
                [1] = "PickingCarColor",
                [2] = color
            }
            remoteEvent:FireServer(unpack(args))
            wait(1)
        end
    end
end

CarTab:AddButton({
    Name = "Remove All Cars",
    Callback = function()
        local ofnawufn = false

if ofnawufn == true then
    return
end
ofnawufn = true

local cawwfer = "MilitaryBoatFree" -- Alterado para MilitaryBoatFree
local oldcfffff = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58) -- Coordenadas atualizadas
wait(0.3)

local args = {
    [1] = "PickingBoat", -- Alterado para PickingBoat
    [2] = cawwfer
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(1)

local wrinfjn
for _, errb in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if errb:IsA("VehicleSeat") then
        wrinfjn = errb
    end
end

repeat
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then return end
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,1,0)
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,-1,0)
    task.wait()
until game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn

for _, wifn in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if wifn.Name == "PhysicalWheel" then
        wifn:Destroy()
    end
end

local FLINGED = Instance.new("BodyThrust", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass) 
FLINGED.Force = Vector3.new(50000, 0, 50000) 
FLINGED.Name = "SUNTERIUM HUB FLING"
FLINGED.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.Position

for _, wvwvwasc in pairs(game.workspace.Vehicles:GetChildren()) do
    for _, ascegr in pairs(wvwvwasc:GetDescendants()) do
        if ascegr.Name == "VehicleSeat" then
            local targetcar = ascegr
            local tet = Instance.new("BodyVelocity", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass)
            tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            tet.P = 1250
            tet.Velocity = Vector3.new(0,0,0)
            tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
            for m=1,25 do
                local pos = {x=0, y=0, z=0}
                pos.x = targetcar.Position.X
                pos.y = targetcar.Position.Y
                pos.z = targetcar.Position.Z
                pos.x = pos.x + targetcar.Velocity.X / 2
                pos.y = pos.y + targetcar.Velocity.Y / 2
                pos.z = pos.z + targetcar.Velocity.Z / 2
                if pos.y <= -200 then
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(0,1000,0)
                else
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z))
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) + Vector3.new(0,-2,0)
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(0,0,2)
                    task.wait()
                    game.workspace.Vehicles[
game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(2,0,0)
                    task.wait()
                end
                task.wait()
            end
        end
    end
end

task.wait()
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
game.Players.LocalPlayer.Character.Humanoid.Sit = false
wait()
local tet = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
tet.P = 1250
tet.Velocity = Vector3.new(0,0,0)
tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
wait(0.1)
for m=1,2 do 
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
end
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()
wait(0.2)
ofnawufn = false
    end
})

CarTab:AddParagraph({"Informação:", "Recomendo usar 2 vezes para garantir que todos os veículos sejam removidos"})

CarTab:AddButton({
    Name = "Bring All Cars",
    Callback = function()
        for _, v in next, workspace.Vehicles:GetChildren() do
            v:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character:GetPrimaryPartCFrame())
        end
    end
})

CarTab:AddParagraph({"Informação:", "Puxa todos os carros do servidor até você"})

-- Speed V1 Section
local SpeedSection = CarTab:AddSection({"Speed V1"})

local Speed = 50
local Turbo = 50

local function ChangeCarSpeedAndTurbo(speedValue, turboValue)
    local player = game.Players.LocalPlayer
    local car = workspace.Vehicles:FindFirstChild(player.Name .. "Car")

    if car then
        local body = car:FindFirstChild("Body").VehicleSeat
        if body then
            body.TopSpeed.Value = speedValue
            body.Turbo.Value = turboValue
            wait(0.1)
            redzlib:MakeNotification({
                Name = "Mafia Hub",
                Content = "Done, You can Move Now!",
                Time = 5
            })
        else
            redzlib:MakeNotification({
                Name = "Error",
                Content = "Sit in car first!",
                Time = 5
            })
        end
    else
        redzlib:MakeNotification({
            Name = "Error",
            Content = "Put a Car First!",
            Time = 5
        })
    end
end

CarTab:AddTextBox({
    Name = "Speed",
    PlaceholderText = "50",
    Callback = function(value)
        local newSpeed = tonumber(value)
        if newSpeed then
            Speed = newSpeed
        end
    end
})

CarTab:AddTextBox({
    Name = "Turbo",
    PlaceholderText = "50",
    Callback = function(value)
        local newTurbo = tonumber(value)
        if newTurbo then
            Turbo = newTurbo
        end
    end
})

CarTab:AddTextBox({
    Name = "Drift",
    PlaceholderText = "50",
    Callback = function(value)
        local args = {
            [1] = "DriftingNumber",
            [2] = value
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
    end
})

CarTab:AddButton({
    Name = "Aplicar Velocidade, Turbo e drift",
    Callback = function()
        ChangeCarSpeedAndTurbo(Speed, Turbo)
    end
})


CarTab:AddParagraph({"Informação:", "Ambos os turbos não precisam de Gamepass"})

-- Music Section
local MusicSection = CarTab:AddSection({"Music for Cars, Houses"})

local musicIds = {
    "71373562243752", "138129019858244", "138480372357526", "122199933878670",
    "74187181906707", "82793916573031", "107421761958790", "91394092603440",
    "113198957973421", "81452315991527", "93786060174790", "74752089069476",
    "131592235762789", "132081774507495", "124394293950763", "83381647646350",
    "16190782181", "1841682637", "3148329638", "124928367733395",
    "106317184644394", "100247055114504", "107035638005233", "109351649716900",
    "84751398517083", "125259969174449", "89269071829332", "88094479399489",
    "72440232513341", "92893359226454", "111281710445018", "98677515506006",
    "105882833374061", "104541292443133", "105832154444494", "84733736048142",
    "94718473830640", "130324826943718", "123039027577735", "113312785512702",
    "139161205970637", "113768944849093", "135667903253566", "81335392002580",
    "77428091165211", "14145624031", "8080255618", "8654835474",
    "13530439502", "18841894272", "90323407842935", "136932193331774",
    "113504863495384", "1836175030", "79998949362539", "109188610023287",
    "134939857094956", "132245626038510", "124567809277408", "72591334498716",
    "76578817848504", "17422156627", "81902909302285", "130449561461006",
    "110519234838026", "106434295960535", "86271123924168", "85481949732828",
    "106476166672589", "87968531262747", "73966367524216", "137962454483542",
    "98371771055411", "111668097052966", "140095882383991", "122873874738223",
    "105461615542794"
}

local function playCarMusic(musicId)
    if musicId and musicId ~= "" then
        local carArgs = {
            [1] = "PickingCarMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(carArgs))
    end
end

local function playScooterMusic(musicId)
    if musicId and musicId ~= "" then
        local scooterArgs = {
            [1] = "PickingScooterMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(scooterArgs))
    end
end

local function playHouseMusic(musicId)
    if musicId and musicId ~= "" then
        local houseArgs = {
            [1] = "PickHouseMusicText",
            [2] = musicId
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(houseArgs))
    end
end

CarTab:AddTextBox({
    Name = "Music ID (Gamepass Required)",
    PlaceholderText = "Enter Music ID",
    Callback = function(value)
        playCarMusic(value)
        playScooterMusic(value)
        playHouseMusic(value)
    end
})

CarTab:AddDropdown({
    Name = "Select Music (Gamepass Required)",
    Options = musicIds,
    Callback = function(value)
        playCarMusic(value)
        playScooterMusic(value)
        playHouseMusic(value)
    end
})

CarTab:AddParagraph({"Note", "O script de música funciona em todos os carros e casas"})

-- Car RGB Section
local RGBSection = CarTab:AddSection({"Car RGB"})

CarTab:AddToggle({
    Name = "Car RGB",
    Default = false,
    Callback = function(state)
        isColorChanging = state
        if isColorChanging then
            colorChangeCoroutine = coroutine.create(changeCarColor)
            coroutine.resume(colorChangeCoroutine)
        end
    end
})

CarTab:AddParagraph({"Note", "Ativando isso deixará seu carro RGB"})

-- Spam Horn Section
local HornSection = CarTab:AddSection({"Spam Horn"})

local spamming = false
local args = {"Horn"}

local function spamHorn()
    while spamming do
        remoteEvent:FireServer(unpack(args))
        wait(0.1)
    end
end

CarTab:AddToggle({
    Name = "Spam Horn",
    Default = false,
    Callback = function(value)
        spamming = value
        if spamming then
            spawn(spamHorn)
        end
    end
})

-- Fly Car Section
local FlySection = CarTab:AddSection({"Fly Car"})

CarTab:AddButton({
    Name = "Fly Car",
    Callback = function()
        --by Luscaa
-- Version: 4.1

-- Instances:
local Flymguiv2 = Instance.new("ScreenGui")
local Drag = Instance.new("Frame")
local FlyFrame = Instance.new("Frame")
local ddnsfbfwewefe = Instance.new("TextButton")
local Speed = Instance.new("TextBox")
local Fly = Instance.new("TextButton")
local Speeed = Instance.new("TextLabel")
local Stat = Instance.new("TextLabel")
local Stat2 = Instance.new("TextLabel")
local Unfly = Instance.new("TextButton")
local Vfly = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Flyon = Instance.new("Frame")
local W = Instance.new("TextButton")
local S = Instance.new("TextButton")

--Properties:

Flymguiv2.Name = "Car Fly gui v2"
Flymguiv2.Parent = game.CoreGui
Flymguiv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Drag.Name = "Drag"
Drag.Parent = Flymguiv2
Drag.Active = true
Drag.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Drag.BorderSizePixel = 0
Drag.Draggable = true
Drag.Position = UDim2.new(0.482438415, 0, 0.454874992, 0)
Drag.Size = UDim2.new(0, 237, 0, 27)

FlyFrame.Name = "FlyFrame"
FlyFrame.Parent = Drag
FlyFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
FlyFrame.BorderSizePixel = 0
FlyFrame.Draggable = true
FlyFrame.Position = UDim2.new(-0.00200000009, 0, 0.989000022, 0)
FlyFrame.Size = UDim2.new(0, 237, 0, 139)

ddnsfbfwewefe.Name = "ddnsfbfwewefe"
ddnsfbfwewefe.Parent = FlyFrame
ddnsfbfwewefe.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
ddnsfbfwewefe.BorderSizePixel = 0
ddnsfbfwewefe.Position = UDim2.new(-0.000210968778, 0, -0.00395679474, 0)
ddnsfbfwewefe.Size = UDim2.new(0, 237, 0, 27)
ddnsfbfwewefe.Font = Enum.Font.SourceSans
ddnsfbfwewefe.Text = "by Lusquinha_067"
ddnsfbfwewefe.TextColor3 = Color3.fromRGB(255, 255, 255)
ddnsfbfwewefe.TextScaled = true
ddnsfbfwewefe.TextSize = 14.000
ddnsfbfwewefe.TextWrapped = true

Speed.Name = "Speed"
Speed.Parent = FlyFrame
Speed.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
Speed.BorderColor3 = Color3.fromRGB(0, 0, 191)
Speed.BorderSizePixel = 0
Speed.Position = UDim2.new(0.445025861, 0, 0.402877688, 0)
Speed.Size = UDim2.new(0, 111, 0, 33)
Speed.Font = Enum.Font.SourceSans
Speed.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Speed.Text = "50"
Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed.TextScaled = true
Speed.TextSize = 14.000
Speed.TextWrapped = true

Fly.Name = "Fly"
Fly.Parent = FlyFrame
Fly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Fly.BorderSizePixel = 0
Fly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
Fly.Size = UDim2.new(0, 199, 0, 32)
Fly.Font = Enum.Font.SourceSans
Fly.Text = "Enable"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextScaled = true
Fly.TextSize = 14.000
Fly.TextWrapped = true
Fly.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	Fly.Visible = false
	Stat2.Text = "On"
	Stat2.TextColor3 = Color3.fromRGB(0, 255, 0)
	Unfly.Visible = true
	Flyon.Visible = true
	local BV = Instance.new("BodyVelocity",HumanoidRP)
	local BG = Instance.new("BodyGyro",HumanoidRP)
	BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	game:GetService('RunService').RenderStepped:connect(function()
	BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
	BG.D = 5000
	BG.P = 100000
	BG.CFrame = game.Workspace.CurrentCamera.CFrame
	end)
end)

Speeed.Name = "Speeed"
Speeed.Parent = FlyFrame
Speeed.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Speeed.BorderSizePixel = 0
Speeed.Position = UDim2.new(0.0759493634, 0, 0.402877688, 0)
Speeed.Size = UDim2.new(0, 87, 0, 32)
Speeed.ZIndex = 0
Speeed.Font = Enum.Font.SourceSans
Speeed.Text = "Speed:"
Speeed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speeed.TextScaled = true
Speeed.TextSize = 14.000
Speeed.TextWrapped = true

Stat.Name = "Stat"
Stat.Parent = FlyFrame
Stat.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Stat.BorderSizePixel = 0
Stat.Position = UDim2.new(0.299983799, 0, 0.239817441, 0)
Stat.Size = UDim2.new(0, 85, 0, 15)
Stat.Font = Enum.Font.SourceSans
Stat.Text = "Status:"
Stat.TextColor3 = Color3.fromRGB(255, 255, 255)
Stat.TextScaled = true
Stat.TextSize = 14.000
Stat.TextWrapped = true

Stat2.Name = "Stat2"
Stat2.Parent = FlyFrame
Stat2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Stat2.BorderSizePixel = 0
Stat2.Position = UDim2.new(0.546535194, 0, 0.239817441, 0)
Stat2.Size = UDim2.new(0, 27, 0, 15)
Stat2.Font = Enum.Font.SourceSans
Stat2.Text = "Off"
Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
Stat2.TextScaled = true
Stat2.TextSize = 14.000
Stat2.TextWrapped = true

Unfly.Name = "Unfly"
Unfly.Parent = FlyFrame
Unfly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Unfly.BorderSizePixel = 0
Unfly.Position = UDim2.new(0.0759493634, 0, 0.705797076, 0)
Unfly.Size = UDim2.new(0, 199, 0, 32)
Unfly.Visible = false
Unfly.Font = Enum.Font.SourceSans
Unfly.Text = "Disable"
Unfly.TextColor3 = Color3.fromRGB(255, 255, 255)
Unfly.TextScaled = true
Unfly.TextSize = 14.000
Unfly.TextWrapped = true
Unfly.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	Fly.Visible = true
	Stat2.Text = "Off"
	Stat2.TextColor3 = Color3.fromRGB(255, 0, 0)
	wait()
	Unfly.Visible = false
	Flyon.Visible = false
	HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
	HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
end)

Vfly.Name = "Vfly"
Vfly.Parent = Drag
Vfly.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Vfly.BorderSizePixel = 0
Vfly.Size = UDim2.new(0, 57, 0, 27)
Vfly.Font = Enum.Font.SourceSans
Vfly.Text = "Car fly"
Vfly.TextColor3 = Color3.fromRGB(255, 255, 255)
Vfly.TextScaled = true
Vfly.TextSize = 14.000
Vfly.TextWrapped = true

Close.Name = "Close"
Close.Parent = Drag
Close.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.875, 0, 0, 0)
Close.Size = UDim2.new(0, 27, 0, 27)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
	Flymguiv2:Destroy()
end)

Minimize.Name = "Minimize"
Minimize.Parent = Drag
Minimize.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.75, 0, 0, 0)
Minimize.Size = UDim2.new(0, 27, 0, 27)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextScaled = true
Minimize.TextSize = 14.000
Minimize.TextWrapped = true
function Mini()
	if Minimize.Text == "-" then
		Minimize.Text = "+"
		FlyFrame.Visible = false
	elseif Minimize.Text == "+" then
		Minimize.Text = "-"
		FlyFrame.Visible = true
	end
end
Minimize.MouseButton1Click:Connect(Mini)

Flyon.Name = "Fly on"
Flyon.Parent = Flymguiv2
Flyon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Flyon.BorderSizePixel = 0
Flyon.Position = UDim2.new(0.117647067, 0, 0.550284624, 0)
Flyon.Size = UDim2.new(0.148000002, 0, 0.314999998, 0)
Flyon.Visible = false
Flyon.Active = true
Flyon.Draggable = true

W.Name = "W"
W.Parent = Flyon
W.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
W.BorderSizePixel = 0
W.Position = UDim2.new(0.134719521, 0, 0.0152013302, 0)
W.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
W.Font = Enum.Font.SourceSans
W.Text = "^"
W.TextColor3 = Color3.fromRGB(255, 255, 255)
W.TextScaled = true
W.TextSize = 14.000
W.TextWrapped = true
W.TouchLongPress:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

W.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

S.Name = "S"
S.Parent = Flyon
S.BackgroundColor3 = Color3.fromRGB(0, 150, 191)
S.BorderSizePixel = 0
S.Position = UDim2.new(0.134000003, 0, 0.479999989, 0)
S.Rotation = 180.000
S.Size = UDim2.new(0.708999991, 0, 0.499000013, 0)
S.Font = Enum.Font.SourceSans
S.Text = "^"
S.TextColor3 = Color3.fromRGB(255, 255, 255)
S.TextScaled = true
S.TextSize = 14.000
S.TextWrapped = true
S.TouchLongPress:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)

S.MouseButton1Click:Connect(function()
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed.Text
	wait(.1)
	HumanoidRP.BodyVelocity.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 0
end)
    end
})

CarTab:AddParagraph({"Note", "Ativando isso você pode voar com o seu carro"})

-- Spam Cars Section
local SpamCarSection = CarTab:AddSection({"Spam Car"})

local carList = {
    "SchoolBus", "SmartCar", "FarmTruck", "Cadillac", "Excavator",
    "Jeep", "NascarTruck", "TowTruck", "Snowplow", "MilitaryTruck",
    "Tank", "Limo", "FireTruck"
}

local spamCarsActive = false

local function spawnCar(carName)
    local args = {
        [1] = "PickingCar",
        [2] = carName
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end

CarTab:AddToggle({
    Name = "Spam Cars",
    Default = false,
    Callback = function(state)
        spamCarsActive = state
        if spamCarsActive then
            task.spawn(function()
                while spamCarsActive do
                    for _, carName in ipairs(carList) do
                        if not spamCarsActive then break end
                        spawnCar(carName)
                        wait(0.4)
                    end
                end
            end)
        end
    end
})

CarTab:AddParagraph({"Informação:", "Spamar vários carros"})



-- Variáveis globais
local pl = game.Players.LocalPlayer
local players = {}

-- Função para atualizar a lista de players
local function updatePlayerList()
    players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

-- Inicializa a lista de players
updatePlayerList()


local Tab6 = Window:MakeTab({"| rgb", "brush"})

---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 6: RGB === --
---------------------------------------------------------------------------------------------------------------------------------

local Section = Tab6:AddSection({"Funções RGB"})

-- Velocidade controlada pelo slider (quanto maior, mais rápido)
local rgbSpeed = 1

Tab6:AddSlider({
    Name = "Velocidade RGB",
    Description = "Aumenta a velocidade do efeito RGB",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 3,
    Callback = function(Value)
        rgbSpeed = Value
    end
})

-- Função para criar cor RGB suave com HSV
local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5 -- gira o hue suavemente de 0 a 1
    return Color3.fromHSV(h, 1, 1)
end

-- Função para disparar eventos
local function fireServer(eventName, args)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

local Section = Tab6:AddSection({"RGB para usar em você"})

-- Nome + Bio RGB  juntos
local nameBioRGBActive = false
Tab6:AddToggle({
    Name = "Nome + Bio RGB ",
    Default = false,
    Callback = function(state)
        nameBioRGBActive = state
        if state then
            task.spawn(function()
                while nameBioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPNameColor", color })
                    fireServer("1RPNam1eColo1r", { "PickingRPBioColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})

local ToggleCorpo = Tab6:AddToggle({
    Name = "RGB Corpo",
    Description = "RGB  no corpo",
    Default = false
})
ToggleCorpo:Callback(function(Value)
    getgenv().rgbCorpo = Value
    task.spawn(function()
        while getgenv().rgbCorpo do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if remote and remote:FindFirstChild("ChangeBodyColor") then
                pcall(function()
                    remote.ChangeBodyColor:FireServer({
                        BrickColor.new(getRainbowColor(rgbSpeed))
                    })
                end)
            end
            task.wait(0.1)
        end
    end)
end)

local ToggleCabelo = Tab6:AddToggle({
    Name = "RGB Cabelo",
    Description = "RGB  no cabelo",
    Default = false
})
ToggleCabelo:Callback(function(Value)
    getgenv().rgbCabelo = Value
    task.spawn(function()
        while getgenv().rgbCabelo do
            fireServer("1Max1y", {
                "ChangeHairColor2",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.5)
        end
    end)
end)

local Section = Tab6:AddSection({"veiculos e casa"})

local ToggleCasa = Tab6:AddToggle({
    Name = "RGB Casa",
    Description = "RGB  na casa",
    Default = false
})
ToggleCasa:Callback(function(Value)
    getgenv().rgbCasa = Value
    task.spawn(function()
        while getgenv().rgbCasa do
            fireServer("1Player1sHous1e", {
                "ColorPickHouse",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)

-- Carro RGB 
local carRGBActive = false
Tab6:AddToggle({
    Name = "Carro RGB  (Premium)",
    Description = "Altera a cor do carro com RGB contínuo. Pode causar kick se não for premium!",
    Default = false,
    Callback = function(state)
        carRGBActive = state
        if state then
            task.spawn(function()
                while carRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1Player1sCa1r", { "PickingCarColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})

local ToggleBicicleta = Tab6:AddToggle({
    Name = "RGB Bicicleta",
    Description = "RGB na bicicleta",
    Default = false
})
ToggleBicicleta:Callback(function(Value)
    getgenv().rgbBicicleta = Value
    task.spawn(function()
        while getgenv().rgbBicicleta do
            fireServer("1Player1sCa1r", {
                "NoMotorColor",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)

local Section = Tab6:AddSection({"itens/tool"})

-- NOVO TOGGLE: Rádio RGB
local radioRGBActive = false
Tab6:AddToggle({
    Name = "Rádio RGB  ",
    Description = "Altera a cor do rádio com RGB contínuo",
    Default = false,
    Callback = function(state)
        radioRGBActive = state
        if state then
            task.spawn(function()
                while radioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    local success, remote = pcall(function()
                        return LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")
                    end)
                    if success and remote then
                        pcall(function()
                            remote:FireServer(color)
                        end)
                    end
                    task.wait(0.03)
                end
            end)
        end
    end
})

local ToggleMegafone = Tab6:AddToggle({
    Name = "RGB Megafone",
    Description = "RGB  no megafone",
    Default = false
})
ToggleMegafone:Callback(function(Value)
    getgenv().rgbMegafone = Value
    task.spawn(function()
        while getgenv().rgbMegafone do
            local color = getRainbowColor(rgbSpeed)
            local gui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            if gui then
                local btn = gui:FindFirstChild("ToolGui")
                if btn then
                    local settings = btn:FindFirstChild("ToolSettings")
                    if settings then
                        local props = settings:FindFirstChild("Settings"):FindFirstChild("PropsColor")
                        if props and props:FindFirstChild("SetColor") then
                            pcall(function()
                                props.SetColor:FireServer(color)
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)

local ToggleRosquinha = Tab6:AddToggle({
    Name = "RGB Rosquinha",
    Description = "RGB  na rosquinha",
    Default = false
})
ToggleRosquinha:Callback(function(Value)
    getgenv().rgbRosquinha = Value
    task.spawn(function()
        while getgenv().rgbRosquinha do
            local color = getRainbowColor(rgbSpeed)
            local gui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            if gui then
                local btn = gui:FindFirstChild("ToolGui")
                if btn then
                    local settings = btn:FindFirstChild("ToolSettings")
                    if settings then
                        local props = settings:FindFirstChild("Settings"):FindFirstChild("PropsColor")
                        if props and props:FindFirstChild("SetColor") then
                            pcall(function()
                                props.SetColor:FireServer(color)
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)

local Tab9 = Window:MakeTab({"| troll", "skull"})

---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 9: troll === --
-----------------------------------------------------------------------------------------------------------------------------------
local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local selectedPlayer = nil
local isFollowingKill = false
local isFollowingPull = false
local running = false
local connection = nil
local flingConnection = nil
local originalPosition = nil
local savedPosition = nil
local originalProperties = {}
local selectedKillPullMethod = nil
local selectedFlingMethod = nil
local soccerBall = nil
local couch = nil
local isSpectating = false
local spectatedPlayer = nil
local characterConnection = nil
local flingToggle = nil

local SetNetworkOwnerEvent = Instance.new("RemoteEvent")
SetNetworkOwnerEvent.Name = "SetNetworkOwnerEvent_" .. tostring(math.random(1000, 9999))
SetNetworkOwnerEvent.Parent = ReplicatedStorage

local serverScriptCode = [[
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:WaitForChild("]] .. SetNetworkOwnerEvent.Name .. [[")
    
    event.OnServerEvent:Connect(function(player, part, networkOwner)
        if part and part:IsA("BasePart") then
            pcall(function()
                part:SetNetworkOwner(networkOwner)
                part.Anchored = false
                part.CanCollide = true
                part.CanTouch = true
            end)
        end
    end)
]]

pcall(function()
    loadstring(serverScriptCode)()
end)

local function disableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = true
    end
end

local function enableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = false
    end
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local function updateDropdown(dropdown, spectateToggle)
    pcall(function()
        local currentValue = dropdown:Get()
        local playerNames = getPlayerNames()
        dropdown:Set(playerNames) -- Usando :Set como solicitado
        if currentValue and not table.find(playerNames, currentValue) then
            dropdown:Set("")
            selectedPlayer = nil
            if isSpectating then
                stopSpectating()
                if spectateToggle then
                    pcall(function() spectateToggle:Set(false) end)
                end
            end
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() connection = nil end
                if flingConnection then flingConnection:Disconnect() flingConnection = nil end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
        elseif currentValue and table.find(playerNames, currentValue) then
            dropdown:Set(currentValue) -- Mantém seleção se jogador ainda está no jogo
        end
    end)
end





local function spectatePlayer(playerName)
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer ~= LocalPlayer then
        spectatedPlayer = targetPlayer
        isSpectating = true

        local function updateCamera()
            if not isSpectating or not spectatedPlayer then return end
            if spectatedPlayer.Character and spectatedPlayer.Character:FindFirstChild("Humanoid") then
                Workspace.CurrentCamera.CameraSubject = spectatedPlayer.Character.Humanoid
            else
                Workspace.CurrentCamera.CameraSubject = nil
            end
        end

        updateCamera()




        characterConnection = RunService.Heartbeat:Connect(function()
            if not isSpectating then
                characterConnection:Disconnect()
                characterConnection = nil
                return
            end
            pcall(updateCamera)
        end)

        spectatedPlayer.CharacterAdded:Connect(function()
            if isSpectating then updateCamera() end
        end)
    else
        isSpectating = false
        spectatedPlayer = nil
    end
end

local function stopSpectating()
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    isSpectating = false
    spectatedPlayer = nil

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    else
        Workspace.CurrentCamera.CameraSubject = nil
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end

-- Função para teletransportar para o jogador selecionado (com ancoragem segura)
local function teleportToPlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if not myHRP or not myHumanoid then
            print("Seu personagem não está totalmente carregado para teletransporte.")
            return
        end

        -- Zerar a física do personagem antes do teleporte
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
                part.Anchored = true -- Ancorar temporariamente para evitar movimento
            end
        end

        -- Teleportar para a posição do jogador-alvo
        local success, errorMessage = pcall(function()
            myHRP.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)) -- Leve elevação para evitar colisão com o chão
        end)
        if not success then
            warn("Erro ao teletransportar: " .. tostring(errorMessage))
            return
        end

        -- Garantir que o Humanoid saia do estado sentado ou voando
        myHumanoid.Sit = false
        myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        -- Aguardar 0,5 segundos com o personagem ancorado
        task.wait(0.5)

        -- Desancorar todas as partes do personagem e restaurar física
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end

        print("Teletransportado para o jogador: " .. playerName .. " com ancoragem segura.")
    else
        print("Jogador ou personagem não encontrado para teletransporte.")
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if isSpectating then
        stopSpectating()
        pcall(function() SpectateToggleTab10:Set(false) end)
    end
end)

local valor_do_nome_do_joagdor

local DropdownPlayerTab2 = Tab9:AddDropdown({
    Name = "Selecionar Jogador",
    Description = "Escolha um jogador para matar, puxar, visualizar ou aplicar fling",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player list",
    Callback = function(selectedPlayerName)
        valor_do_nome_do_joagdor = selectedPlayerName
        if selectedPlayerName == "" or selectedPlayerName == nil then
            selectedPlayer = nil
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() end
                if flingConnection then flingConnection:Disconnect() end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
            if isSpectating then stopSpectating() end
        else
            selectedPlayer = Players:FindFirstChild(selectedPlayerName)
            if isSpectating then
                stopSpectating()
                spectatePlayer(selectedPlayerName)
            end
        end
    end
})

function UptadePlayers()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    DropdownPlayerTab2:Set(playerNames)
end

Tab9:AddButton({"Atualizar lista", function()
    UptadePlayers()
end})

UptadePlayers()


Tab9:AddButton({
    Title = "Teleportar para Jogador",
    Desc = "Clique para teletransportar para o jogador selecionado",
    Callback = function()
        local selectedPlayerName = valor_do_nome_do_joagdor
        if selectedPlayerName and selectedPlayerName ~= "" then
            local success, errorMessage = pcall(teleportToPlayer, selectedPlayerName)
            if not success then
                warn("Erro ao teletransportar: " .. tostring(errorMessage))
            end
        else
            print("Selecione um jogador antes de teletransportar.")
        end
    end
})

local SpectateToggleTab10 = Tab9:AddToggle({
    Name = "Visualizar Jogador",
    Description = "Ativa/desativa a visualização do jogador selecionado",
    Default = false,
    Callback = function(state)
        if state then
            if selectedPlayer then
                pcall(spectatePlayer, selectedPlayer.Name)
            else
                SpectateToggleTab10:Set(false)
            end
        else
            pcall(stopSpectating)
        end
    end
})

-- Remoção automática de jogadores que saem
Players.PlayerRemoving:Connect(function(player)
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
    if selectedPlayer == player then
        selectedPlayer = nil
        if isSpectating then stopSpectating() end
        if running then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            if flingToggle then flingToggle:Set(false) end
        end
        SpectateToggleTab10:Set(false)
        DropdownPlayerTab2:Set("")
    end
end)

-- Atualização automática quando um novo jogador entra
Players.PlayerAdded:Connect(function()
    task.wait(1) -- pequeno delay para garantir que o jogador esteja pronto
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
end)

-- Inicializa o dropdown
updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)


local Section = Tab9:AddSection({"Kill"})

local DropdownKillPullMethod = Tab9:AddDropdown({
    Name = "Selecionar Método (Matar/Puxar)",
    Description = "Escolha o método para matar ou puxar",
    Options = {"Sofá", "Ônibus"},
    Callback = function(value)
        selectedKillPullMethod = value
    end
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com sofa--
------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function equipSofa()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local sofa = backpack:FindFirstChild("Couch") or LocalPlayer.Character:FindFirstChild("Couch")
    if not sofa then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            sofa = backpack:FindFirstChild("Couch")
            task.wait()
        until sofa or task.wait(5)
        if not sofa then return false end
    end
    if sofa.Parent ~= LocalPlayer.Character then
        sofa.Parent = LocalPlayer.Character
    end
    return true
end

local function killWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingKill = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

local function pullWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingPull = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

----------------------------------------------------------------------------
                                                   --fling com onibus--
----------------------------------------------------------------------------


local function killWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local lastUpdate = tick()
    local updateInterval = 0.05
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
        local newTargetHRP = targetCharacter:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetCharacter:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then return end
        if not myHRP or not humanoid then running = false return end
        if tick() - lastUpdate < updateInterval then return end
        lastUpdate = tick()
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
        end
    end)
end

local followConnection
if followConnection then followConnection:Disconnect() end
followConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            local targetPosition = selectedPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
    end
end)

local sitCheckConnection
if sitCheckConnection then sitCheckConnection:Disconnect() end
sitCheckConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Humanoid") then
        pcall(function()
            if selectedPlayer.Character.Humanoid.Sit then
                if isFollowingKill then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
                        task.wait(0.5)
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "Couch")
                        task.wait(1)
                    end
                end
                isFollowingKill = false
                isFollowingPull = false
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and originalPosition then
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                    if myHRP then
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end
                    originalPosition = nil
                end
            end
        end)
    end
end)

Tab9:AddButton({
    Name = "Matar",
    Description = "Inicia o matar com o método selecionado",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod then return end
        if selectedKillPullMethod == "Sofá" then
            killWithSofa(selectedPlayer)
        elseif selectedKillPullMethod == "Ônibus" then
            killWithBus(selectedPlayer)
        end
    end
})

Tab9:AddButton({
    Name = "Puxar",
    Description = "Inicia o puxar com o método selecionado",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod or selectedKillPullMethod ~= "Sofá" then return end
        pullWithSofa(selectedPlayer)
    end
})

Tab9:AddButton({
    Name = "Parar (Matar ou Puxar)",
    Description = "Para o movimento de matar ou puxar",
    Callback = function()
        isFollowingKill = false
        isFollowingPull = false
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
        for _, seat in ipairs(Workspace:GetDescendants()) do
            if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
        end
        if originalPosition then
            local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end
            originalPosition = nil
        end

        disableCarClient()

        local args = { [1] = "DeleteAllVehicles" }
        pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
        end)
    end
})

local Section = Tab9:AddSection({"Flings"})

local DropdownFlingMethod = Tab9:AddDropdown({
    Name = "Selecionar Método de Fling",
    Description = "Escolha o método para aplicar fling",
    Options = {"Sofá", "Ônibus", "Bola", "Bola V2", "Barco", "Caminhão"},
    Callback = function(value)
        selectedFlingMethod = value
    end
})

----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com sofa--
----------------------------------------------------------------------------------------------------------------------------------------------------------

local function flingWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then
        return
    end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then
        return
    end
    savedPosition = myHRP.Position
    if not equipSofa() then return end
    task.wait(0.5)
    couch = character:FindFirstChild("Couch")
    if not couch then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if (obj.Name == "Couch" or obj.Name == "Couch" .. LocalPlayer.Name) and (obj:IsA("BasePart") or obj:IsA("Tool")) then
                couch = obj
                break
            end
        end
    end
    if not couch then
        return
    end
    if couch:IsA("BasePart") then
        originalProperties = {
            Anchored = couch.Anchored,
            CanCollide = couch.CanCollide,
            CanTouch = couch.CanTouch
        }
        couch.Anchored = false
        couch.CanCollide = true
        couch.CanTouch = true
        pcall(function() couch:SetNetworkOwner(nil) end)
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
    local startTime = tick()
    local walkFlingInstance = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then
            running = false
            return
        end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then
            running = false
            return
        end
        if not myHRP or not humanoid then
            running = false
            return
        end
        pcall(function()
            local targetPosition = newTargetHRP.Position
            character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        if newTargetHumanoid.Sit or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    pcall(function() part:SetNetworkOwner(nil) end)
                end
            end
            walkFlingInstance = Instance.new("BodyVelocity")
            walkFlingInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstance.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstance.Parent = myHRP
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16))
                myHRP.Anchored = false
            end)
            local spinStart = tick()
            local spinConnection
            spinConnection = RunService.Heartbeat:Connect(function()
                if tick() - spinStart >= 0.5 then
                    spinConnection:Disconnect()
                    return
                end
                pcall(function()
                    character:SetPrimaryPartCFrame(
                        myHRP.CFrame * CFrame.Angles(
                            math.rad(Workspace.DistributedGameTime * 12000),
                            math.rad(Workspace.DistributedGameTime * 15000),
                            math.rad(Workspace.DistributedGameTime * 18000)
                        )
                    )
                end)
            end)
            task.wait(0.5)
            local args = { [1] = "PlayerWantsToDeleteTool", [2] = "Couch" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
            end)
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end)
            if walkFlingInstance then
                walkFlingInstance:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            if flingToggle then
                flingToggle:SetValue(false)
            end
        end
    end)
end

---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com bola--
---------------------------------------------------------------------------------------------------------------------------------------------------------

local function equipBola()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local bola = backpack:FindFirstChild("SoccerBall") or LocalPlayer.Character:FindFirstChild("SoccerBall")
    if not bola then
        local args = { [1] = "PickingTools", [2] = "SoccerBall" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            bola = backpack:FindFirstChild("SoccerBall")
            task.wait()
        until bola or task.wait(5)
        if not bola then return false end
    end
    if bola.Parent ~= LocalPlayer.Character then
        bola.Parent = LocalPlayer.Character
    end
    return true
end

local function flingWithBall(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid.Sit = false
    end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = true end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeDown", 4)
    end)
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp or not hum or not myHRP then return end
        local moveDir = hum.MoveDirection
        local isStill = moveDir.Magnitude < 0.1
        local isSitting = hum.Sit
        if isSitting then
            local y = math.sin(tick() * 50) * 2
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75 + y, 0))
        elseif isStill then
            local z = math.sin(tick() * 50) * 3
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75, z))
        else
            local offset = moveDir.Unit * math.clamp(hrp.Velocity.Magnitude * 0.15, 5, 12)
            soccerBall.CFrame = CFrame.new(hrp.Position + offset + Vector3.new(0, 0.75, 0))
        end
        myHRP.CFrame = CFrame.new(soccerBall.Position + Vector3.new(0, 1, 0))
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                  --fling bola v2--
------------------------------------------------------------------------------------------------------------------------------------------------------------


local function flingWithBallV2(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        local speed = hrp.Velocity.Magnitude
        local isMoving = hum.MoveDirection.Magnitude > 0.05
        local isJumping = hum:GetState() == Enum.HumanoidStateType.Jumping
        local offset
        if isMoving or isJumping then
            local extra = math.clamp(speed / 1.5, 6, 15)
            offset = hrp.CFrame.LookVector * extra + Vector3.new(0, 1, 0)
        else
            local wave = math.sin(tick() * 25) * 4
            local side = math.cos(tick() * 20) * 1.5
            offset = Vector3.new(side, 1, wave)
        end
        pcall(function()
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
        end)
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com ônibus--
-----------------------------------------------------------------------------------------------------------------------------------------------------


local function flingWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    local walkFlingInstancePlayer = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)

            walkFlingInstancePlayer = Instance.new("BodyVelocity")
            walkFlingInstancePlayer.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstancePlayer.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstancePlayer.Parent = myHRP
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if walkFlingInstancePlayer then
                walkFlingInstancePlayer:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com barco--
-----------------------------------------------------------------------------------------------------------------------------------------------------------

local function flingWithBoat(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3359.52, -5.05, -501.94))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.4)
    args = { [1] = "PickingBoat", [2] = "MilitaryBoatFree" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1.5)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local boatName = LocalPlayer.Name .. "Car"
    local boat = vehiclesFolder:FindFirstChild(boatName)
    if not boat then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3358.85, 5.25, -521.95))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(boat:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            boat:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(boat:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                boat:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------
                                      --fling com caminhão--
------------------------------------------------------------------------------------------------------------------------------------------------


local function flingWithTruck(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position

    -- Teletransporta para a posição inicial do ônibus para invocar o caminhão
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    -- Desativa o cliente de carro para evitar interferências
    disableCarClient()

    -- Deleta qualquer veículo existente
    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)

    -- Invoca o caminhão (Semi) usando o comando fornecido
    args = { [1] = "PickingCar", [2] = "Semi" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)

    -- Encontra o caminhão invocado
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local truckName = LocalPlayer.Name .. "Car"
    local truck = vehiclesFolder:FindFirstChild(truckName)
    if not truck then return end

    -- Teletransporta para a posição do assento do caminhão
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1176.56, 79.90, -1166.65))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)

    -- Espera o jogador sentar no caminhão
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit

    -- Desativa a colisão das partes do caminhão e define a posse de rede
    for _, part in ipairs(truck:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end

    -- Inicia o processo de fling
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)

    local startTime = tick()
    local lastFlingTime = 0
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end

        -- Encontra a parte Trailer para o fling
        local trailer = truck:FindFirstChild("Body") and truck.Body:FindFirstChild("Trailer")
        if not trailer then return end

        -- Faz o trailer se mover para cima e para baixo muito rapidamente
        local verticalOffset = math.sin(tick() * 30) * 5 -- Oscila entre -5 e 5 unidades na vertical, ainda mais rápido
        pcall(function()
            local targetPosition = newTargetHRP.Position + Vector3.new(0, verticalOffset, 0)
            trailer:PivotTo(CFrame.new(targetPosition)) -- Apenas movimento vertical, sem rotação
        end)

        -- Verifica a distância entre o trailer e o jogador-alvo para aplicar o fling
        local dist = (trailer.Position - newTargetHRP.Position).Magnitude
        if dist < 5 and tick() - lastFlingTime > 0.4 then -- Aplica o fling se o jogador estiver a menos de 5 unidades
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            -- Aplica um fling extremamente forte
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-10, 10), 50, math.random(-10, 10)).Unit * 10000000 + Vector3.new(0, 5000000, 0)
            fling.Parent = newTargetHRP
            task.delay(0.5, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end

        -- Para o fling se o jogador-alvo estiver sentado ou após 10 segundos
        local playerSeated = false
        for _, seat in ipairs(truck:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end

        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end

            -- Teletransporta o caminhão para uma posição fora do mapa
            pcall(function()
                truck:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)
            task.wait(0.5)

            -- Limpeza: Deleta o caminhão e reseta o jogador
            disableCarClient()
            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)

            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end

            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end

            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)

            if flingToggle then flingToggle:Set(false) end
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------



local function stopFling()
    running = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if flingConnection then
        flingConnection:Disconnect()
        flingConnection = nil
    end
    if soccerBall then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    if couch and couch:IsA("BasePart") then
        couch.Anchored = originalProperties.Anchored
        couch.CanCollide = originalProperties.CanCollide
        couch.CanTouch = originalProperties.CanTouch
    end

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.2)
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
    end
    local myHumanoid = character and character:FindFirstChild("Humanoid")
    if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
    end)
    if savedPosition then
        local myHRP = character and character:FindFirstChild("HumanoidRootPart")
        if myHRP then
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
        end
    end
end

 
                
flingToggle = Tab9:AddToggle({
    Name = "Ativar Fling",
    Description = "Ativa ou desativa o fling com o método selecionado",
    Default = false,
    Callback = function(state)
        if state then
            if isFollowingKill or isFollowingPull or running then
                flingToggle:Set(false)
                return
            end
            if selectedFlingMethod == "Sofá" then
                flingWithSofa(selectedPlayer)
            elseif selectedFlingMethod == "Bola" then
                flingWithBall(selectedPlayer)
            elseif selectedFlingMethod == "Bola V2" then
                flingWithBallV2(selectedPlayer)
            elseif selectedFlingMethod == "Barco" then
                flingWithBoat(selectedPlayer)
            elseif selectedFlingMethod == "Caminhão" then
                flingWithTruck(selectedPlayer)
            elseif selectedFlingMethod == "Ônibus" then
                flingWithBus(selectedPlayer)
            end
        else
            stopFling()
        end
    end
})

local Section = Tab9:AddSection({" Fling all e desligue os RGB antes de usar"})

-- Variáveis globais no início do Tab2
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

orbitando = false
orbitConn = nil
allFling = false
allConn = nil
currentPlayerList = nil
currentPlayerIndex = nil
lastSwitchTime = nil
allFling2 = false
allConn2 = nil
soccerBall = nil
originalProperties = nil
excludedPlayers = {} -- Tabela para jogadores excluídos dos flings

-- Função auxiliar para obter a foto de perfil do jogador
local function getPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, result = pcall(function()
        return Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    end)
    if success then
        return result
    else
        warn("Erro ao obter thumbnail: " .. tostring(result))
        return nil
    end
end

-- Função auxiliar para encontrar jogador por parte do nome
local function findPlayerByPartialName(partialName)
    partialName = partialName:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(partialName) then
            return plr
        end
    end
    return nil
end

-- Função para exibir notificação
local function showNotification(title, description, icon)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = description,
            Icon = icon or "",
            Duration = 5
        })
    end)
end

-- TextBox para excluir jogador
Tab9:AddTextBox({
    Name = "adicionar jogador na whitelist",
    Description = "Digite parte do nome do jogador",
    PlaceholderText = "Kaelix",
    Callback = function(Value)
        if Value == "" then
            showNotification("Nenhuma Ação", "Digite um nome para adicionar um jogador.", nil)
            return
        end

        local player = findPlayerByPartialName(Value)
        if player then
            -- Verifica se o jogador já está excluído
            for _, excluded in ipairs(excludedPlayers) do
                if excluded == player then
                    showNotification("Jogador Já esta na whitelist", "Jogador " .. player.Name .. " já foi adicionado.", getPlayerThumbnail(player.UserId))
                    return
                end
            end
            table.insert(excludedPlayers, player)
            local thumbnail = getPlayerThumbnail(player.UserId)
            showNotification("Jogador adicionado", "Jogador " .. player.Name .. " foi removido dos flings.", thumbnail)
        else
            showNotification("Jogador Não Encontrado", "Nenhum jogador encontrado com '" .. Value .. "'.", nil)
        end
    end
})

-- Botão para verificar jogadores excluídos
Tab9:AddButton({"Verificar Excluídos", function()
    if #excludedPlayers == 0 then
        showNotification("Nenhum na whitelist", "Nenhum jogador está removido dos flings.", nil)
        return
    end
    for i, player in ipairs(excludedPlayers) do
        local thumbnail = getPlayerThumbnail(player.UserId)
        showNotification("Jogador adicionado " .. i, "Jogador " .. player.Name .. " está removido dos flings.", thumbnail)
        task.wait(0.5) -- Pequeno atraso entre notificações para evitar sobreposição
    end
end})

-- Botão para remover todos os jogadores excluídos
Tab9:AddButton({"Remover Excluídos", function()
    if #excludedPlayers == 0 then
        showNotification("Nenhum removido", "Nenhum jogador para remover da whitelist.", nil)
        return
    end
    excludedPlayers = {}
    showNotification("whaitelists Removidas", "Todos os jogadores foram removidos da whitelist.", nil)
end})

-- Bola Fling Orbitando
Tab9:AddButton({"Bola Fling Orbitando", function()
    if orbitando then return end
    if not equipBola() then return end
    task.wait(0.5)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    orbitando = true
    orbitConn = RunService.Heartbeat:Connect(function()
        if not orbitando or not soccerBall or not soccerBall.Parent or not myHRP or not myHRP.Parent or not character or not character.Parent then
            if orbitConn then
                orbitConn:Disconnect()
                orbitConn = nil
            end
            orbitando = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local t = tick() * 10
        local radius = 3
        local offset = Vector3.new(math.cos(t) * radius, -1, math.sin(t) * radius)
        soccerBall.CFrame = CFrame.new(myHRP.Position + offset)
        soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
    end)
end})

-- Fling Bola ALL V1
Tab9:AddButton({"Fling Bola ALL V1", function()
    if allFling then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling = true

    local function getShuffledPlayers()
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        return playerList
    end

    allConn = RunService.Heartbeat:Connect(function()
        if not allFling or not soccerBall or not soccerBall.Parent then
            if allConn then
                allConn:Disconnect()
                allConn = nil
            end
            allFling = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            currentPlayerList = nil
            currentPlayerIndex = nil
            lastSwitchTime = nil
            return
        end

        if not currentPlayerList or #currentPlayerList == 0 then
            currentPlayerList = getShuffledPlayers()
            currentPlayerIndex = 1
            lastSwitchTime = tick()
        end

        if #currentPlayerList == 0 then
            return
        end

        if tick() - lastSwitchTime >= 4 then
            currentPlayerIndex = currentPlayerIndex + 1
            if currentPlayerIndex > #currentPlayerList then
                currentPlayerList = getShuffledPlayers()
                currentPlayerIndex = 1
            end
            lastSwitchTime = tick()
        end

        local target = currentPlayerList[currentPlayerIndex]
        if not target or not target.Character then
            return
        end

        local targetChar = target.Character
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
            local hrp = targetChar.HumanoidRootPart
            local humanoid = targetChar.Humanoid
            local velocity = hrp.Velocity
            local speed = velocity.Magnitude
            local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
            local isMoving = humanoid.MoveDirection.Magnitude > 0.05
            local offset
            if isMoving or isJumping then
                local moveDir = hrp.CFrame.LookVector
                local extraDist = math.clamp(speed / 1.5, 6, 18)
                offset = moveDir * extraDist + Vector3.new(0, 1, 0)
            else
                local waveZ = math.sin(tick() * 25) * 4
                local sideX = math.cos(tick() * 20) * 1.5
                offset = Vector3.new(sideX, 1, waveZ)
            end
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
            if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                local fling = Instance.new("BodyVelocity")
                fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
                fling.Parent = hrp
                task.delay(0.3, function()
                    fling:Destroy()
                end)
            end
        end
    end)
end})

-- Fling Bola ALL V2
Tab9:AddButton({"Fling Bola ALL V2", function()
    if allFling2 then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling2 = true
    allConn2 = RunService.Heartbeat:Connect(function()
        if not allFling2 or not soccerBall or not soccerBall.Parent then
            if allConn2 then
                allConn2:Disconnect()
                allConn2 = nil
            end
            allFling2 = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        for _, target in ipairs(playerList) do
            if not allFling2 then break end
            local targetChar = target.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
                local hrp = targetChar.HumanoidRootPart
                local humanoid = targetChar.Humanoid
                local velocity = hrp.Velocity
                local speed = velocity.Magnitude
                local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
                local isMoving = humanoid.MoveDirection.Magnitude > 0.05
                local offset
                if isMoving or isJumping then
                    local moveDir = hrp.CFrame.LookVector
                    local extraDist = math.clamp(speed / 1.5, 6, 18)
                    offset = moveDir * extraDist + Vector3.new(0, 1, 0)
                else
                    local waveZ = math.sin(tick() * 25) * 4
                    local sideX = math.cos(tick() * 20) * 1.5
                    offset = Vector3.new(sideX, 1, waveZ)
                end
                soccerBall.CFrame = CFrame.new(hrp.Position + offset)
                soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
                if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                    local fling = Instance.new("BodyVelocity")
                    fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
                    fling.Parent = hrp
                    task.delay(0.3, function()
                        fling:Destroy()
                    end)
                end
            end
            task.wait(0.1)
        end
    end)
end})

-- Parar Tudo
Tab9:AddButton({"Parar Tudo", function()
    -- Parar Orbitando
    orbitando = false
    if orbitConn then
        orbitConn:Disconnect()
        orbitConn = nil
    end
    -- Parar Fling ALL V1
    allFling = false
    if allConn then
        allConn:Disconnect()
        allConn = nil
    end
    currentPlayerList = nil
    currentPlayerIndex = nil
    lastSwitchTime = nil
    -- Parar Fling ALL V2
    allFling2 = false
    if allConn2 then
        allConn2:Disconnect()
        allConn2 = nil
    end
    -- Restaurar propriedades da bola
    if soccerBall and originalProperties then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    soccerBall = nil
    originalProperties = nil
    showNotification("Tudo Parado", "Todas as funções foram desativadas.", nil)
end})

local Tab = Window:MakeTab({"| teleportes", "tp"}) -- Nome do ícone: 'portal' em minúsculo para teleporte

-- Botões de Teleporte
local teleportButtons = {
    {"Aos Bastidores", CFrame.new(192, 4, 272)},
    {"Ao Centro Urbano", CFrame.new(136, 4, 117)},
    {"À Área do Crime", CFrame.new(-119, -28, 235)},
    {"À Casa Deserta", CFrame.new(986, 4, 63)},
    {"Ao Portal da Agência", CFrame.new(672, 4, -296)},
    {"Ao Esconderijo", CFrame.new(505, -75, 143)},
    {"À Escola", CFrame.new(-312, 4, 211)},
    {"Ao Café Brook", CFrame.new(161, 8, 52)},
    {"Ao Ponto Inicial", CFrame.new(-26, 4, -23)},
    {"Ao Arco Principal", CFrame.new(-589, 141, -59)},
    {"Ao Hospital", CFrame.new(-309, 4, 71)},
    {"À Base da Agência", CFrame.new(179, 4, -464)},
    {"À Sala Oculta da Oficina", CFrame.new(0, 4, -495)},
    {"À Sala Secreta 2", CFrame.new(-343, 4, -613)},
    {"À Ilha Isolada", CFrame.new(-1925, 23, 127)},
    {"À Praça dos Hotéis", CFrame.new(182, 4, 150)},
    {"Escalar Montanha 1", CFrame.new(-670, 251, 765)},
    {"Ao Banco Principal", CFrame.new(2.28, 4.65, 254.58)},
    {"À Loja de Roupas", CFrame.new(-46.15, 4.65, 253.20)},
    {"Ao Refúgio", CFrame.new(-88.48, 22.05, 262.34)},
    {"À Clínica Dentária", CFrame.new(-53.58, 22.15, 265.61)},
    {"À Cafeteria", CFrame.new(-97.12, 4.65, 254.99)}
}

for _, btn in ipairs(teleportButtons) do
    Tab:AddButton({
        btn[1],
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = btn[2]
        end
    })
end

local Tab11 = Window:MakeTab({"| scripts", "scroll"})

Tab11:AddButton({
    Name = "Techwear Emotes",
    Description = "Universal",
    Callback = function()
        --[[ 
    Source script taken from: https://github.com/Roblox/creator-docs/blob/main/content/en-us/characters/emotes.md


]]


if _G.EmotesGUIRunning then
    getgenv().Notify({
        Title = 'Techwear | Emote',
        Content = ' It works It actually works',
        Duration = 5
    })
    return
end
_G.EmotesGUIRunning = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/kaelixdev-hash/Menu-7yd7/refs/heads/Script/GUIS/Off-site/Notify.lua"))()
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kaelixdev-hash/Hub/Branch/GUIS/count-emote"))()
end)

getgenv().Notify({
    Title = 'Techwear | Emote',
    Content = '⚠️ Script loading...',
    Duration = 5
})

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local emoteClickConnections = {}
local isMonitoringClicks = false
local currentTimer = nil

local currentMode = "emote"
local animationsData = {}
local originalAnimationsData = {}
local filteredAnimations = {}
local favoriteAnimations = {}
local favoriteAnimationsFileName = "FavoriteAnimations.json"
local emoteSearchTerm = ""
local animationSearchTerm = ""

getgenv().lastPlayedAnimation = getgenv().lastPlayedAnimation or nil
getgenv().autoReloadEnabled = getgenv().autoReloadEnabled or false

local lastRadialActionTime = 0
local lastWheelVisibleTime = 0


RunService.Heartbeat:Connect(function()
    local success, menu = pcall(function() return CoreGui.RobloxGui.EmotesMenu.Children end)
    if not (success and menu) then return end
    
    pcall(function()
        if menu.Main.EmotesWheel.Visible then
            lastWheelVisibleTime = tick()
        end
    end)

    local errorMsg = menu:FindFirstChild("ErrorMessage")

    if errorMsg and errorMsg.Visible then
        if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
            errorMsg.ErrorText.Text = "Only r15 does not work r6"
        elseif tick() - lastRadialActionTime < 2 then
            errorMsg.Visible = false
        end
    end
end)


function ErrorMessage(text, duration)

    if currentTimer then
        task.cancel(currentTimer)
        currentTimer = nil
    end
    
    local errorMessage = CoreGui.RobloxGui.EmotesMenu.Children.ErrorMessage
    local errorText = errorMessage.ErrorText
    
    errorText.Text = text
    
    errorMessage.Visible = true
    
    currentTimer = task.delay(duration, function()
        errorMessage.Visible = false
        currentTimer = nil
    end)
end

local function stopEmotes()
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        track:Stop()
    end
end

local emotesData = {}
local currentPage = 1
local itemsPerPage = 8
local totalPages = 1
local filteredEmotes = {}
local isLoading = false
local originalEmotesData = {}
local totalEmotesLoaded = 0
local scannedEmotes = {}
local favoriteEmotes = {}
local favoriteEnabled = false
local favoriteFileName = "FavoriteEmotes.json"
local emotesWalkEnabled = false
local currentEmoteTrack = nil
local currentCharacter = nil
local isGUICreated = false
local speedEmoteEnabled = false
local speedEmoteConfigFile = "SpeedEmoteConfig.json"

local Under, UIListLayout, _1left, _9right, _4pages, _3TextLabel, _2Routenumber, Top, EmoteWalkButton, UICorner1,
    UIListLayout_2, UICorner, Search, Favorite, UICorner2, UICorner_2, SpeedEmote, UICorner_4, SpeedBox, UICorner_5, Changepage,
    Reload, UICorner_6

local defaultButtonImage = "rbxassetid://71408678974152"
local enabledButtonImage = "rbxassetid://106798555684020"

local favoriteIconId = "rbxassetid://97307461910825" 
local notFavoriteIconId = "rbxassetid://124025954365505"

local function getCharacterAndHumanoid()
    local character = player.Character
    if not character then
        return nil, nil
    end
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then
        return nil, nil
    end
    return character, humanoid
end

local function checkEmotesMenuExists()
    local coreGui = game:GetService("CoreGui")
    local robloxGui = coreGui:FindFirstChild("RobloxGui")
    if not robloxGui then
        return false
    end

    local emotesMenu = robloxGui:FindFirstChild("EmotesMenu")
    if not emotesMenu then
        return false
    end

    local children = emotesMenu:FindFirstChild("Children")
    if not children then
        return false
    end

    local main = children:FindFirstChild("Main")
    if not main then
        return false
    end

    local emotesWheel = main:FindFirstChild("EmotesWheel")
    if not emotesWheel then
        return false
    end

    return true, emotesWheel
end

local function getBackgroundOverlay()
    local success, result = pcall(function()
        return game:GetService("CoreGui").RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Back.Background
                   .BackgroundCircleOverlay
    end)
    if success then
        return result
    end
    return nil
end

local function updateGUIColors()
    local backgroundOverlay = getBackgroundOverlay()
    if not backgroundOverlay then
        return
    end

    local bgColor = backgroundOverlay.BackgroundColor3
    local bgTransparency = backgroundOverlay.BackgroundTransparency

    if _1left then
        _1left.ImageColor3 = bgColor
        _1left.ImageTransparency = bgTransparency
    end

    if _9right then
        _9right.ImageColor3 = bgColor
        _9right.ImageTransparency = bgTransparency
    end

    if _4pages then
        _4pages.TextColor3 = bgColor
        _4pages.TextTransparency = bgTransparency
    end

    if _3TextLabel then
        _3TextLabel.TextColor3 = bgColor
        _3TextLabel.TextTransparency = bgTransparency
    end

    if _2Routenumber then
        _2Routenumber.TextColor3 = bgColor
        _2Routenumber.TextTransparency = bgTransparency
    end

    if Top then
        Top.BackgroundColor3 = bgColor
        Top.BackgroundTransparency = bgTransparency
    end

    if EmoteWalkButton then
        EmoteWalkButton.BackgroundColor3 = bgColor
        EmoteWalkButton.BackgroundTransparency = bgTransparency
    end

    if SpeedEmote then
        SpeedEmote.BackgroundColor3 = bgColor
        SpeedEmote.BackgroundTransparency = bgTransparency
    end

     if Changepage then
        Changepage.BackgroundColor3 = bgColor
        Changepage.BackgroundTransparency = bgTransparency
    end

    if SpeedBox then
        SpeedBox.BackgroundColor3 = bgColor
        SpeedBox.BackgroundTransparency = bgTransparency
    end

    if Favorite then
        Favorite.BackgroundColor3 = bgColor
        Favorite.BackgroundTransparency = bgTransparency
    end

if Reload then
    Reload.BackgroundColor3 = bgColor
    Reload.BackgroundTransparency = bgTransparency
    Reload.Visible = (currentMode == "animation")
end
end

local function urlToId(animationId)
    animationId = string.gsub(animationId, "http://www%.roblox%.com/asset/%?id=", "")
    animationId = string.gsub(animationId, "rbxassetid://", "")
    return animationId
end

local function saveFavorites()
    if writefile then
        local jsonData = HttpService:JSONEncode(favoriteEmotes)
        writefile(favoriteFileName, jsonData)
    end
end

local function saveFavoritesAnimations()
    if writefile then
        local jsonData = HttpService:JSONEncode(favoriteAnimations)
        writefile(favoriteAnimationsFileName, jsonData)
    end
end

local function loadFavorites()
    if readfile and isfile and isfile(favoriteFileName) then
        local success, result = pcall(function()
            local fileContent = readfile(favoriteFileName)
            return HttpService:JSONDecode(fileContent)
        end)
        if success and result then
            favoriteEmotes = result
        end
    end
end

local function loadFavoritesAnimations()
    if readfile and isfile and isfile(favoriteAnimationsFileName) then
        local success, result = pcall(function()
            local fileContent = readfile(favoriteAnimationsFileName)
            return HttpService:JSONDecode(fileContent)
        end)
        if success and result then
            favoriteAnimations = result
        end
    end
end

local function loadSpeedEmoteConfig()
    if readfile and isfile and isfile(speedEmoteConfigFile) then
        local success, result = pcall(function()
            local fileContent = readfile(speedEmoteConfigFile)
            return HttpService:JSONDecode(fileContent)
        end)
        if success and result then
            speedEmoteEnabled = result.Enabled or false
            if SpeedBox then
                SpeedBox.Text = tostring(result.SpeedValue or 1)
                SpeedBox.Visible = speedEmoteEnabled
            end
        end
    end
end

local function extractAssetId(imageUrl)
    local assetId = string.match(imageUrl, "Asset&id=(%d+)")
    return assetId
end

local function getEmoteName(assetId)
    local success, productInfo = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(tonumber(assetId))
    end)
    
    if success and productInfo then
        return productInfo.Name
    else
        return "Emote_" .. tostring(assetId)
    end
end

local function isInFavorites(assetId)
    local favoriteList
    if currentMode == "animation" then
        favoriteList = favoriteAnimations
    else
        favoriteList = favoriteEmotes
    end

    for _, favorite in pairs(favoriteList) do
        if tostring(favorite.id) == tostring(assetId) then
            return true
        end
    end
    return false
end

local function updateAnimationImages(currentPageAnimations)
    local success, frontFrame = pcall(function()
        return game:GetService("CoreGui").RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Front.EmotesButtons
    end)
    
    if not success or not frontFrame then
        return
    end
    
    local buttonIndex = 1
    for _, child in pairs(frontFrame:GetChildren()) do
        if child:IsA("ImageLabel") then
            if buttonIndex <= #currentPageAnimations then
                local animationData = currentPageAnimations[buttonIndex]
                child.Image = "rbxthumb://type=BundleThumbnail&id=" .. animationData.id .. "&w=420&h=420"
                
                local idValue = child:FindFirstChild("AnimationID") or Instance.new("IntValue")
                idValue.Name = "AnimationID"
                idValue.Value = animationData.id
                idValue.Parent = child

                child.Active = not favoriteEnabled

                buttonIndex = buttonIndex + 1
            else
                child.Image = ""
                local idValue = child:FindFirstChild("AnimationID")
                if idValue then 
                    idValue:Destroy() 
                end
                child.Active = true
            end
        end
    end
    
    frontFrame.Active = not favoriteEnabled
end


local function updateFavoriteIcon(imageLabel, assetId, isFavorite)
    local favoriteIcon = imageLabel:FindFirstChild("FavoriteIcon")
    
    if not favoriteIcon then
        favoriteIcon = Instance.new("ImageLabel")
        favoriteIcon.Name = "FavoriteIcon"
        favoriteIcon.Size = UDim2.new(0.3, 0, 0.3, 0) 
        favoriteIcon.Position = UDim2.new(0.7, 0, 0, 0)
        favoriteIcon.AnchorPoint = Vector2.new(0, 0)
        favoriteIcon.BackgroundTransparency = 1
        favoriteIcon.ZIndex = imageLabel.ZIndex + 5
        favoriteIcon.ScaleType = Enum.ScaleType.Fit
        favoriteIcon.Parent = imageLabel
    end
    
    if isFavorite then
        favoriteIcon.Image = favoriteIconId
    else
        favoriteIcon.Image = notFavoriteIconId 
    end
end

local function updateAllFavoriteIcons()
    local success, frontFrame = pcall(function()
        return game:GetService("CoreGui").RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Front.EmotesButtons
    end)
    
    if success and frontFrame then
        for _, child in pairs(frontFrame:GetChildren()) do
            if child:IsA("ImageLabel") and child.Image ~= "" then
                local assetId
                if currentMode == "animation" then
                    local idValue = child:FindFirstChild("AnimationID")
                    if idValue then
                        assetId = idValue.Value
                    end
                else
                    assetId = extractAssetId(child.Image)
                end
                
                if assetId then
                    local isFavorite = isInFavorites(assetId)
                    updateFavoriteIcon(child, assetId, isFavorite)
                end
                child.Active = not favoriteEnabled
            end
        end
        frontFrame.Active = not favoriteEnabled
    end
end

local function updateAnimations()
    local character, humanoid = getCharacterAndHumanoid()
    if not character or not humanoid then
        return
    end

    local humanoidDescription = humanoid.HumanoidDescription
    if not humanoidDescription then
        return
    end

    local currentPageAnimations = {}
    local animationTable = {}
    local equippedAnimations = {}

    local favoritesToUse = _G.filteredFavoritesAnimationsForDisplay or favoriteAnimations
    local hasFavorites = #favoritesToUse > 0
    local favoritePagesCount = hasFavorites and math.ceil(#favoritesToUse / itemsPerPage) or 0
    local isInFavoritesPages = currentPage <= favoritePagesCount

    if isInFavoritesPages and hasFavorites then
        local startIndex = (currentPage - 1) * itemsPerPage + 1
        local endIndex = math.min(startIndex + itemsPerPage - 1, #favoritesToUse)

        for i = startIndex, endIndex do
            if favoritesToUse[i] then
                table.insert(currentPageAnimations, {
                    id = tonumber(favoritesToUse[i].id),
                    name = favoritesToUse[i].name
                })
            end
        end
    else
        local normalAnimations = {}
        for _, animation in pairs(filteredAnimations) do
            if not isInFavorites(animation.id) then
                table.insert(normalAnimations, animation)
            end
        end

        local adjustedPage = currentPage - favoritePagesCount
        local startIndex = (adjustedPage - 1) * itemsPerPage + 1
        local endIndex = math.min(startIndex + itemsPerPage - 1, #normalAnimations)

        for i = startIndex, endIndex do
            if normalAnimations[i] then
                table.insert(currentPageAnimations, normalAnimations[i])
            end
        end
    end

    for _, animation in pairs(currentPageAnimations) do
        local animationName = animation.name
        local animationId = animation.id
        animationTable[animationName] = {animationId}
        table.insert(equippedAnimations, animationName)
    end

    humanoidDescription:SetEmotes(animationTable)
    humanoidDescription:SetEquippedEmotes(equippedAnimations)
    
    task.wait(0.1)
    updateAnimationImages(currentPageAnimations)

    task.delay(0.2, function()
        if favoriteEnabled then
            updateAllFavoriteIcons()
        end
    end)
end

local function updateEmotes()
    local character, humanoid = getCharacterAndHumanoid()
    if not character or not humanoid then
        return
    end

    if currentMode == "animation" then
        updateAnimations()
        return
    end

    local humanoidDescription = humanoid.HumanoidDescription
    if not humanoidDescription then
        return
    end

    local currentPageEmotes = {}
    local emoteTable = {}
    local equippedEmotes = {}

    local favoritesToUse = _G.filteredFavoritesForDisplay or favoriteEmotes
    local hasFavorites = #favoritesToUse > 0
    local favoritePagesCount = hasFavorites and math.ceil(#favoritesToUse / itemsPerPage) or 0
    local isInFavoritesPages = currentPage <= favoritePagesCount

    if isInFavoritesPages and hasFavorites then
        local startIndex = (currentPage - 1) * itemsPerPage + 1
        local endIndex = math.min(startIndex + itemsPerPage - 1, #favoritesToUse)

        for i = startIndex, endIndex do
            if favoritesToUse[i] then
                table.insert(currentPageEmotes, {
                    id = tonumber(favoritesToUse[i].id),
                    name = favoritesToUse[i].name
                })
            end
        end
    else
        local normalEmotes = {}
        for _, emote in pairs(filteredEmotes) do
            if not isInFavorites(emote.id) then
                table.insert(normalEmotes, emote)
            end
        end

        local adjustedPage = currentPage - favoritePagesCount
        local startIndex = (adjustedPage - 1) * itemsPerPage + 1
        local endIndex = math.min(startIndex + itemsPerPage - 1, #normalEmotes)

        for i = startIndex, endIndex do
            if normalEmotes[i] then
                table.insert(currentPageEmotes, normalEmotes[i])
            end
        end
    end

    for _, emote in pairs(currentPageEmotes) do
        local emoteName = emote.name
        local emoteId = emote.id
        emoteTable[emoteName] = {emoteId}
        table.insert(equippedEmotes, emoteName)
    end

    humanoidDescription:SetEmotes(emoteTable)
    humanoidDescription:SetEquippedEmotes(equippedEmotes)
    
    task.delay(0.2, function()
        if favoriteEnabled then
            updateAllFavoriteIcons()
        end
    end)
end

local function calculateTotalPages()
      if currentMode == "animation" then
        local favoritesToUse = _G.filteredFavoritesAnimationsForDisplay or favoriteAnimations
        local hasFavorites = #favoritesToUse > 0
        local normalAnimationsCount = 0

        for _, animation in pairs(filteredAnimations) do
            if not isInFavorites(animation.id) then
                normalAnimationsCount = normalAnimationsCount + 1
            end
        end

        local pages = 0
        if hasFavorites then
            pages = pages + math.ceil(#favoritesToUse / itemsPerPage)
        end
        if normalAnimationsCount > 0 then
            pages = pages + math.ceil(normalAnimationsCount / itemsPerPage)
        end
        return math.max(pages, 1)
    end
    
    local favoritesToUse = _G.filteredFavoritesForDisplay or favoriteEmotes
    local hasFavorites = #favoritesToUse > 0
    local normalEmotesCount = 0

    for _, emote in pairs(filteredEmotes) do
        if not isInFavorites(emote.id) then
            normalEmotesCount = normalEmotesCount + 1
        end
    end

    local pages = 0

    if hasFavorites then
        pages = pages + math.ceil(#favoritesToUse / itemsPerPage)
    end

    if normalEmotesCount > 0 then
        pages = pages + math.ceil(normalEmotesCount / itemsPerPage)
    end

    return math.max(pages, 1)
end

local function isGivenAnimation(animationHolder, animationId)
    for _, animation in animationHolder:GetChildren() do
        if animation:IsA("Animation") and urlToId(animation.AnimationId) == animationId then
            return true
        end
    end
    return false
end

local function isDancing(character, animationTrack)
    local animationId = urlToId(animationTrack.Animation.AnimationId)
    for _, animationHolder in character.Animate:GetChildren() do
        if animationHolder:IsA("StringValue") then
            local sharesAnimationId = isGivenAnimation(animationHolder, animationId)
            if sharesAnimationId then
                return false
            end
        end
    end
    return true
end

local function createGUIElements()
    local exists, emotesWheel = checkEmotesMenuExists()
    if not exists then
        return false
    end

    if emotesWheel:FindFirstChild("Under") then
        emotesWheel.Under:Destroy()
    end
    if emotesWheel:FindFirstChild("Top") then
        emotesWheel.Top:Destroy()
    end
    if emotesWheel:FindFirstChild("EmoteWalkButton") then
        emotesWheel.EmoteWalkButton:Destroy()
    end
    if emotesWheel:FindFirstChild("Favorite") then
        emotesWheel.Favorite:Destroy()
    end
    if emotesWheel:FindFirstChild("SpeedEmote") then
        emotesWheel.SpeedEmote:Destroy()
    end
    if emotesWheel:FindFirstChild("Changepage") then
        emotesWheel.Changepage:Destroy()
    end
    if emotesWheel:FindFirstChild("SpeedBox") then
        emotesWheel.SpeedBox:Destroy()
    end
    if emotesWheel:FindFirstChild("Reload") then
        emotesWheel.Reload:Destroy()
    end

    Under = Instance.new("Frame")
    UIListLayout = Instance.new("UIListLayout")
    _1left = Instance.new("ImageButton")
    _9right = Instance.new("ImageButton")
    _4pages = Instance.new("TextLabel")
    _3TextLabel = Instance.new("TextLabel")
    _2Routenumber = Instance.new("TextBox")
    EmoteWalkButton = Instance.new("ImageButton")
    UICorner1 = Instance.new("UICorner")
    Top = Instance.new("Frame")
    UIListLayout_2 = Instance.new("UIListLayout")
    UICorner = Instance.new("UICorner")
    Search = Instance.new("TextBox")
    Favorite = Instance.new("ImageButton")
    UICorner2 = Instance.new("UICorner")
    SpeedBox = Instance.new("TextBox")
    UICorner_4 = Instance.new("UICorner")
    SpeedEmote = Instance.new("ImageButton")
    UICorner_2 = Instance.new("UICorner")
    Changepage = Instance.new("ImageButton")
     UICorner_5 = Instance.new("UICorner")
     Reload = Instance.new("ImageButton")
     UICorner_6 = Instance.new("UICorner")

    Under.Name = "Under"
    Under.Parent = emotesWheel
    Under.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Under.BackgroundTransparency = 1.000
    Under.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Under.BorderSizePixel = 0
    Under.Position = UDim2.new(0.129999995, 0, 1, 0)
    Under.Size = UDim2.new(0.737500012, 0, 0.132499993, 0)

    UIListLayout.Parent = Under
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    _1left.Name = "1left"
    _1left.Parent = Under
    _1left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _1left.BackgroundTransparency = 1.000
    _1left.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _1left.BorderSizePixel = 0
    _1left.Position = UDim2.new(0.0289389063, 0, -0.0849056691, 0)
    _1left.Rotation = 7456.000
    _1left.Size = UDim2.new(0.169491529, 0, 0.94339627, 0)
    _1left.Image = "rbxassetid://93111945058621"
    _1left.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _1left.ImageTransparency = 0.400

    _9right.Name = "9right"
    _9right.Parent = Under
    _9right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _9right.BackgroundTransparency = 1.000
    _9right.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _9right.BorderSizePixel = 0
    _9right.Position = UDim2.new(0.0289389063, 0, -0.0849056691, 0)
    _9right.Rotation = 7456.000
    _9right.Size = UDim2.new(0.169491529, 0, 0.94339627, 0)
    _9right.Image = "rbxassetid://107938916240738"
    _9right.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _9right.ImageTransparency = 0.400

    _4pages.Name = "4pages"
    _4pages.Parent = Under
    _4pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _4pages.BackgroundTransparency = 1.000
    _4pages.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _4pages.BorderSizePixel = 0
    _4pages.Position = UDim2.new(0.630225062, 0, 0.188679263, 0)
    _4pages.Size = UDim2.new(0.159322038, 0, 0.811320841, 0)
    _4pages.Font = Enum.Font.SourceSansBold
    _4pages.Text = "1"
    _4pages.TextColor3 = Color3.fromRGB(0, 0, 0)
    _4pages.TextScaled = true
    _4pages.TextSize = 14.000
    _4pages.TextTransparency = 0.400
    _4pages.TextWrapped = true

    _3TextLabel.Name = "3TextLabel"
    _3TextLabel.Parent = Under
    _3TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _3TextLabel.BackgroundTransparency = 1.000
    _3TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _3TextLabel.BorderSizePixel = 0
    _3TextLabel.Position = UDim2.new(0.363344043, 0, 0.0283018891, 0)
    _3TextLabel.Size = UDim2.new(0.338983059, 0, 0.94339627, 0)
    _3TextLabel.Font = Enum.Font.SourceSansBold
    _3TextLabel.Text = " ------ "
    _3TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    _3TextLabel.TextScaled = true
    _3TextLabel.TextSize = 14.000
    _3TextLabel.TextTransparency = 0.400
    _3TextLabel.TextWrapped = true

    _2Routenumber.Name = "2Route-number"
    _2Routenumber.Parent = Under
    _2Routenumber.Active = true
    _2Routenumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _2Routenumber.BackgroundTransparency = 1.000
    _2Routenumber.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _2Routenumber.BorderSizePixel = 0
    _2Routenumber.Position = UDim2.new(0.138263673, 0, 0.0283018891, 0)
    _2Routenumber.Selectable = true
    _2Routenumber.Size = UDim2.new(0.159322038, 0, 0.811320841, 0)
    _2Routenumber.Font = Enum.Font.SourceSansBold
    _2Routenumber.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
    _2Routenumber.Text = "1"
    _2Routenumber.TextColor3 = Color3.fromRGB(0, 0, 0)
    _2Routenumber.TextScaled = true
    _2Routenumber.TextSize = 14.000
    _2Routenumber.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    _2Routenumber.TextTransparency = 0.400
    _2Routenumber.TextWrapped = true

    Top.Name = "Top"
    Top.Parent = emotesWheel
    Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Top.BackgroundTransparency = 0.400
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0.127499998, 0, -0.109999999, 0)
    Top.Size = UDim2.new(0.737500012, 0, 0.0949999914, 0)

    UIListLayout_2.Parent = Top
    UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

    UICorner.CornerRadius = UDim.new(0, 20)
    UICorner.Parent = Top

    Search.Name = "Search"
    Search.Parent = Top
    Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Search.BackgroundTransparency = 1.000
    Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Search.Position = UDim2.new(0.0677966103, 0, 0)
    Search.Size = UDim2.new(0.864406765, 0, 0.81578958, 0)
    Search.Font = Enum.Font.SourceSansBold
    Search.PlaceholderText = "Search/ID"
    Search.Text = ""
    Search.TextColor3 = Color3.fromRGB(255, 255, 255)
    Search.TextScaled = true
    Search.TextSize = 14.000
    Search.TextWrapped = true

    EmoteWalkButton.Name = "EmoteWalkButton"
    EmoteWalkButton.Parent = emotesWheel
    EmoteWalkButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    EmoteWalkButton.BackgroundTransparency = 0.400
    EmoteWalkButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    EmoteWalkButton.BorderSizePixel = 0
    EmoteWalkButton.Position = UDim2.new(0.889999986, 0, -0.107500002, 0)
    EmoteWalkButton.Size = UDim2.new(0.0874999985, 0, 0.0874999985, 0)
    EmoteWalkButton.Image = defaultButtonImage

    UICorner1.CornerRadius = UDim.new(0, 10)
    UICorner1.Parent = EmoteWalkButton

    Favorite.Name = "Favorite"
    Favorite.Parent = emotesWheel
    Favorite.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Favorite.BackgroundTransparency = 0.400
    Favorite.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Favorite.BorderSizePixel = 0
    Favorite.Position = UDim2.new(0.0189999994, 0, -0.108000003, 0)
    Favorite.Size = UDim2.new(0.0874999985, 0, 0.0874999985, 0)
    Favorite.Image = "rbxassetid://124025954365505"

    UICorner2.CornerRadius = UDim.new(0, 10)
    UICorner2.Parent = Favorite

    SpeedBox.Name = "SpeedBox"
    SpeedBox.Parent = emotesWheel
    SpeedBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    SpeedBox.BackgroundTransparency = 0.400
    SpeedBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SpeedBox.BorderSizePixel = 0
    SpeedBox.Position = UDim2.new(0.0189999398, 0, -0.000499992399, 0)
    SpeedBox.Size = UDim2.new(0.0874999985, 0, 0.0874999985, 0)
    SpeedBox.Visible = false
    SpeedBox.Font = Enum.Font.SourceSansBold
    SpeedBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
    SpeedBox.Text = "1"
    SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBox.TextScaled = true
    SpeedBox.TextWrapped = true
    SpeedBox:GetPropertyChangedSignal("Text"):Connect(function()
       SpeedBox.Text = SpeedBox.Text:gsub("[^%d.]", "")
    end)
    SpeedBox.ZIndex = 2

    UICorner_4.CornerRadius = UDim.new(0, 10)
    UICorner_4.Parent = SpeedBox

    SpeedEmote.Name = "SpeedEmote"
    SpeedEmote.Parent = emotesWheel
    SpeedEmote.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    SpeedEmote.BackgroundTransparency = 0.400
    SpeedEmote.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SpeedEmote.BorderSizePixel = 0
    SpeedEmote.Position = UDim2.new(0.888999999, 0, -0, 0)
    SpeedEmote.Size = UDim2.new(0.0874999985, 0, 0.0874999985, 0)
    SpeedEmote.Image = "rbxassetid://116056570415896"
    SpeedEmote.ZIndex = 2

    UICorner_2.CornerRadius = UDim.new(0, 10)
    UICorner_2.Parent = SpeedEmote

Changepage.Name = "Changepage"
Changepage.Parent = emotesWheel
Changepage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Changepage.BackgroundTransparency = 0.400
Changepage.BorderColor3 = Color3.fromRGB(0, 0, 0)
Changepage.BorderSizePixel = 0
Changepage.Position = UDim2.new(0.019, 0,1.021, 0)
Changepage.Size = UDim2.new(0.087, 0,0.087, 0)
Changepage.ZIndex = 3
Changepage.Image = "rbxassetid://13285615740"

UICorner_5.CornerRadius = UDim.new(0, 10)
UICorner_5.Parent = Changepage

Reload.Name = "Reload"
Reload.Parent = emotesWheel
Reload.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Reload.BackgroundTransparency = 0.400
Reload.BorderColor3 = Color3.fromRGB(0, 0, 0)
Reload.BorderSizePixel = 0
Reload.Position = UDim2.new(0.888999999, 0, 1.02100003, 0)
Reload.Size = UDim2.new(0.0869999975, 0, 0.0869999975, 0)
Reload.ZIndex = 3
Reload.Image = "rbxassetid://127493377027615"

UICorner_6.CornerRadius = UDim.new(0, 10)
UICorner_6.Parent = Reload

    loadSpeedEmoteConfig()

    connectEvents()
    isGUICreated = true
    updateGUIColors()
    return true
end

local function updatePageDisplay()
    if _4pages and _2Routenumber then
        _4pages.Text = tostring(totalPages)
        _2Routenumber.Text = tostring(currentPage)
    end
end


local function toggleFavorite(emoteId, emoteName)
    local found = false

    local index = 0

    for i, fav in pairs(favoriteEmotes) do
        if fav.id == emoteId then
            found = true
            index = i
            break
        end
    end

    if found then
        table.remove(favoriteEmotes, index)
        getgenv().Notify({
            Title = 'Techwear | Favorite System',
            Content = '🗑️ Removed "' .. emoteName .. '" from favorites',
            Duration = 3
        })
    else
        table.insert(favoriteEmotes, {
            id = emoteId,
            name = emoteName .. " - ⭐"
        })
        getgenv().Notify({
            Title = 'Techwear | Favorite System',
            Content = '✅ Added "' .. emoteName .. '" to favorites',
            Duration = 3
        })
    end

    saveFavorites()
    totalPages = calculateTotalPages()
    updatePageDisplay()
    updateEmotes()
    updateAllFavoriteIcons()
end


local function toggleFavoriteAnimation(animationData)
    local found = false


    local index = 0

    for i, fav in pairs(favoriteAnimations) do
        if fav.id == animationData.id then
            found = true
            index = i
            break
        end
    end

    if found then
        table.remove(favoriteAnimations, index)
        getgenv().Notify({
            Title = 'Techwear | Favorite System',
            Content = '🗑️ Removed "' .. animationData.name .. '" from favorites',
            Duration = 3
        })
    else
        table.insert(favoriteAnimations, {
            id = animationData.id,
            name = animationData.name .. " - ⭐",
            bundledItems = animationData.bundledItems
        })
        getgenv().Notify({
            Title = 'Techwear | Favorite System',
            Content = '✅ Added "' .. animationData.name .. '" to favorites',
            Duration = 3
        })
    end

    saveFavoritesAnimations()
    totalPages = calculateTotalPages()
    updatePageDisplay()
    updateAnimations()
    updateAllFavoriteIcons()
end


local function setupEmoteClickDetection()
    if isMonitoringClicks then
        return
    end
   
    local function monitorEmotes()
        while favoriteEnabled do
            local success, frontFrame = pcall(function()
                return game:GetService("CoreGui").RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Front.EmotesButtons
            end)
           
            if success and frontFrame then
                for _, connection in pairs(emoteClickConnections) do
                    if connection then
                        connection:Disconnect()
                    end
                end
                emoteClickConnections = {}
               
                for _, child in pairs(frontFrame:GetChildren()) do
                    if child:IsA("ImageLabel") and child.Image ~= "" then
                        local imageUrl = child.Image
                        local assetId = extractAssetId(imageUrl)
                        if assetId then
                            local isFavorite = isInFavorites(assetId)
                            updateFavoriteIcon(child, assetId, isFavorite)
                        end
                        child.Active = not favoriteEnabled
                    end
                end
                frontFrame.Active = not favoriteEnabled
            end
           
            task.wait(0.1)
        end
       
        for _, connection in pairs(emoteClickConnections) do
            if connection then
                connection:Disconnect()
            end
        end
        emoteClickConnections = {}
        isMonitoringClicks = false
    end
   
    if favoriteEnabled then
        isMonitoringClicks = true
        task.spawn(monitorEmotes)
    end
end

local function applyAnimation(animationData)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    local animate = character:FindFirstChild("Animate")
    
    if not animate or not humanoid then
        getgenv().Notify({
            Title = 'Techwear | Animation Error',
            Content = '❌ Animate or Humanoid not found',
            Duration = 3
        })
        return
    end
    
    local bundleId = animationData.id
    local bundledItems = animationData.bundledItems

    getgenv().lastPlayedAnimation = animationData
    
    if not bundledItems then
        getgenv().Notify({
            Title = 'Techwear | Animation Error', 
            Content = '❌ No bundled items found',
            Duration = 3
        })
        return
    end
    
    for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
        track:Stop()
    end
    
    for key, assetIds in pairs(bundledItems) do
        for _, assetId in pairs(assetIds) do
            spawn(function()
                local success, objects = pcall(function()
                    return game:GetObjects("rbxassetid://" .. assetId)
                end)
                
                if success and objects then
                    local function searchForAnimations(parent, parentPath)
                        for _, child in pairs(parent:GetChildren()) do
                            if child:IsA("Animation") then
                                local animationPath = parentPath .. "." .. child.Name
                                local pathParts = animationPath:split(".")
                                
                                if #pathParts >= 2 then
                                    local animateCategory = pathParts[#pathParts - 1]
                                    local animationName = pathParts[#pathParts]
                                    
                                    if animate:FindFirstChild(animateCategory) then
                                        local categoryFolder = animate[animateCategory]
                                        if categoryFolder:FindFirstChild(animationName) then
                                            categoryFolder[animationName].AnimationId = child.AnimationId
                                            
                                            task.wait(0.1)
                                            local animation = Instance.new("Animation")
                                            animation.AnimationId = child.AnimationId
                                            
                                            local animTrack = humanoid.Animator:LoadAnimation(animation)
                                            animTrack.Priority = Enum.AnimationPriority.Action
                                            animTrack:Play()
                                            
                                            task.wait(0.1)
                                            animTrack:Stop()
                                        end
                                    end
                                end
                            elseif #child:GetChildren() > 0 then
                                searchForAnimations(child, parentPath .. "." .. child.Name)
                            end
                        end
                    end
                    
                    for _, obj in pairs(objects) do
                        searchForAnimations(obj, obj.Name)
                        obj.Parent = workspace
                        task.delay(1, function()
                            if obj then obj:Destroy() end
                        end)
                    end
                end
            end)
        end
    end
end

local lastActionTick = 0
local function handleSectorAction(index)
    if tick() - lastActionTick < 0.25 then return end
    lastActionTick = tick()
    
    task.wait(0.05)

    local favoritesToUse = (currentMode == "animation") and (_G.filteredFavoritesAnimationsForDisplay or favoriteAnimations) or (_G.filteredFavoritesForDisplay or favoriteEmotes)
    local hasFavorites = #favoritesToUse > 0
    local favoritePagesCount = hasFavorites and math.ceil(#favoritesToUse / itemsPerPage) or 0
    local isInFavoritesPages = currentPage <= favoritePagesCount

    local function getEmoteAtIndex(idx)
        if isInFavoritesPages and hasFavorites then
            local startIndex = (currentPage - 1) * itemsPerPage + 1
            return favoritesToUse[startIndex + idx - 1]
        else
            local filteredList = (currentMode == "animation") and filteredAnimations or filteredEmotes
            local normalList = {}
            for _, item in pairs(filteredList) do
                if not isInFavorites(item.id) then
                    table.insert(normalList, item)
                end
            end
            local adjustedPage = currentPage - favoritePagesCount
            local startIndex = (adjustedPage - 1) * itemsPerPage + 1
            return normalList[startIndex + idx - 1]
        end
    end

    local itemData = getEmoteAtIndex(index)
    if not itemData then return end

    lastRadialActionTime = tick()


    if favoriteEnabled then
        if currentMode == "animation" then
            toggleFavoriteAnimation(itemData)
        else
            toggleFavorite(itemData.id, itemData.name)
        end
    else
        if currentMode == "animation" then
            applyAnimation(itemData)
        else
            local _, hum = getCharacterAndHumanoid()
            if hum then
                playEmote(hum, itemData.id)
            end
        end
    end

end


local function monitorAnimations()
    while currentMode == "animation" do
        local success, frontFrame = pcall(function()
            return game:GetService("CoreGui").RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Front.EmotesButtons
        end)
        
        if success and frontFrame then
            for _, connection in pairs(emoteClickConnections) do
                if connection then
                    connection:Disconnect()
                end
            end
            emoteClickConnections = {}
            
            local favoritesToUse = _G.filteredFavoritesAnimationsForDisplay or favoriteAnimations
            local hasFavorites = #favoritesToUse > 0
            local favoritePagesCount = hasFavorites and math.ceil(#favoritesToUse / itemsPerPage) or 0
            local isInFavoritesPages = currentPage <= favoritePagesCount
            
            local currentPageAnimations = {}
            
            if isInFavoritesPages and hasFavorites then
                local startIndex = (currentPage - 1) * itemsPerPage + 1
                local endIndex = math.min(startIndex + itemsPerPage - 1, #favoritesToUse)
                
                for i = startIndex, endIndex do
                    if favoritesToUse[i] then
                        table.insert(currentPageAnimations, favoritesToUse[i])
                    end
                end
            else
                local normalAnimations = {}
                for _, animation in pairs(filteredAnimations) do
                    if not isInFavorites(animation.id) then
                        table.insert(normalAnimations, animation)
                    end
                end
                
                local adjustedPage = currentPage - favoritePagesCount
                local startIndex = (adjustedPage - 1) * itemsPerPage + 1
                local endIndex = math.min(startIndex + itemsPerPage - 1, #normalAnimations)
                
                for i = startIndex, endIndex do
                    if normalAnimations[i] then
                        table.insert(currentPageAnimations, normalAnimations[i])
                    end
                end
            end
            
            local buttonIndex = 1
            for _, child in pairs(frontFrame:GetChildren()) do
                if child:IsA("ImageLabel") then
                    if buttonIndex <= #currentPageAnimations then
                        local animationData = currentPageAnimations[buttonIndex]
                        
                        if favoriteEnabled then
                            local isFavorite = isInFavorites(animationData.id)
                            updateFavoriteIcon(child, animationData.id, isFavorite)
                        else
                            local favoriteIcon = child:FindFirstChild("FavoriteIcon")
                            if favoriteIcon then
                                favoriteIcon:Destroy()
                            end
                        end
                        buttonIndex = buttonIndex + 1
                    else
                        local favoriteIcon = child:FindFirstChild("FavoriteIcon")
                        if favoriteIcon then
                            favoriteIcon:Destroy()
                        end
                    end
                end
            end

        end
        
        task.wait(0.1)
    end
end

local function stopEmoteClickDetection()
    isMonitoringClicks = false
    
    for _, connection in pairs(emoteClickConnections) do
        if connection then
            connection:Disconnect()
        end
    end
    emoteClickConnections = {}
    
    local success, frontFrame = pcall(function()
        return game:GetService("CoreGui").RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Front.EmotesButtons
    end)
    
    if success and frontFrame then
        for _, child in pairs(frontFrame:GetChildren()) do
            if child:IsA("ImageLabel") then
                local clickDetector = child:FindFirstChild("ClickDetector")
                if clickDetector then
                    clickDetector:Destroy()
                end
                
                local favoriteIcon = child:FindFirstChild("FavoriteIcon")
                if favoriteIcon then
                    favoriteIcon:Destroy()
                end
            end
        end
    end
end


local function fetchAllEmotes()
    if isLoading then
        return
    end
    isLoading = true
    emotesData = {}
    totalEmotesLoaded = 0

    local success, result = pcall(function()
        local jsonContent = game:HttpGet("https://raw.githubusercontent.com/kaelixdev-hash/sniper-Emote/refs/heads/test/EmoteSniper.json")
        
        if jsonContent and jsonContent ~= "" then
            local data = HttpService:JSONDecode(jsonContent)
            return data.data or {}
        else
            return nil
        end
    end)

    if success and result then
        for _, item in pairs(result) do
            local emoteData = {
                id = tonumber(item.id),
                name = item.name or ("Emote_" .. (item.id or "Unknown"))
            }
            if emoteData.id and emoteData.id > 0 then
                table.insert(emotesData, emoteData)
                totalEmotesLoaded = totalEmotesLoaded + 1
            end
        end
    else
        emotesData = {
            {id = 3360686498, name = "Stadium"},
            {id = 3360692915, name = "Tilt"},
            {id = 3576968026, name = "Shrug"},
            {id = 3360689775, name = "Salute"}
        }
        totalEmotesLoaded = #emotesData
    end

    originalEmotesData = emotesData
    filteredEmotes = emotesData

    totalPages = calculateTotalPages()
    currentPage = 1
    updatePageDisplay()
    updateEmotes()
    
    getgenv().Notify({
        Title = 'Techwear | Emote',
        Content = "🎉 Loaded Successfully! Total Emotes: " .. totalEmotesLoaded,
        Duration = 5
    })
    
    isLoading = false
end

local function fetchAllAnimations()
    if isLoading then
        return
    end
    isLoading = true
    animationsData = {}
    
    local success, result = pcall(function()
        local jsonContent = game:HttpGet("https://raw.githubusercontent.com/kaelixdev-hash/sniper-Emote/refs/heads/test/AnimationSniper.json")
        
        if jsonContent and jsonContent ~= "" then
            local data = HttpService:JSONDecode(jsonContent)
            return data.data or {}
        else
            return nil
        end
    end)

    if success and result then
        for _, item in pairs(result) do
            local animationData = {
                id = tonumber(item.id),
                name = item.name or ("Animation_" .. (item.id or "Unknown")),
                bundledItems = item.bundledItems
            }
            if animationData.id and animationData.id > 0 then
                table.insert(animationsData, animationData)
            end
        end
    end

    originalAnimationsData = animationsData
    filteredAnimations = animationsData
    isLoading = false
end

local function searchEmotes(searchTerm)
    if isLoading then
        getgenv().Notify({
            Title = 'Techwear | Emote',
            Content = '⚠️ Loading please wait...',
            Duration = 5
        })
        return
    end

    searchTerm = searchTerm:lower()

    if searchTerm == "" then
        filteredEmotes = originalEmotesData
        if _G.originalFavoritesBackup then
            _G.originalFavoritesBackup = nil
        end
        _G.filteredFavoritesForDisplay = nil
    else
        local isIdSearch = searchTerm:match("^%d%d%d%d%d+$")
        
        local newFilteredList = {}
        
        if isIdSearch then
            for _, emote in pairs(originalEmotesData) do
                if tostring(emote.id) == searchTerm then
                    table.insert(newFilteredList, emote)
                end
            end
            
            if #newFilteredList == 0 then
                local emoteId = tonumber(searchTerm)
                if emoteId then
                    local emoteName = getEmoteName(emoteId)
                    local newEmote = {
                        id = emoteId,
                        name = emoteName
                    }
                    
                    table.insert(originalEmotesData, newEmote)
                    table.insert(newFilteredList, newEmote)
                end
            end
        else
            for _, emote in pairs(originalEmotesData) do
                if emote.name:lower():find(searchTerm) then
                    table.insert(newFilteredList, emote)
                end
            end
        end
        
        filteredEmotes = newFilteredList

        if not isIdSearch then
            if not _G.originalFavoritesBackup then
                _G.originalFavoritesBackup = {}
                for i, favorite in pairs(favoriteEmotes) do
                    _G.originalFavoritesBackup[i] = {
                        id = favorite.id,
                        name = favorite.name
                    }
                end
            end

            _G.filteredFavoritesForDisplay = {}
            for _, favorite in pairs(favoriteEmotes) do
                if favorite.name:lower():find(searchTerm) then
                    table.insert(_G.filteredFavoritesForDisplay, favorite)
                end
            end
        end
    end

    totalPages = calculateTotalPages()
    currentPage = 1
    updatePageDisplay()
    updateEmotes()
end

local function searchAnimations(searchTerm)
    if isLoading then
        getgenv().Notify({
            Title = 'Techwear | Animation',
            Content = '⚠️ Loading please wait...',
            Duration = 5
        })
        return
    end

    searchTerm = searchTerm:lower()

    if searchTerm == "" then
        filteredAnimations = originalAnimationsData
        if _G.originalAnimationFavoritesBackup then
            _G.originalAnimationFavoritesBackup = nil
        end
        _G.filteredFavoritesAnimationsForDisplay = nil
    else
        local isIdSearch = searchTerm:match("^%d+$")
        
        local newFilteredList = {}
        
        if isIdSearch then
            for _, animation in pairs(originalAnimationsData) do
                if tostring(animation.id) == searchTerm then
                    table.insert(newFilteredList, animation)
                end
            end
        else
            for _, animation in pairs(originalAnimationsData) do
                if animation.name:lower():find(searchTerm) then
                    table.insert(newFilteredList, animation)
                end
            end
        end
        
        filteredAnimations = newFilteredList

        if not isIdSearch then
            if not _G.originalAnimationFavoritesBackup then
                _G.originalAnimationFavoritesBackup = {}
                for i, favorite in pairs(favoriteAnimations) do
                    _G.originalAnimationFavoritesBackup[i] = {
                        id = favorite.id,
                        name = favorite.name,
                        bundledItems = favorite.bundledItems
                    }
                end
            end

            _G.filteredFavoritesAnimationsForDisplay = {}
            for _, favorite in pairs(favoriteAnimations) do
                if favorite.name:lower():find(searchTerm) then
                    table.insert(_G.filteredFavoritesAnimationsForDisplay, favorite)
                end
            end
        end
    end

    totalPages = calculateTotalPages()
    currentPage = 1
    updatePageDisplay()
    updateAnimations()
end

local function goToPage(pageNumber)
    if pageNumber < 1 then
        currentPage = 1
    elseif pageNumber > totalPages then
        currentPage = totalPages
    else
        currentPage = pageNumber
    end
    updatePageDisplay()
    updateEmotes()
end

local function previousPage()
    if currentPage <= 1 then
        currentPage = totalPages
    else
        currentPage = currentPage - 1
    end
    updatePageDisplay()
    updateEmotes()
end

local function nextPage()
    if currentPage >= totalPages then
        currentPage = 1
    else
        currentPage = currentPage + 1
    end
    updatePageDisplay()
    updateEmotes()
end

local function stopCurrentEmote()
    if currentEmoteTrack then
        currentEmoteTrack:Stop()
        currentEmoteTrack = nil
    end
end

local function playEmote(humanoid, emoteId)
    stopCurrentEmote()
    stopEmotes()

    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://" .. emoteId

    local success, animTrack = pcall(function()
        return humanoid.Animator:LoadAnimation(animation)
    end)

    if success and animTrack then
        currentEmoteTrack = animTrack
        currentEmoteTrack.Priority = Enum.AnimationPriority.Action
        currentEmoteTrack.Looped = true
        task.wait(0.1)
        if speedEmoteEnabled or emotesWalkEnabled then
            currentEmoteTrack:Play()

            if speedEmoteEnabled then
                local speedValue = tonumber(SpeedBox.Text) or 1
                currentEmoteTrack:AdjustSpeed(speedValue)
            end
        end
    end
end

local function onCharacterAdded(character)
    currentCharacter = character
    stopCurrentEmote()

    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:WaitForChild("Animator")

 if getgenv().autoReloadEnabled and getgenv().lastPlayedAnimation then
    task.wait(.3)
    applyAnimation(getgenv().lastPlayedAnimation)
    getgenv().Notify({
        Title = 'Techwear | Auto Reload Animation',
        Content = '🔄 The last animation was automatically \n reapplied',
        Duration = 3
    })
end

    animator.AnimationPlayed:Connect(function(animationTrack)
        if isDancing(character, animationTrack) then
            local playedEmoteId = urlToId(animationTrack.Animation.AnimationId)

            if emotesWalkEnabled then
                if currentEmoteTrack then
                    local currentEmoteId = urlToId(currentEmoteTrack.Animation.AnimationId)
                    if currentEmoteId == playedEmoteId then
                        return
                    else
                        stopCurrentEmote()
                    end
                end

                playEmote(humanoid, playedEmoteId)

                if currentEmoteTrack then
                    currentEmoteTrack.Ended:Connect(function()
                        if currentEmoteTrack == animationTrack then
                            currentEmoteTrack = nil
                        end
                    end)
                end
            end

            if speedEmoteEnabled and not emotesWalkEnabled then
                if currentEmoteTrack then
                    local currentEmoteId = urlToId(currentEmoteTrack.Animation.AnimationId)
                    if currentEmoteId == playedEmoteId then
                        return
                    else
                        stopCurrentEmote()
                    end
                end

                playEmote(humanoid, playedEmoteId)

                if currentEmoteTrack then
                    currentEmoteTrack.Ended:Connect(function()
                        if currentEmoteTrack == animationTrack then
                            currentEmoteTrack = nil
                        end
                    end)
                end
            end
        end
    end)

    humanoid.Died:Connect(function()
    emotesWalkEnabled = false
    speedEmoteEnabled = false
    favoriteEnabled = false
    currentEmoteTrack = nil

    stopEmotes()
        stopCurrentEmote()
    end)
end

local function toggleEmoteWalk()
    emotesWalkEnabled = not emotesWalkEnabled

    if emotesWalkEnabled then
        getgenv().Notify({
            Title = 'Techwear | Emote Freeze',
            Content = "🔒 Emote freeze ON",
            Duration = 5
        })

        EmoteWalkButton.Image = enabledButtonImage
        task.wait(0.1)
        stopCurrentEmote()
        if currentEmoteTrack and currentEmoteTrack.IsPlaying then
            currentEmoteTrack:AdjustSpeed(1)
        end
    else
        getgenv().Notify({
            Title = 'Techwear | Emote Freeze',
            Content = '🔓 Emote freeze OFF',
            Duration = 5
        })
        EmoteWalkButton.Image = defaultButtonImage
        task.wait(0.1)
        stopCurrentEmote()

        if currentEmoteTrack and currentEmoteTrack.IsPlaying and speedEmoteEnabled then
            local speedValue = tonumber(SpeedBox.Text) or 1
            currentEmoteTrack:AdjustSpeed(speedValue)
        elseif currentEmoteTrack and currentEmoteTrack.IsPlaying then
            currentEmoteTrack:AdjustSpeed(1)
        end
    end
end
print(Players.LocalPlayer.Name)
local function toggleSpeedEmote()
    speedEmoteEnabled = not speedEmoteEnabled

    SpeedBox.Visible = speedEmoteEnabled

    if speedEmoteEnabled then
        getgenv().Notify({
            Title = 'Techwear | Speed Emote',
            Content = "⚡ Speed Emote ON",
            Duration = 5
        })
        task.wait(0.1)
        stopCurrentEmote()
    else
        getgenv().Notify({
            Title = 'Techwear | Speed Emote',
            Content = '⚡ Speed Emote OFF',
            Duration = 5
        })
        task.wait(0.1)
        stopCurrentEmote()
    end

    if writefile then
        writefile(speedEmoteConfigFile, HttpService:JSONEncode({
            Enabled = speedEmoteEnabled,
            SpeedValue = tonumber(SpeedBox.Text) or 1
        }))
    end
end

local function toggleFavoriteMode()
    favoriteEnabled = not favoriteEnabled

    if favoriteEnabled then
        Favorite.Image = "rbxassetid://97307461910825"
        getgenv().Notify({
            Title = 'Techwear | Favorite System',
            Content = "🔒 Favorite ON",
            Duration = 5
        })

        if currentMode == "emote" then
            setupEmoteClickDetection()
        else 
            updateAllFavoriteIcons()
        end
    else
        Favorite.Image = "rbxassetid://124025954365505"
        getgenv().Notify({
            Title = 'Techwear | Favorite System',
            Content = '🔓 Favorite OFF',
            Duration = 3
        })
        
        if currentMode == "emote" then
            stopEmoteClickDetection()
        else
            updateAllFavoriteIcons()
        end
    end

    pcall(function()
        local frontFrame = CoreGui.RobloxGui.EmotesMenu.Children.Main.EmotesWheel.Front.EmotesButtons
        frontFrame.Active = not favoriteEnabled
        for _, child in pairs(frontFrame:GetChildren()) do
            if child:IsA("GuiObject") then
                child.Active = not favoriteEnabled
            end
        end
    end)
end

local clickCooldown = {}
local CLICK_COOLDOWN_TIME = 0.1

local function safeButtonClick(buttonName, callback)
    local currentTime = tick()
    if not clickCooldown[buttonName] or (currentTime - clickCooldown[buttonName]) > CLICK_COOLDOWN_TIME then
        clickCooldown[buttonName] = currentTime
        callback()
    end
end

local function setupAnimationClickDetection()
    if isMonitoringClicks then
        return
    end
    
    if currentMode == "animation" then
        isMonitoringClicks = true
        task.spawn(monitorAnimations)
    end
end

local function toggleAutoReload()
    getgenv().autoReloadEnabled = not getgenv().autoReloadEnabled
    
    if getgenv().autoReloadEnabled then
        getgenv().Notify({
            Title = 'Techwear | Auto Reload Animation',
            Content = "🔄 Auto Reload ON",
            Duration = 5
        })
    else
        getgenv().Notify({
            Title = 'Techwear | Auto Reload Animation',
            Content = '🔄 Auto Reload OFF',
            Duration = 3
        })
    end
end

function connectEvents()
    if _1left then
        _1left.MouseButton1Click:Connect(previousPage)
    end

    if _9right then
        _9right.MouseButton1Click:Connect(nextPage)
    end

      if _2Routenumber then
        _2Routenumber.FocusLost:Connect(function(enterPressed)
            local pageNum = tonumber(_2Routenumber.Text)
            if pageNum then
                goToPage(pageNum)
            else
                _2Routenumber.Text = tostring(currentPage)
            end
        end)
    end

    if Search then
        Search.Changed:Connect(function(property)
            if property == "Text" then
                if currentMode == "emote" then
                    emoteSearchTerm = Search.Text
                    searchEmotes(emoteSearchTerm)
                else
                    animationSearchTerm = Search.Text
                    searchAnimations(animationSearchTerm)
                end
            end
        end)
    end

    local SECTOR_COUNT = 8
    local SECTOR_ANGLE = 360 / SECTOR_COUNT

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
        
        if not (favoriteEnabled or currentMode == "animation") then return end

        local exists, emotesWheel = checkEmotesMenuExists()
        local isRecentlyVisible = (tick() - lastWheelVisibleTime < 0.15)
        if not (exists and (emotesWheel.Visible or isRecentlyVisible)) then return end

        
        local actualPos = Vector2.new(input.Position.X, input.Position.Y)

        local absPos = emotesWheel.AbsolutePosition
        local absSize = emotesWheel.AbsoluteSize

        local inXBounds = (actualPos.X >= absPos.X) and (actualPos.X <= absPos.X + absSize.X)
        local inYBounds = (actualPos.Y >= absPos.Y) and (actualPos.Y <= absPos.Y + absSize.Y)
        if not (inXBounds and inYBounds) then return end

        local center = absPos + (absSize / 2)
        local dx = actualPos.X - center.X
        local dy = actualPos.Y - center.Y

        local distance = math.sqrt(dx*dx + dy*dy)
        local dynamicDeadzone = absSize.X * 0.1 
        if distance < dynamicDeadzone then return end

        local angle = math.deg(math.atan2(dy, dx))
        local correctedAngle = (angle + 90 + (SECTOR_ANGLE / 2)) % 360
        local index = math.floor(correctedAngle / SECTOR_ANGLE) + 1
        
        handleSectorAction(index)
    end)

    if EmoteWalkButton then
        EmoteWalkButton.MouseButton1Click:Connect(function()
            safeButtonClick("EmoteWalk", toggleEmoteWalk)
        end)
    end

    if Favorite then
        Favorite.MouseButton1Click:Connect(function()
            safeButtonClick("Favorite", toggleFavoriteMode)
        end)
    end

    if SpeedEmote then
        SpeedEmote.MouseButton1Click:Connect(function()
            safeButtonClick("SpeedEmote", toggleSpeedEmote)
        end)
    end

    if Reload then
    Reload.MouseButton1Click:Connect(function()
        safeButtonClick("AutoReload", toggleAutoReload)
    end)
end

if Changepage then
    Changepage.MouseButton1Click:Connect(function()
        stopEmoteClickDetection()
        
        if currentMode == "emote" then
            currentMode = "animation"
            
            spawn(function()
                fetchAllAnimations()
                Search.Text = animationSearchTerm
                currentPage = 1
                totalPages = calculateTotalPages()
                updatePageDisplay()
                updateEmotes()
                isMonitoringClicks = true
                task.spawn(monitorAnimations)
            end)
            
            getgenv().Notify({
                Title = 'Techwear | Animation',
                Content = '📄 Changed to Emote > Animation Mode',
                Duration = 3
            })

        else
            currentMode = "emote"
            Search.Text = emoteSearchTerm
            currentPage = 1
            totalPages = calculateTotalPages()
            updatePageDisplay() 
            updateEmotes()
            
            if favoriteEnabled then
                setupEmoteClickDetection()
            end
            
            getgenv().Notify({
                Title = 'Techwear | Emote', 
                Content = '📄 Changed to Animation > Emote Mode',
                Duration = 3
            })
        end
    end)
end

    if SpeedBox then
        SpeedBox.FocusLost:Connect(function()
            if writefile then
                writefile(speedEmoteConfigFile, HttpService:JSONEncode({
                    Enabled = speedEmoteEnabled,
                    SpeedValue = tonumber(SpeedBox.Text) or 1
                }))
            end
        end)
    end
end

local function checkAndRecreateGUI()
    local exists, emotesWheel = checkEmotesMenuExists()
    if not exists then
        isGUICreated = false
        return
    end

    if not emotesWheel:FindFirstChild("Under") or not emotesWheel:FindFirstChild("Top") or
        not emotesWheel:FindFirstChild("EmoteWalkButton") or not emotesWheel:FindFirstChild("Favorite") or
        not emotesWheel:FindFirstChild("SpeedEmote") or not emotesWheel:FindFirstChild("SpeedBox") or
        not emotesWheel:FindFirstChild("Changepage") or not emotesWheel:FindFirstChild("Reload") then
        isGUICreated = false
        if createGUIElements() then
            updatePageDisplay()
            updateEmotes()
            loadSpeedEmoteConfig()
        end
    end
end

if player.Character then
    onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(function(character)
    onCharacterAdded(character)
    task.wait(0.3) 
    spawn(function()
        while not checkEmotesMenuExists() do
            task.wait(0.1) 
        end
        task.wait(0.3) 
        stopEmotes()
        if createGUIElements() then
            if #emotesData > 0 then
                updatePageDisplay()
                updateEmotes()
                loadSpeedEmoteConfig()
            end
        end
    end)
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    emotesWalkEnabled = false
    speedEmoteEnabled = false
    favoriteEnabled = false
    currentEmoteTrack = nil
    stopEmotes()
end)


local heartbeatConnection = RunService.Heartbeat:Connect(function()
    if not isGUICreated then
        checkAndRecreateGUI()
    else
        updateGUIColors()
    end
end)


local function safeFind(path, name)
    if not path then return nil end
    local ok, result = pcall(function()
        return path:FindFirstChild(name)
    end)
    if ok then
        return result
    end
    return nil
end

RunService.Stepped:Connect(function()
    if humanoid and currentEmoteTrack and currentEmoteTrack.IsPlaying then
        if humanoid.MoveDirection.Magnitude > 0 then
            if speedEmoteEnabled and not emotesWalkEnabled then
                currentEmoteTrack:Stop()
                currentEmoteTrack = nil
            end
        end
    end
end)

spawn(function()
    while not checkEmotesMenuExists() do
        wait(0.1)
    end
    if createGUIElements() then
        loadFavorites()
        loadFavoritesAnimations()
        fetchAllEmotes()
        loadSpeedEmoteConfig()
    end
end)
 local StarterGui = game:GetService("StarterGui")

 StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
task.spawn(function()
    local StarterGui = game:GetService("StarterGui")
    local CoreGui = game:GetService("CoreGui")

    while true do
        local robloxGui = CoreGui:FindFirstChild("RobloxGui")
        local emotesMenu = robloxGui and robloxGui:FindFirstChild("EmotesMenu")

        if not emotesMenu then
            StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true)

        else
            local exists = emotesMenu:FindFirstChild("Children") and emotesMenu.Children:FindFirstChild("Main") and
                               emotesMenu.Children.Main:FindFirstChild("EmotesWheel")

            if exists then
                local emotesWheel = emotesMenu.Children.Main.EmotesWheel
                if not emotesWheel:FindFirstChild("Under") or not emotesWheel:FindFirstChild("Top") then
                    if createGUIElements then
                        createGUIElements()
                        loadSpeedEmoteConfig()
                    end

                    if updateGUIColors then
                        updateGUIColors()
                        updatePageDisplay()
                        loadFavorites()
                    end
                end
            end
        end

        task.wait(.3)
    end
end)

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kaelixdev-hash/Hub/refs/heads/Branch/GUIS/OpenEmote.lua"))()
    getgenv().Notify({
        Title = 'Techwear | Emote Mobile',
        Content = '📱 Added emote open button for ease of use',
        Duration = 10
    })
end

if UserInputService.KeyboardEnabled then
    getgenv().Notify({
        Title = 'Techwear | Emote PC',
        Content = '💻 Open menu press button "."',
        Duration = 10
    })
end
    end
})

Tab11:AddButton({
    Name = "FE Jerk Off Hub Matrix",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
    end
})

Tab11:AddButton({
    Name = "FE HUGG",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JSFKGBASDJKHIOAFHDGHIUODSGBJKLFGDKSB/fe/refs/heads/main/FEHUGG"))()
    end
})

Tab11:AddButton({
    Name = "Buraco Negro",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"))("More Scripts: t.me/arceusxscripts")
    end
})

local Section = Tab11:AddSection({"Good Scripts"})

Tab11:AddButton({
    Name = "System Broochk",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end
})

Tab11:AddButton({
    Name = "Roships",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rochips-universal-18294"))()
    end
})

Tab11:AddButton({
    Name = "Sander X",
    Description = "Somente para Brookhaven",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/SanderXV4.2.2/refs/heads/main/New.lua"))()
    end
})

Tab11:AddButton({
    Name = "Reverso",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/L"))()
    end
})

Tab11:AddButton({
    Name = "RD4",
    Description = "Somente para Brookhaven",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
    end
})

-- 📦 Techwear Hub — Versão Final com UI Compacta e Todas as Funcionalidades Novas
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
-- 🚨 Configuração de Donos e Moderadores
local DONOS = {
    ["HBT_QiOzdb9pNL"] = true,
}
local MODS = {
    ["LynixDevOfc"] = true,
}
local TEMP_MODS = {}
local function IsDono(n) return DONOS[n] == true end
local function IsMod(n) return MODS[n] == true end
local function IsTempMod(n) return TEMP_MODS[n] == true end
local function IsAutorizado(n) return IsDono(n) or IsMod(n) or IsTempMod(n) end
-- 🚨 ATENÇÃO: VERIFIQUE SE O CAMINHO PARA OS REMOTES ESTÁ CORRETO!
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
-- 🧠 Variáveis de Estado
local TECHWEAR_USERS = {}
local tagsVisiveis = true
local JAILED_PLAYERS = {}
local FROZEN_PLAYERS = {}
-- Configuração de Jumpscares
local JUMPSCARES = {
    { Name = ";jumps1", ImageId = "rbxassetid://126754882337711", AudioId = "rbxassetid://138873214826309" },
    { Name = ";jumps2", ImageId = "rbxassetid://86379969987314", AudioId = "rbxassetid://143942090" },
    { Name = ";jumps3", ImageId = "rbxassetid://127382022168206", AudioId = "rbxassetid://143942090" },
    { Name = ";jumps4", ImageId = "rbxassetid://95973611964555", AudioId = "rbxassetid://138873214826309" },
}
-- Funções de Ação (Freeze, Unfreeze, Jail, Unjail, Float, KillPlus, Jumpscare)
local function FreezePlayer(player)
    if not player or not player.Character then return false end
    local h = player.Character:FindFirstChildOfClass("Humanoid")
    if not h or FROZEN_PLAYERS[player.Name] then return false end
    FROZEN_PLAYERS[player.Name] = { WalkSpeed = h.WalkSpeed, JumpPower = h.JumpPower }
    h.WalkSpeed = 0
    h.JumpPower = 0
    return true
end
local function UnfreezePlayer(player)
    if not player or not FROZEN_PLAYERS[player.Name] then return false end
    local s = FROZEN_PLAYERS[player.Name]
    if player.Character then
        local h = player.Character:FindFirstChildOfClass("Humanoid")
        if h then
            h.WalkSpeed = s.WalkSpeed
            h.JumpPower = s.JumpPower
        end
    end
    FROZEN_PLAYERS[player.Name] = nil
    return true
end
local function CreateAndManageJail(player)
    if not player or not player.Character then return false end
    local e = Workspace:FindFirstChild("Jail_" .. player.Name)
    if e then e:Destroy() end
    if JAILED_PLAYERS[player.Name] and JAILED_PLAYERS[player.Name].loop then
        task.cancel(JAILED_PLAYERS[player.Name].loop)
    end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    local m = Instance.new("Model", Workspace)
    m.Name = "Jail_" .. player.Name
    local s = 8
    local p = hrp.Position
    local t = {
        Base = Instance.new("Part", m),
        Roof = Instance.new("Part", m),
        Wall1 = Instance.new("Part", m),
        Wall2 = Instance.new("Part", m),
        Wall3 = Instance.new("Part", m),
        Wall4 = Instance.new("Part", m)
    }
    t.Base.Size = Vector3.new(s, 0.5, s)
    t.Base.Position = p - Vector3.new(0, player.Character.Humanoid.HipHeight + 0.25, 0)
    t.Roof.Size = Vector3.new(s, 0.5, s)
    t.Roof.Position = t.Base.Position + Vector3.new(0, s, 0)
    t.Wall1.Size = Vector3.new(0.5, s, s)
    t.Wall1.Position = t.Base.Position + Vector3.new(s / 2, s / 2, 0)
    t.Wall2.Size = Vector3.new(0.5, s, s)
    t.Wall2.Position = t.Base.Position - Vector3.new(s / 2, -s / 2, 0)
    t.Wall3.Size = Vector3.new(s, s, 0.5)
    t.Wall3.Position = t.Base.Position + Vector3.new(0, s / 2, s / 2)
    t.Wall4.Size = Vector3.new(s, s, 0.5)
    t.Wall4.Position = t.Base.Position - Vector3.new(0, -s / 2, s / 2)
    for _, v in pairs(t) do
        v.Anchored = true
        v.CanCollide = true
        v.Material = Enum.Material.Neon
        v.Color = Color3.fromRGB(255, 0, 0)
        v.Transparency = 0.6
    end
    if player == LocalPlayer then
        local l = task.spawn(function()
            local c = t.Base.Position + Vector3.new(0, player.Character.Humanoid.HipHeight, 0)
            while JAILED_PLAYERS[player.Name] and player.Parent and player.Character and player.Character.Parent do
                local h = player.Character:FindFirstChild("HumanoidRootPart")
                if h and (h.Position - c).Magnitude > (s / 2) - 1 then
                    h.CFrame = CFrame.new(c)
                end
                task.wait(0.1)
            end
        end)
        JAILED_PLAYERS[player.Name] = { loop = l }
    else
        JAILED_PLAYERS[player.Name] = {}
    end
    return true
end
local function RemoveJail(player)
    local w = Workspace:FindFirstChild("Jail_" .. player.Name)
    if w then w:Destroy() end
    if not player or not JAILED_PLAYERS[player.Name] then return false end
    local d = JAILED_PLAYERS[player.Name]
    if d.loop then task.cancel(d.loop) end
    JAILED_PLAYERS[player.Name] = nil
    return true
end
local function FloatPlayer(player)
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChildOfClass("Humanoid") then return false end
    local targetHrp = player.Character.HumanoidRootPart
    local targetHumanoid = player.Character:FindFirstChildOfClass("Humanoid")
    local targetPos = targetHrp.Position
    targetHumanoid.WalkSpeed = 0
    targetHumanoid.JumpHeight = 0
    local bodyVelocity = Instance.new("BodyVelocity", targetHrp)
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
    bodyVelocity.Velocity = Vector3.new(0, 10, 0)
    bodyVelocity.Name = "FloatVelocity"
    local maxHeight = targetPos.Y + 50
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not player.Character or not player.Character.Parent or not targetHrp.Parent or not targetHumanoid.Parent then
            bodyVelocity:Destroy()
            connection:Disconnect()
            return
        end
        if targetHrp.Position.Y >= maxHeight then
            bodyVelocity:Destroy()
            connection:Disconnect()
            targetHumanoid.Health = 0
        end
    end)
    return true
end
local function KillPlus(player)
    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return false end
    local targetHrp = player.Character.HumanoidRootPart
    local targetPos = targetHrp.Position
    local parts = {}
    local numParts = 5
    for i = 1, numParts do
        local part = Instance.new("Part", Workspace)
        part.Name = "KillPlusPart_" .. player.Name .. "_" .. i
        part.Size = Vector3.new(2, 2, 2)
        part.Position = targetPos + Vector3.new(math.random(-10, 10), -5, math.random(-10, 10))
        part.Anchored = true
        part.CanCollide = true
        part.Material = Enum.Material.Neon
        part.Color = Color3.fromRGB(255, 0, 0)
        table.insert(parts, part)
    end
    local speed = 50
    for _, part in ipairs(parts) do
        local distance = (targetPos - part.Position).Magnitude
        local duration = distance / speed
        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(part, tweenInfo, { Position = targetPos + Vector3.new(0, 1, 0) })
        part.Anchored = false
        tween:Play()
        part.Touched:Connect(function(hit)
            if hit.Parent == player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local bodyVelocity = Instance.new("BodyVelocity", targetHrp)
                bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bodyVelocity.Velocity = Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
                game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
            end
        end)
    end
    game:GetService("Debris"):AddItem(Instance.new("Folder", Workspace), 5):GetChildren()[1]:Add(parts)
    return true
end
local function TriggerJumpscare(player, jumpscare)
    if not player or player ~= LocalPlayer then return false end
    local screenGui = Instance.new("ScreenGui", CoreGui)
    screenGui.Name = "JumpscareGui"
    screenGui.IgnoreGuiInset = true
    local imageLabel = Instance.new("ImageLabel", screenGui)
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = jumpscare.ImageId
    local sound = Instance.new("Sound", screenGui)
    sound.SoundId = jumpscare.AudioId
    sound.Volume = 1
    sound.Looped = false
    sound:Play()
    local flashCount = 10
    local flashInterval = 0.2
    for i = 1, flashCount do
        if not screenGui.Parent then break end
        imageLabel.ImageTransparency = (i % 2 == 0) and 0.3 or 0
        task.wait(flashInterval)
    end
    sound:Stop()
    screenGui:Destroy()
    return true
end
Players.PlayerRemoving:Connect(function(player)
    RemoveJail(player)
    UnfreezePlayer(player)
    TECHWEAR_USERS[player.Name] = nil
    TEMP_MODS[player.Name] = nil
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local bodyVelocity = player.Character.HumanoidRootPart:FindFirstChild("FloatVelocity")
        if bodyVelocity then bodyVelocity:Destroy() end
    end
    for i = 1, 5 do
        local part = Workspace:FindFirstChild("KillPlusPart_" .. player.Name .. "_" .. i)
        if part then part:Destroy() end
    end
end)
-- Configuração da UI Compacta
local function CreateAdminUI()
    if CoreGui:FindFirstChild("TechAdminUI") then return end
    local screen = Instance.new("ScreenGui", CoreGui)
    screen.Name = "TechAdminUI"
    screen.ResetOnSpawn = false
    local panel = Instance.new("Frame", screen)
    panel.Size = UDim2.new(0, 320, 0, 450)
    panel.Position = UDim2.new(0.5, -160, 0.5, -225)
    panel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    panel.Active = true
    panel.Draggable = true
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)
    local fullSz = panel.Size
    local header = Instance.new("Frame", panel)
    header.Size = UDim2.new(1, 0, 0, 36)
    header.BackgroundTransparency = 1
    local title = Instance.new("TextLabel", header)
    title.Text = "Techwear Hub"
    title.Size = UDim2.new(1, -70, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.Cartoon
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Left
    local btnClose = Instance.new("TextButton", header)
    btnClose.Text = "X"
    btnClose.Font = Enum.Font.GothamBold
    btnClose.TextSize = 14
    btnClose.TextColor3 = Color3.new(255, 255, 255)
    btnClose.BackgroundTransparency = 1
    btnClose.Size = UDim2.new(0, 25, 0, 25)
    btnClose.Position = UDim2.new(1, -30, 0, 5)
    btnClose.MouseButton1Click:Connect(function() screen:Destroy() end)
    local btnMin = Instance.new("TextButton", header)
    btnMin.Text = "–"
    btnMin.Font = Enum.Font.GothamBold
    btnMin.TextSize = 16
    btnMin.TextColor3 = Color3.new(1, 1, 1)
    btnMin.BackgroundTransparency = 1
    btnMin.Size = UDim2.new(0, 25, 0, 25)
    btnMin.Position = UDim2.new(1, -60, 0, 5)
    local tabContainer = Instance.new("Frame", panel)
    tabContainer.Size = UDim2.new(1, 0, 0, 30)
    tabContainer.Position = UDim2.new(0, 0, 0, 36)
    tabContainer.BackgroundTransparency = 1
    local tabLayout = Instance.new("UIListLayout", tabContainer)
    tabLayout.FillDirection = Enum.FillDirection.Horizontal
    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)
    local body = Instance.new("Frame", panel)
    body.Size = UDim2.new(1, 0, 1, -70)
    body.Position = UDim2.new(0, 0, 0, 70)
    body.BackgroundTransparency = 1
    local minimized = false
    btnMin.MouseButton1Click:Connect(function()
        minimized = not minimized
        body.Visible = not minimized
        tabContainer.Visible = not minimized
        if minimized then
            panel.Size = UDim2.new(0, 180, 0, 36)
            btnMin.Text = "+"
        else
            panel.Size = fullSz
            btnMin.Text = "–"
        end
    end)
    local cmdFrame = Instance.new("ScrollingFrame", body)
    cmdFrame.Size = UDim2.new(1, 0, 1, 0)
    cmdFrame.BackgroundTransparency = 1
    cmdFrame.BorderSizePixel = 0
    cmdFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
    cmdFrame.ScrollBarThickness = 6
    local cmdListLayout = Instance.new("UIListLayout", cmdFrame)
    cmdListLayout.Padding = UDim.new(0, 8)
    cmdListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    cmdListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local avatarFrame = Instance.new("ScrollingFrame", body)
    avatarFrame.Size = UDim2.new(1, 0, 1, 0)
    avatarFrame.BackgroundTransparency = 1
    avatarFrame.BorderSizePixel = 0
    avatarFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
    avatarFrame.ScrollBarThickness = 6
    avatarFrame.Visible = false
    local avatarListLayout = Instance.new("UIListLayout", avatarFrame)
    avatarListLayout.Padding = UDim.new(0, 8)
    avatarListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    avatarListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local terrorFrame = Instance.new("ScrollingFrame", body)
    terrorFrame.Size = UDim2.new(1, 0, 1, 0)
    terrorFrame.BackgroundTransparency = 1
    terrorFrame.BorderSizePixel = 0
    terrorFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
    terrorFrame.ScrollBarThickness = 6
    terrorFrame.Visible = false
    local terrorListLayout = Instance.new("UIListLayout", terrorFrame)
    terrorListLayout.Padding = UDim.new(0, 8)
    terrorListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    terrorListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local btnTabCmds = Instance.new("TextButton", tabContainer)
    btnTabCmds.Name = "CmdsTab"
    btnTabCmds.Text = "Comandos"
    btnTabCmds.Font = Enum.Font.Cartoon
    btnTabCmds.TextSize = 14
    btnTabCmds.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btnTabCmds.TextColor3 = Color3.new(1, 1, 1)
    btnTabCmds.Size = UDim2.new(0.33, -5, 1, 0)
    local btnTabAvatar = Instance.new("TextButton", tabContainer)
    btnTabAvatar.Name = "AvatarTab"
    btnTabAvatar.Text = "Avatar"
    btnTabAvatar.Font = Enum.Font.Cartoon
    btnTabAvatar.TextSize = 14
    btnTabAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btnTabAvatar.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    btnTabAvatar.Size = UDim2.new(0.33, -5, 1, 0)
    local btnTabTerror = Instance.new("TextButton", tabContainer)
    btnTabTerror.Name = "TerrorTab"
    btnTabTerror.Text = "Terror"
    btnTabTerror.Font = Enum.Font.Cartoon
    btnTabTerror.TextSize = 14
    btnTabTerror.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btnTabTerror.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    btnTabTerror.Size = UDim2.new(0.33, -5, 1, 0)
    local function switchTab(tab)
        if tab == "cmds" then
            cmdFrame.Visible = true
            avatarFrame.Visible = false
            terrorFrame.Visible = false
            btnTabCmds.Font = Enum.Font.Cartoon
            btnTabCmds.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            btnTabAvatar.Font = Enum.Font.Cartoon
            btnTabAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btnTabTerror.Font = Enum.Font.Cartoon
            btnTabTerror.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        elseif tab == "avatar" then
            avatarFrame.Visible = true
            cmdFrame.Visible = false
            terrorFrame.Visible = false
            btnTabAvatar.Font = Enum.Font.Cartoon
            btnTabAvatar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            btnTabCmds.Font = Enum.Font.Cartoon
            btnTabCmds.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btnTabTerror.Font = Enum.Font.Cartoon
            btnTabTerror.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        else
            terrorFrame.Visible = true
            cmdFrame.Visible = false
            avatarFrame.Visible = false
            btnTabTerror.Font = Enum.Font.Cartoon
            btnTabTerror.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            btnTabCmds.Font = Enum.Font.Cartoon
            btnTabCmds.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            btnTabAvatar.Font = Enum.Font.Cartoon
            btnTabAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
    btnTabCmds.MouseButton1Click:Connect(function() switchTab("cmds") end)
    btnTabAvatar.MouseButton1Click:Connect(function() switchTab("avatar") end)
    btnTabTerror.MouseButton1Click:Connect(function() switchTab("terror") end)
    local selectedCmdTarget = nil
    local ddCmd = Instance.new("TextButton", cmdFrame)
    ddCmd.Name = "Dropdown"
    ddCmd.Text = "Selecionar jogador"
    ddCmd.Font = Enum.Font.Cartoon
    ddCmd.TextSize = 14
    ddCmd.TextColor3 = Color3.new(1, 1, 1)
    ddCmd.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ddCmd.Size = UDim2.new(1, -20, 0, 30)
    ddCmd.LayoutOrder = 1
    local openCmd = false
    local frameDDCmd = nil
    ddCmd.MouseButton1Click:Connect(function()
        if openCmd and frameDDCmd then
            frameDDCmd:Destroy()
            openCmd = false
            return
        end
        frameDDCmd = Instance.new("ScrollingFrame", cmdFrame)
        frameDDCmd.Position = UDim2.new(0.5, -((cmdFrame.AbsoluteSize.X - 20) / 2), 0, 40)
        frameDDCmd.Size = UDim2.new(1, -20, 0, 120)
        frameDDCmd.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frameDDCmd.BorderSizePixel = 0
        frameDDCmd.ClipsDescendants = true
        frameDDCmd.LayoutOrder = 2
        local lst = Instance.new("UIListLayout", frameDDCmd)
        lst.Padding = UDim.new(0, 2)
        local playersInServer = {}
        for _, p in ipairs(Players:GetPlayers()) do
            table.insert(playersInServer, p.Name)
        end
        table.sort(playersInServer)
        for _, name in ipairs(playersInServer) do
            local b = Instance.new("TextButton", frameDDCmd)
            b.Text = name
            b.Font = Enum.Font.Cartoon
            b.TextSize = 14
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            b.TextColor3 = Color3.new(1, 1, 1)
            b.Size = UDim2.new(1, 0, 0, 25)
            b.MouseButton1Click:Connect(function()
                selectedCmdTarget = name
                ddCmd.Text = "🎯 " .. name
                frameDDCmd:Destroy()
                openCmd = false
            end)
        end
        openCmd = true
    end)
    local cmdContainer = Instance.new("Frame", cmdFrame)
    cmdContainer.BackgroundTransparency = 1
    cmdContainer.Size = UDim2.new(1, -20, 0, 0)
    cmdContainer.AutomaticSize = Enum.AutomaticSize.Y
    cmdContainer.LayoutOrder = 3
    local uiListLayout = Instance.new("UIListLayout", cmdContainer)
    uiListLayout.Padding = UDim.new(0, 6)
    local cmds = { ";verifique", ";kick", ";crash", ";kill", ";killplus", ";bring", ";jail", ";unjail", ";freeze", ";unfreeze", ";adm", ";unadm", ";tag", ";untag", ";tag all", ";untag all", ";float" }
    local needsTarget = { ";kick", ";crash", ";kill", ";killplus", ";bring", ";jail", ";unjail", ";freeze", ";unfreeze", ";adm", ";unadm", ";float" }
    for _, lbl in ipairs(cmds) do
        local b = Instance.new("TextButton", cmdContainer)
        b.Size = UDim2.new(1, 0, 0, 36)
        b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.Cartoon
        b.TextSize = 16
        b.Text = lbl
        b.MouseButton1Click:Connect(function()
            local cmdText = lbl
            local requiresTarget = table.find(needsTarget, lbl)
            if requiresTarget and not selectedCmdTarget then
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] ❌ Selecione um jogador na aba de Comandos!",
                    Color = Color3.fromRGB(255, 100, 100),
                    Font = Enum.Font.GothamBold
                })
                return
            end
            if requiresTarget then
                cmdText = lbl .. " " .. selectedCmdTarget
            end
            pcall(function()
                local channel = TextChatService:WaitForChild("TextChannels"):FindFirstChild("RBXGeneral") or TextChatService:WaitForChild("TextChannels"):GetChildren()[1]
                if channel then
                    channel:SendAsync(cmdText)
                    if cmdText == ";verifique" then
                        StarterGui:SetCore("ChatMakeSystemMessage", {
                            Text = "[Techwear Hub] Comando ;verifique enviado com sucesso!",
                            Color = Color3.fromRGB(0, 255, 0),
                            Font = Enum.Font.GothamBold
                        })
                    end
                else
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = "[Techwear Hub] Erro: Canal de chat não encontrado!",
                        Color = Color3.fromRGB(255, 100, 100),
                        Font = Enum.Font.GothamBold
                    })
                end
            end)
        end)
    end
    local chatAsLabel = Instance.new("TextLabel", cmdContainer)
    chatAsLabel.Size = UDim2.new(1, 0, 0, 20)
    chatAsLabel.BackgroundTransparency = 1
    chatAsLabel.TextColor3 = Color3.new(1, 1, 1)
    chatAsLabel.Font = Enum.Font.GothamBold
    chatAsLabel.Text = "Enviar mensagem como alvo:"
    chatAsLabel.TextXAlignment = Enum.TextXAlignment.Left
    chatAsLabel.TextSize = 14
    local txtChatAs = Instance.new("TextBox", cmdContainer)
    txtChatAs.Size = UDim2.new(1, 0, 0, 36)
    txtChatAs.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    txtChatAs.TextColor3 = Color3.new(1, 1, 1)
    txtChatAs.Font = Enum.Font.Cartoon
    txtChatAs.TextSize = 14
    txtChatAs.PlaceholderText = "Digite a mensagem aqui..."
    local btnChatAs = Instance.new("TextButton", cmdContainer)
    btnChatAs.Size = UDim2.new(1, 0, 0, 36)
    btnChatAs.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btnChatAs.TextColor3 = Color3.new(1, 1, 1)
    btnChatAs.Font = Enum.Font.Cartoon
    btnChatAs.TextSize = 16
    btnChatAs.Text = ";ch (Enviar)"
    btnChatAs.MouseButton1Click:Connect(function()
        local msgToSend = txtChatAs.Text
        if not selectedCmdTarget then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Selecione um jogador alvo primeiro!",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
            return
        end
        if msgToSend == "" then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Digite uma mensagem para enviar!",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
            return
        end
        local cmdText = ";ch " .. selectedCmdTarget .. " " .. msgToSend
        pcall(function()
            local channel = TextChatService:WaitForChild("TextChannels"):FindFirstChild("RBXGeneral") or TextChatService:WaitForChild("TextChannels"):GetChildren()[1]
            if channel then
                channel:SendAsync(cmdText)
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] Mensagem enviada como " .. selectedCmdTarget,
                    Color = Color3.fromRGB(0, 255, 0),
                    Font = Enum.Font.GothamBold
                })
                txtChatAs.Text = ""
            else
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] Erro: Canal de chat não encontrado!",
                    Color = Color3.fromRGB(255, 100, 100),
                    Font = Enum.Font.GothamBold
                })
            end
        end)
    end)
    local selectedCopier, selectedAvatarTarget = nil, nil
    local labelCopier = Instance.new("TextLabel", avatarFrame)
    labelCopier.Text = "Quem vai copiar (Copiador):"
    labelCopier.Font = Enum.Font.Cartoon
    labelCopier.TextColor3 = Color3.new(1, 1, 1)
    labelCopier.BackgroundTransparency = 1
    labelCopier.Size = UDim2.new(1, -20, 0, 20)
    labelCopier.TextXAlignment = Enum.TextXAlignment.Left
    labelCopier.LayoutOrder = 1
    local ddCopier = Instance.new("TextButton", avatarFrame)
    ddCopier.Name = "DropdownCopier"
    ddCopier.Text = " Selecione o copiador"
    ddCopier.Font = Enum.Font.Cartoon
    ddCopier.TextSize = 14
    ddCopier.TextColor3 = Color3.new(1, 1, 1)
    ddCopier.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ddCopier.Size = UDim2.new(1, -20, 0, 30)
    ddCopier.LayoutOrder = 2
    local openCopier, frameDDCopier = false, nil
    ddCopier.MouseButton1Click:Connect(function()
        if openCopier and frameDDCopier then
            frameDDCopier:Destroy()
            openCopier = false
            return
        end
        frameDDCopier = Instance.new("ScrollingFrame", avatarFrame)
        frameDDCopier.Position = UDim2.new(0.5, -((avatarFrame.AbsoluteSize.X - 20) / 2), 0, 90)
        frameDDCopier.Size = UDim2.new(1, -20, 0, 120)
        frameDDCopier.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frameDDCopier.BorderSizePixel = 0
        frameDDCopier.ClipsDescendants = true
        frameDDCopier.LayoutOrder = 3
        local lst = Instance.new("UIListLayout", frameDDCopier)
        lst.Padding = UDim.new(0, 2)
        local playersInServer = {}
        for _, p in ipairs(Players:GetPlayers()) do
            table.insert(playersInServer, p.Name)
        end
        table.sort(playersInServer)
        for _, name in ipairs(playersInServer) do
            local b = Instance.new("TextButton", frameDDCopier)
            b.Text = name
            b.Font = Enum.Font.Cartoon
            b.TextSize = 14
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            b.TextColor3 = Color3.new(1, 1, 1)
            b.Size = UDim2.new(1, 0, 0, 25)
            b.MouseButton1Click:Connect(function()
                selectedCopier = name
                ddCopier.Text = "👤 " .. name
                frameDDCopier:Destroy()
                openCopier = false
            end)
        end
        openCopier = true
    end)
    local labelTarget = Instance.new("TextLabel", avatarFrame)
    labelTarget.Text = "Copiar avatar de (Alvo):"
    labelTarget.Font = Enum.Font.Cartoon
    labelTarget.TextColor3 = Color3.new(1, 1, 1)
    labelTarget.BackgroundTransparency = 1
    labelTarget.Size = UDim2.new(1, -20, 0, 20)
    labelTarget.TextXAlignment = Enum.TextXAlignment.Left
    labelTarget.LayoutOrder = 4
    local ddAvatarTarget = Instance.new("TextButton", avatarFrame)
    ddAvatarTarget.Name = "DropdownTarget"
    ddAvatarTarget.Text = " Selecione o alvo"
    ddAvatarTarget.Font = Enum.Font.Cartoon
    ddAvatarTarget.TextSize = 14
    ddAvatarTarget.TextColor3 = Color3.new(1, 1, 1)
    ddAvatarTarget.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ddAvatarTarget.Size = UDim2.new(1, -20, 0, 30)
    ddAvatarTarget.LayoutOrder = 5
    local openAvatarTarget, frameDDAvatarTarget = false, nil
    ddAvatarTarget.MouseButton1Click:Connect(function()
        if openAvatarTarget and frameDDAvatarTarget then
            frameDDAvatarTarget:Destroy()
            openAvatarTarget = false
            return
        end
        frameDDAvatarTarget = Instance.new("ScrollingFrame", avatarFrame)
        frameDDAvatarTarget.Position = UDim2.new(0.5, -((avatarFrame.AbsoluteSize.X - 20) / 2), 0, 180)
        frameDDAvatarTarget.Size = UDim2.new(1, -20, 0, 120)
        frameDDAvatarTarget.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frameDDAvatarTarget.BorderSizePixel = 0
        frameDDAvatarTarget.ClipsDescendants = true
        frameDDAvatarTarget.LayoutOrder = 6
        local lst = Instance.new("UIListLayout", frameDDAvatarTarget)
        lst.Padding = UDim.new(0, 2)
        local playersInServer = {}
        for _, p in ipairs(Players:GetPlayers()) do
            table.insert(playersInServer, p.Name)
        end
        table.sort(playersInServer)
        for _, name in ipairs(playersInServer) do
            local b = Instance.new("TextButton", frameDDAvatarTarget)
            b.Text = name
            b.Font = Enum.Font.Cartoon
            b.TextSize = 14
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            b.TextColor3 = Color3.new(1, 1, 1)
            b.Size = UDim2.new(1, 0, 0, 25)
            b.MouseButton1Click:Connect(function()
                selectedAvatarTarget = name
                ddAvatarTarget.Text = "🎯 " .. name
                frameDDAvatarTarget:Destroy()
                openAvatarTarget = false
            end)
        end
        openAvatarTarget = true
    end)
    local btnCopyAvatar = Instance.new("TextButton", avatarFrame)
    btnCopyAvatar.Size = UDim2.new(1, -20, 0, 36)
    btnCopyAvatar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btnCopyAvatar.TextColor3 = Color3.new(1, 1, 1)
    btnCopyAvatar.Font = Enum.Font.Cartoon
    btnCopyAvatar.TextSize = 16
    btnCopyAvatar.Text = "Copiar Avatar"
    btnCopyAvatar.LayoutOrder = 7
    btnCopyAvatar.MouseButton1Click:Connect(function()
        if not selectedCopier or not selectedAvatarTarget then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Selecione o Copiador e o Alvo na aba Avatar!",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.Cartoon
            })
            return
        end
        local cmdText = ";copy " .. selectedAvatarTarget .. " " .. selectedCopier
        pcall(function()
            local channel = TextChatService:WaitForChild("TextChannels"):FindFirstChild("RBXGeneral") or TextChatService:WaitForChild("TextChannels"):GetChildren()[1]
            if channel then
                channel:SendAsync(cmdText)
            end
        end)
    end)
    local selectedJumpscareTarget = nil
    local ddJumpscare = Instance.new("TextButton", terrorFrame)
    ddJumpscare.Name = "DropdownJumpscare"
    ddJumpscare.Text = "Selecionar jogador"
    ddJumpscare.Font = Enum.Font.Cartoon
    ddJumpscare.TextSize = 14
    ddJumpscare.TextColor3 = Color3.new(1, 1, 1)
    ddJumpscare.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ddJumpscare.Size = UDim2.new(1, -20, 0, 30)
    ddJumpscare.LayoutOrder = 1
    local openJumpscare = false
    local frameDDJumpscare = nil
    ddJumpscare.MouseButton1Click:Connect(function()
        if openJumpscare and frameDDJumpscare then
            frameDDJumpscare:Destroy()
            openJumpscare = false
            return
        end
        frameDDJumpscare = Instance.new("ScrollingFrame", terrorFrame)
        frameDDJumpscare.Position = UDim2.new(0.5, -((terrorFrame.AbsoluteSize.X - 20) / 2), 0, 40)
        frameDDJumpscare.Size = UDim2.new(1, -20, 0, 120)
        frameDDJumpscare.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frameDDJumpscare.BorderSizePixel = 0
        frameDDJumpscare.ClipsDescendants = true
        frameDDJumpscare.LayoutOrder = 2
        local lst = Instance.new("UIListLayout", frameDDJumpscare)
        lst.Padding = UDim.new(0, 2)
        local playersInServer = {}
        for _, p in ipairs(Players:GetPlayers()) do
            table.insert(playersInServer, p.Name)
        end
        table.sort(playersInServer)
        for _, name in ipairs(playersInServer) do
            local b = Instance.new("TextButton", frameDDJumpscare)
            b.Text = name
            b.Font = Enum.Font.Cartoon
            b.TextSize = 14
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            b.TextColor3 = Color3.new(1, 1, 1)
            b.Size = UDim2.new(1, 0, 0, 25)
            b.MouseButton1Click:Connect(function()
                selectedJumpscareTarget = name
                ddJumpscare.Text = "🎯 " .. name
                frameDDJumpscare:Destroy()
                openJumpscare = false
            end)
        end
        openJumpscare = true
    end)
    for _, jumpscare in ipairs(JUMPSCARES) do
        local b = Instance.new("TextButton", terrorFrame)
        b.Size = UDim2.new(1, -20, 0, 36)
        b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.Cartoon
        b.TextSize = 16
        b.Text = jumpscare.Name
        b.LayoutOrder = 3
        b.MouseButton1Click:Connect(function()
            if not selectedJumpscareTarget then
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] ❌ Selecione um jogador na aba Terror!",
                    Color = Color3.fromRGB(255, 100, 100),
                    Font = Enum.Font.Cartoon
                })
                return
            end
            local cmdText = jumpscare.Name .. " " .. selectedJumpscareTarget
            pcall(function()
                local channel = TextChatService:WaitForChild("TextChannels"):FindFirstChild("RBXGeneral") or TextChatService:WaitForChild("TextChannels"):GetChildren()[1]
                if channel then
                    channel:SendAsync(cmdText)
                end
            end)
        end)
    end
end
local function DestroyAdminUI()
    local ui = CoreGui:FindFirstChild("TechAdminUI")
    if ui and ui.Parent then ui:Destroy() end
end

-- Função para Executar Cópia de Avatar
local function ExecuteAvatarCopy(targetPlayerName, copierPlayerName)
    if not IsAutorizado(LocalPlayer.Name) or copierPlayerName:lower() ~= LocalPlayer.Name:lower() then return false end
    local targetPlayer = Players:FindFirstChild(targetPlayerName)
    local copierPlayer = LocalPlayer
    if not (targetPlayer and copierPlayer and copierPlayer.Character and targetPlayer.Character) then
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Não foi possível encontrar os jogadores para copiar o avatar.",
            Color = Color3.fromRGB(255, 100, 100),
            Font = Enum.Font.Cartoon
        })
        return false
    end
    local success = pcall(function()
        local copierHumanoid = copierPlayer.Character:WaitForChild("Humanoid")
        local targetHumanoid = targetPlayer.Character:WaitForChild("Humanoid")
        local copierDesc = copierHumanoid:GetAppliedDescription()
        for _, acc in ipairs(copierDesc:GetAccessories(true)) do
            if acc.AssetId and tonumber(acc.AssetId) then
                Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                task.wait(0.2)
            end
        end
        if tonumber(copierDesc.Shirt) then
            Remotes.Wear:InvokeServer(tonumber(copierDesc.Shirt))
            task.wait(0.2)
        end
        if tonumber(copierDesc.Pants) then
            Remotes.Wear:InvokeServer(tonumber(copierDesc.Pants))
            task.wait(0.2)
        end
        if tonumber(copierDesc.Face) then
            Remotes.Wear:InvokeServer(tonumber(copierDesc.Face))
            task.wait(0.2)
        end
        local targetDesc = targetHumanoid:GetAppliedDescription()
        local argsBody = { [1] = { [1] = targetDesc.Torso, [2] = targetDesc.RightArm, [3] = targetDesc.LeftArm, [4] = targetDesc.RightLeg, [5] = targetDesc.LeftLeg, [6] = targetDesc.Head } }
        Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
        task.wait(0.5)
        if tonumber(targetDesc.Shirt) then
            Remotes.Wear:InvokeServer(tonumber(targetDesc.Shirt))
            task.wait(0.3)
        end
        if tonumber(targetDesc.Pants) then
            Remotes.Wear:InvokeServer(tonumber(targetDesc.Pants))
            task.wait(0.3)
        end
        if tonumber(targetDesc.Face) then
            Remotes.Wear:InvokeServer(tonumber(targetDesc.Face))
            task.wait(0.3)
        end
        for _, v in ipairs(targetDesc:GetAccessories(true)) do
            if v.AssetId and tonumber(v.AssetId) then
                Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                task.wait(0.3)
            end
        end
        local targetSkinColor = targetPlayer.Character:FindFirstChild("Body Colors")
        if targetSkinColor then
            Remotes.ChangeBodyColor:FireServer(tostring(targetSkinColor.HeadColor))
            task.wait(0.3)
        end
        if tonumber(targetDesc.IdleAnimation) then
            Remotes.Wear:InvokeServer(tonumber(targetDesc.IdleAnimation))
            task.wait(0.3)
        end
        local targetBag = targetPlayer:FindFirstChild("PlayersBag")
        if targetBag then
            if targetBag:FindFirstChild("RPName") and targetBag.RPName.Value ~= "" then
                Remotes.RPNameText:FireServer("RolePlayName", targetBag.RPName.Value)
                task.wait(0.3)
            end
            if targetBag:FindFirstChild("RPBio") and targetBag.RPBio.Value ~= "" then
                Remotes.RPNameText:FireServer("RolePlayBio", targetBag.RPBio.Value)
                task.wait(0.3)
            end
            if targetBag:FindFirstChild("RPNameColor") then
                Remotes.RPNameColor:FireServer("PickingRPNameColor", targetBag.RPNameColor.Value)
                task.wait(0.3)
            end
            if targetBag:FindFirstChild("RPBioColor") then
                Remotes.RPNameColor:FireServer("PickingRPBioColor", targetBag.RPBioColor.Value)
                task.wait(0.3)
            end
        end
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Avatar copiado com sucesso!",
            Color = Color3.fromRGB(255, 105, 180),
            Font = Enum.Font.GothamBold
        })
        return true
    end)
    return success
end
-- Função para Encontrar Jogador por Nome Parcial
local function findPlayerByPartialName(partialName)
    if not partialName or partialName == "" then return nil end
    local lowerPartialName = partialName:lower():gsub("%s+", "")
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(lowerPartialName, 1, true) or p.DisplayName:lower():find(lowerPartialName, 1, true) then
            return p
        end
    end
    return nil
end
-- Manipulador de Chat
local function analisarChatDe(chatter, message)
    local msg = message:lower():gsub("%s+", " ")
    local args = {}
    for word in msg:gmatch("%S+") do
        table.insert(args, word)
    end
    -- Verificar ;verifique
    if msg == ";verifique" then
        if not IsAutorizado(chatter.Name) then
            if chatter == LocalPlayer then
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] ❌ Você não tem permissão para usar ;verifique.",
                    Color = Color3.fromRGB(255, 100, 100),
                    Font = Enum.Font.GothamBold
                })
            end
            return
        end
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Comando ;verifique detectado de " .. chatter.Name,
            Color = Color3.fromRGB(0, 255, 0),
            Font = Enum.Font.GothamBold
        })
        if not IsAutorizado(LocalPlayer.Name) then
            task.delay(math.random(0.1, 0.8), function()
                pcall(function()
                    local channel = TextChatService:WaitForChild("TextChannels"):FindFirstChild("RBXGeneral") or TextChatService:WaitForChild("TextChannels"):GetChildren()[1]
                    if channel then
                        channel:SendAsync("Techwear_####")
                        StarterGui:SetCore("ChatMakeSystemMessage", {
                            Text = "[Techwear Hub] " .. LocalPlayer.Name .. " respondeu com Techwear_####",
                            Color = Color3.fromRGB(0, 255, 0),
                            Font = Enum.Font.GothamBold
                        })
                    end
                end)
            end)
        end
        return
    end
    -- Detectar Techwear_####
    if msg == "Techwear_####" then
        TECHWEAR_USERS[chatter.Name] = true
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] " .. chatter.Name .. " identificado como Usuário Techwear",
            Color = Color3.fromRGB(255, 105, 180),
            Font = Enum.Font.GothamBold
        })
        return
    end
    -- Restringir outros comandos a autorizados
    if not IsAutorizado(chatter.Name) then
        if chatter == LocalPlayer then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Você não tem permissão para usar este comando.",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
        end
        return
    end
    -- Manipular ;ch
    if args[1] == ";ch" and #args >= 3 then
        local targetPartialName = args[2]
        local messageToSend = table.concat(args, " ", 3)
        local targetPlayer = findPlayerByPartialName(targetPartialName)
        if targetPlayer and targetPlayer == LocalPlayer and messageToSend ~= "" then
            pcall(function()
                local channel = TextChatService:WaitForChild("TextChannels"):FindFirstChild("RBXGeneral") or TextChatService:WaitForChild("TextChannels"):GetChildren()[1]
                if channel then
                    channel:SendAsync(messageToSend)
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = "[Techwear Hub] Mensagem enviada como " .. targetPlayer.Name,
                        Color = Color3.fromRGB(0, 255, 0),
                        Font = Enum.Font.GothamBold
                    })
                end
            end)
        elseif chatter == LocalPlayer then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Jogador alvo não encontrado ou mensagem inválida.",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
        end
        return
    end
    -- Manipular ;copy
    if args[1] == ";copy" and #args == 3 then
        local partialTarget = args[2]
        local partialCopier = args[3]
        local targetPlayer = findPlayerByPartialName(partialTarget)
        local copierPlayer = findPlayerByPartialName(partialCopier)
        if targetPlayer and copierPlayer then
            if ExecuteAvatarCopy(targetPlayer.Name, copierPlayer.Name) and chatter == LocalPlayer then
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] Avatar copiado de " .. targetPlayer.Name .. " para " .. copierPlayer.Name,
                    Color = Color3.fromRGB(0, 255, 0),
                    Font = Enum.Font.GothamBold
                })
            end
        elseif chatter == LocalPlayer then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Jogador alvo ou copiador não encontrado.",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
        end
        return
    end
    -- Manipular jumpscares
    for _, jumpscare in ipairs(JUMPSCARES) do
        if args[1] == jumpscare.Name and #args == 2 then
            local targetPlayer = findPlayerByPartialName(args[2])
            if targetPlayer then
                if TriggerJumpscare(targetPlayer, jumpscare) and chatter == LocalPlayer then
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = "[Techwear Hub] " .. jumpscare.Name .. " acionado em " .. targetPlayer.Name,
                        Color = Color3.fromRGB(0, 255, 0),
                        Font = Enum.Font.GothamBold
                    })
                end
            elseif chatter == LocalPlayer then
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] ❌ Jogador alvo não encontrado.",
                    Color = Color3.fromRGB(255, 100, 100),
                    Font = Enum.Font.GothamBold
                })
            end
            return
        end
    end
    -- Manipular outros comandos
    local targetCommands = { ";kick", ";crash", ";kill", ";killplus", ";bring", ";jail", ";unjail", ";freeze", ";unfreeze", ";adm", ";unadm", ";float" }
    if table.find(targetCommands, args[1]) and #args == 2 then
        local targetPlayer = findPlayerByPartialName(args[2])
        if not targetPlayer then
            if chatter == LocalPlayer then
                StarterGui:SetCore("ChatMakeSystemMessage", {
                    Text = "[Techwear Hub] ❌ Jogador alvo não encontrado.",
                    Color = Color3.fromRGB(255, 100, 100),
                    Font = Enum.Font.GothamBold
                })
            end
            return
        end
        local success = false
        if args[1] == ";jail" then
            success = CreateAndManageJail(targetPlayer)
        elseif args[1] == ";unjail" then
            success = RemoveJail(targetPlayer)
        elseif args[1] == ";freeze" then
            success = FreezePlayer(targetPlayer)
        elseif args[1] == ";unfreeze" then
            success = UnfreezePlayer(targetPlayer)
        elseif args[1] == ";adm" and IsDono(chatter.Name) then
            TEMP_MODS[targetPlayer.Name] = true
            success = true
            if targetPlayer == LocalPlayer then
                CreateAdminUI()
                CreateMovableButton()
            end
        elseif args[1] == ";unadm" and IsDono(chatter.Name) then
            TEMP_MODS[targetPlayer.Name] = nil
            success = true
            if targetPlayer == LocalPlayer then
                DestroyAdminUI()
                local btnGui = CoreGui:FindFirstChild("PartMovableButtonGuiPart")
                if btnGui then btnGui:Destroy() end
            end
        elseif args[1] == ";kick" then
            if targetPlayer == LocalPlayer and IsDono(LocalPlayer.Name) and not IsDono(chatter.Name) then
                if chatter == LocalPlayer then
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = "[Techwear Hub] ❌ Você não pode expulsar um dono.",
                        Color = Color3.fromRGB(255, 100, 100),
                        Font = Enum.Font.GothamBold
                    })
                end
                return
            end
            targetPlayer:Kick("Você foi removido pelos seus atos --equipe Techwear")
            success = true
        elseif args[1] == ";kill" then
            if targetPlayer.Character and targetPlayer.Character:FindFirstChildOfClass("Humanoid") then
                targetPlayer.Character.Humanoid.Health = 0
                success = true
            end
        elseif args[1] == ";killplus" then
            success = KillPlus(targetPlayer)
        elseif args[1] == ";bring" then
            if chatter.Character and chatter.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                targetPlayer.Character:SetPrimaryPartCFrame(chatter.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
                success = true
            end
        elseif args[1] == ";crash" then
            if targetPlayer == LocalPlayer then
                while true do
                    Instance.new("Part")
                end
            end
            success = true
        elseif args[1] == ";float" then
            success = FloatPlayer(targetPlayer)
        end
        if chatter == LocalPlayer and success then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] " .. args[1] .. " executado com sucesso em " .. targetPlayerName,
                Color = Color3.fromRGB(0, 255, 0),
                Font = Enum.Font.GothamBold
            })
        elseif chatter == LocalPlayer then
            StarterGui:SetCore("ChatMakeSystemMessage", {
                Text = "[Techwear Hub] ❌ Falha ao executar " .. args[1] .. " em " .. targetPlayer.Name .. ". Verifique se o jogador está no jogo.",
                Color = Color3.fromRGB(255, 100, 100),
                Font = Enum.Font.GothamBold
            })
        end
        return
    end
    -- Comandos de Controle de Tags
    if msg == ";untag all" then
        tagsVisiveis = false
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Todas as tags todas removidas.",
            Color = Color3.fromRGB(0, 255, 0),
            Font = Enum.Font.GothamBold
        })
        return
    end
    if msg == ";tag all" then
        tagsVisiveis = true
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Todas as tags restauradas todas.",
            Color = Color3.fromRGB(30, 255, 0),
            Font = Enum.Font.GothamBold
        })
        return
    end
    if msg == ";untag all" then
        tagsVisiveis = false
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Tags removidas para " .. LocalPlayer.Name,
            Color = Color3.fromRGB(0, 255, 0),
            Font = Enum.Font.GothamBold
        })
        return
    end
    if msg == ";tag" and chatter == LocalPlayer then
        tagsVisiveis = true
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[Techwear Hub] Tags restauradas para " .. LocalPlayer.Name,
            Color = Color3.fromRGB(0, 255, 0),
            Font = Enum.Font.GothamBold
        })
        return
    end
end
-- Conectar eventos de chat
for _, player in ipairs(Players:GetPlayers()) do
    player.Chatted:Connect(function(message)
        analisarChatDe(player, message)
    end)
end
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        analisarChatDe(player, message)
    end)
end)
-- Tags Flutuantes
local tags = {}
local function CriarTag(txt, c1, c2)
    local g = Instance.new("BillboardGui")
    g.Size = UDim2.new(0, 180, 0, 30)
    g.StudsOffset = Vector3.new(0, 2.5, 0)
    g.AlwaysOnTop = true
    local f = Instance.new("Frame", g)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundColor3 = Color3.new(0, 0, 0)
    f.BackgroundTransparency = 0.3
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.Font = Enum.Font.GothamBold
    l.TextScaled = true
    l.TextStrokeTransparency = 0.5
    l.TextColor3 = c1
    coroutine.wrap(function()
        while g.Parent do
            l.TextColor3 = c1
            task.wait(0.5)
            l.TextColor3 = c2
            task.wait(0.5)
        end
    end)()
    return g
end
task.spawn(function()
    while task.wait(1) do
        if not tagsVisiveis then
            for p, tagGui in pairs(tags) do
                if tagGui and tagGui.Parent then
                    tagGui:Destroy()
                end
                tags[p] = nil
            end
            while not tagsVisiveis do
                task.wait(1)
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local head = p.Character.Head
                if root then
                    local d = (root.Position - head.Position).Magnitude
                    if d <= 25 and not tags[p] then
                        local tag
                        if IsDono(p.Name) then
                            tag = CriarTag("Dono Techwear", Color3.fromRGB(255, 0, 0), Color3.fromRGBColor3(255, 60, 60))
                        elseif IsMod(p.Name) or IsTempMod(p.Name) then
                            tag = CriarTag("Moderador Techwear", Color3.fromRGBColor3(0, 191, 255), Color3.fromRGB(255, 105, 180))
                        elseif TECHWEAR_USERS[p.Name] then
                            tag = CriarTag("Usuário Techwear", Color3.new(1, 1, 1), Color3.new(0.78, 0.78, 0.78))
                        end
                        if tag then
                            tag.Adornee = head
                            tag.Parent = p.Character
                            tags[p] = tag
                        end
                    elseif (d > 30 or not p.Parent) and tags[p] then
                        tags[p]:Destroy()
                        tags[p] = nil
                    end
                elseif not p.Parent and tags[p] then
                    tags[p]:Destroy()
                    tags[p] = nil
                end
            end
        end
    end
end)
if IsAutorizado(LocalPlayer.Name) then
    CreateAdminUI()
    CreateMovableButton()
end
 