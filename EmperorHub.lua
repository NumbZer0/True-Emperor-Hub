local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Emperor Hub",
   ToggleUI = false,
   Icon = 11835491319,
   LoadingTitle = "Emperor Hub",
   LoadingSubtitle = "by SoyDevWin",
   Theme = "Serenity",
   ToggleUIKeybind = "K",
   
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "EmperorHub",
      FileName = "Emperor Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "R9Cg8rgrcT",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Emperor Keys",
      Subtitle = "Key System",
      Note = "the keys are: OneEyedGhoul, MichaelKaiser",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"OneEyedGhoul", "oneeyedghoul", "MichaelKaiser", "michaelkaiser"}
   }
})

local HubsTab = Window:CreateTab("Emperor Hub", 11322089611) 
local OthersTab = Window:CreateTab("Outros", 7059346373) 
local InfoTab = Window:CreateTab("Informações", 11745872910) 

local BlueLockSection = HubsTab:CreateSection("Emperor Hub's")
local BlueLockButton = HubsTab:CreateButton({
   Name = "Blue Lock: Rivals (Reworked)",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/NumbZer0/Blue-Lock-Rivals-Released-/refs/heads/main/EmperorHub.lua'))()
      Rayfield:Notify({
         Title = "Script Carregado!",
         Content = "Blue Lock: Rivals v2 foi carregado com sucesso!",
         Duration = 6.5,
         Image = 6723921202,
         Actions = {
            Ignore = {
               Name = "Ok",
               Callback = function()
               end
            },
         },
      })
   end,
})

local BlueLockButton = HubsTab:CreateButton({
   Name = "Blue Lock: Rivals (Old Version)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/NumbZer0/KaiserHub/refs/heads/main/KaiserHub.lua"))()
      Rayfield:Notify({
         Title = "Script Carregado!",
         Content = "Blue Lock: Rivals v1 foi carregado com sucesso!",
         Duration = 6.5,
         Image = 6723921202,
         Actions = {
            Ignore = {
               Name = "Ok",
               Callback = function()
               end
            },
         },
      })
   end,
})

local StrongestLegends = HubsTab:CreateButton({
   Name = "Strongest Legends (New)",
   Callback = function()
      local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Emperor Hub | Strongest Legends",
   ToggleUI = false,
   Icon = 78025264866522,
   LoadingTitle = "Emperor Hub | Strongest Legends",
   LoadingSubtitle = "by SoyDevWin",
   Theme = "Serenity",
   ToggleUIKeybind = "K",
   
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "EmperorHub",
      FileName = "Emperor Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "R9Cg8rgrcT",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Emperor Keys",
      Subtitle = "Key System",
      Note = "the keys are: OneEyedGhoul, MichaelKaiser",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"OneEyedGhoul", "oneeyedghoul", "MichaelKaiser", "michaelkaiser"}
   }
})

local rebirthEnabled = false
local rebirthConnection = nil
local opTrainingEnabled = false
local opTrainingConnection = nil
local opTrainingWaitTime = 2

local function equipMachine()
    local args = {
        "s.actions.equip",
        {
            "OverheadMatPress",
            {
                name = "2"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function doTraining()
    local args = {
        "s.overhead_mat_press.click8588010415",
        {
            true
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
end

local function doBlatantTraining()
    local args = {
        "s.running_track.add6",
        {}
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function finishBlatantTraining()
    local args = {
        "s.running_track.finishRunningTracksFinish",
        {}
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
end

local function doRebirth()
    local args = {
        "s.evolve.request",
        {}
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Library"):WaitForChild("Network"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
end

local function startAutoRebirth()
    rebirthConnection = game:GetService('RunService').Heartbeat:Connect(function()
        doRebirth()
        wait(5)
    end)
end

local function startOPTraining()
    equipMachine()
    opTrainingConnection = game:GetService('RunService').Heartbeat:Connect(function()
        for i = 1, 10 do
            doBlatantTraining()
            wait(0.1)
        end
        
        finishBlatantTraining()
        wait(opTrainingWaitTime)
        doTraining()
    end)
end

local Main = Window:CreateTab("Main", 77343904883003)

Main:CreateParagraph({
   Title = "SoyDevWin:",
   Content = "a função de treino automático causa lag massivo em dispositivos fracos."
})

Main:CreateSection(":3")

Main:CreateToggle({
    Name = "Treino Automático (OP)",
    CurrentValue = false,
    Callback = function(Value)
        opTrainingEnabled = Value
        if opTrainingEnabled then
            startOPTraining()
            Rayfield:Notify({
                Title = "W",
                Content = "ON",
                Duration = 3,
               Image = 77414404556243
            })
        else
            if opTrainingConnection then
                opTrainingConnection:Disconnect()
                opTrainingConnection = nil
            end
        end
    end
})

Main:CreateSlider({
    Name = "Velocidade da execução",
    Range = {0.5, 10},
    Increment = 0.5,
    Suffix = "s",
    CurrentValue = 2,
    Callback = function(Value)
        opTrainingWaitTime = Value
    end
})

Main:CreateSection(":3")

Main:CreateToggle({
    Name = "Renascimento Automático.",
    CurrentValue = false,
    Callback = function(Value)
        rebirthEnabled = Value
        if rebirthEnabled then
            startAutoRebirth()
            Rayfield:Notify({
                Title = "W",
                Content = "ON",
                Duration = 3,
               Image = 18367579959
            })
        else
            if rebirthConnection then
                rebirthConnection:Disconnect()
                rebirthConnection = nil
            end
        end
    end
})

Main:CreateSection(".")

Main:CreateParagraph({
   Title = "UwU",
   Content = "script 100% em pr-br."
})

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = game:GetService("Players").LocalPlayer

local function CreateToggleButton()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ToggleFluentUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = Player:WaitForChild("PlayerGui")

    local btn = Instance.new("ImageButton")
    btn.Name = "ZToggle"
    btn.Size = UDim2.new(0, 40, 0, 40)
    btn.Position = UDim2.new(1, -40, 0.5, 70)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Image = "rbxassetid://110103893163146"
    btn.ScaleType = Enum.ScaleType.Fit
    btn.AutoButtonColor = true
    btn.ZIndex = 999
    btn.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 40)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.K, false, game)
        task.wait(0.1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.K, false, game)
    end)

    local dragging, dragStart, startPos = false

    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = btn.Position
        end
    end) 

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging then
            local delta = UIS:GetMouseLocation() - dragStart
            btn.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + math.floor(delta.X * 0.4),
                startPos.Y.Scale,
                startPos.Y.Offset + math.floor(delta.Y * 0.4)
            )
        end
    end)
end

CreateToggleButton()
Rayfield:LoadConfiguration()
      Rayfield:Notify({
         Title = "Script Carregado!",
         Content = "Muscle Legends foi carregado com sucesso!",
         Duration = 6.5,
         Image = 6723921202,
         Actions = {
            Ignore = {
               Name = "Ok",
               Callback = function()
               end
            },
         },
      })
   end,
})

local InfoSection = InfoTab:CreateSection("Sobre")
local CreatorLabel = InfoTab:CreateLabel("Criado por SoyDevWin")
local VersionLabel = InfoTab:CreateLabel("Versão: 1.0.0")

local ParagraphCreator = OthersTab:CreateParagraph({
   Title = "SoyDevWin:",
   Content = "outros hub's serão adicionados em breve, fiquem no aguardo kkk."
})

Rayfield:Notify({
   Title = "Emperor Hub Carregado!",
   Content = "Bem-vindo ao Emperor Hub!",
   Duration = 6.5,
   Image = 6723921202,
   Actions = {
      Ignore = {
         Name = "Obrigado pela escolha!",
         Callback = function()
         end
      },
   },
})
