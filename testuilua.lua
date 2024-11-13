-- // Services
local CoreGui = game:GetService('CoreGui')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local TextService = game:GetService('TextService')
local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')

-- // Variables
local LocalPlayer = Players.LocalPlayer
local UIName = 'HOODSENSE'
local Amount = 0
local TabCount = 0
local ConfigF
local BreakAllLoops = false
local ChangeTheme = false
local Utility = {}
local Library = {}
local Config = {}
local ConfigUpdates = {}
local Themes = {
    ['Default'] = {
        BackgroundColor = Color3.fromRGB(17, 17, 17),
        SidebarColor = Color3.fromRGB(11, 11, 11),
        BorderColor = Color3.fromRGB(41, 43, 45),
        AccentColor = Color3.fromRGB(0, 125, 255),
        SecondaryColor = Color3.fromRGB(23, 23, 23),
        TertiaryColor = Color3.fromRGB(31, 31, 31),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(105, 105, 105)

    }
}

-- // Utility Functions
do
    function Utility:Tween(Instance, Properties, Duration, ...)
        local TweenInfo = TweenInfo.new(Duration, ...)
        TweenService:Create(Instance, TweenInfo, Properties):Play()
    end

    function Utility:DestroyUI()
        ChangeTheme = true
        BreakAllLoops = true

        for _, UI in next, CoreGui:GetChildren() do
            if UI.Name:find(UIName) == 1 then
                UI:Destroy()
            end
        end
    end

    function Utility:Darken(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V - 0.07, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:Lighten(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V + 0.07, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:Lighten2(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V + 0.5, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:SplitColor(Color)
        local R, G, B = math.floor(Color.R * 255), math.floor(Color.G * 255), math.floor(Color.B * 255)
        return {R, G, B}
    end

    function Utility:JoinColor(Table)
        local R, G, B = Table[1], Table[2], Table[3]
        return Color3.fromRGB(R, G, B)
    end

    function Utility:ToggleUI()
        if CoreGui:FindFirstChild(UIName) ~= nil then
            CoreGui:FindFirstChild(UIName).Enabled = not CoreGui:FindFirstChild(UIName).Enabled
        end
    end

    function Utility:EnableDragging(Frame)
        local Dragging, DraggingInput, DragStart, StartPosition
        
        local function Update(Input)
            local Delta = Input.Position - DragStart
            Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        end
        
        Frame.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                DragStart = Input.Position
                StartPosition = Frame.Position
        
                Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
        
        Frame.InputChanged:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                DraggingInput = Input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(Input)
            if Input == DraggingInput and Dragging then
                Update(Input)
            end
        end)
    end

    function Utility:Create(_Instance, Properties, Children)
        local Object = Instance.new(_Instance)
        local Properties = Properties or {}
        local Children = Children or {}
        
        for Index, Property in next, Properties do
            Object[Index] = Property
        end

        for _, Child in next, Children do
            Child.Parent = Object
        end

        return Object
    end

    function Utility:Error(Type, Message)
        local Type = Type:lower()
        local Base = '[HOODSENSE]'

        if Type == 'warn' then
            warn(Base .. ' WARNING:', Message)

        elseif Type == 'error' then
            error(Base .. ' ERROR:' .. ' ' .. Message, 1)

        else
            return
        end
    end
end

-- Library Functions
do 
    Utility:DestroyUI()
end

function Library:DestroyUI()
    Utility:DestroyUI()
end

function Library:ToggleUI()
    Utility:ToggleUI()
end

function Library:SaveConfig(Name)
    if Name ~= '' then
        if isfolder(ConfigF) then
            if isfile(ConfigF..'/'..Name..'.json') then
                Library:CreatePrompt('TwoButton', 'Overwrite Config', 'A config already exists with this name, are you sure you want to overwrite it?', {
                    'Yes',
                    function()
                        local Json = HttpService:JSONEncode(Config)
                        local File = writefile(ConfigF..'/'..Name..'.json', Json)
                        Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
                    end,
                    'No',
                    function()
                        Library:CreateNotification('Config Not Saved', 'Config was not saved.', 5)
                    end
                })
            else
                local Json = HttpService:JSONEncode(Config)
                local File = writefile(ConfigF..'/'..Name..'.json', Json)
                Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
            end
        else
            makefolder(ConfigF)
            if isfile(ConfigF..'/'..Name..'.json') then
                Library:CreatePrompt('TwoButton', 'Overwrite Config', 'A config already exists with this name, are you sure you want to overwrite it?', {
                    'Yes',
                    function()
                        local Json = HttpService:JSONEncode(Config)
                        local File = writefile(ConfigF..'/'..Name..'.json', Json)
                        Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
                    end,
                    'No',
                    function()
                        Library:CreateNotification('Config Not Saved', 'Config was not saved.', 5)
                    end
                })
            else
                local Json = HttpService:JSONEncode(Config)
                local File = writefile(ConfigF..'/'..Name..'.json', Json)
                Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
            end
        end
    else
        Library:CreateNotification('Config Not Saved', 'Please enter a name for the config.', 5)
    end
end

function Library:LoadConfig(Name)
    if isfile(ConfigF..'/'..Name..'.json') then
        Library:CreatePrompt('TwoButton', 'Load Config', 'Are you sure you want to load this config?', {
            'Yes',
            function()
                local Config = readfile(ConfigF..'/'..Name..'.json')
                local Table = HttpService:JSONDecode(Config)
                for Index, Value in next, Table do
                    if Index == 'Theme_4z3s4QrUhfqt703FmiAe' then
                        local DecodedTheme = HttpService:JSONDecode(Value)
                        local UpdatedTable = {}
                        for NewIndex, NewValue in next, DecodedTheme do
                            UpdatedTable[NewIndex] = Color3.fromRGB(NewValue[1], NewValue[2], NewValue[3])
                        end
                        Library:ChangeTheme(UpdatedTable)
                    elseif type(Value) == 'table' then
                        local New = Color3.fromRGB(Value[1] * 255, Value[2] * 255, Value[3] * 255)
                        ConfigUpdates[Index]:Set(New)
                    else
                        ConfigUpdates[Index]:Set(Value)
                    end
                end
                Library:CreateNotification('Config Loaded', 'Successfully loaded your config with the name, \''..Name..'.json'..'\'.', 5)
            end,
            'No',
            function()
                Library:CreateNotification('Config Not Loaded', 'Config was not loaded.', 5)
            end
        })
    else
        Library:CreateNotification('Config Not Loaded', 'Config doesn\'t exist.', 5)
    end
end

function Library:DeleteConfig(Name)
    if isfile(ConfigF..'/'..Name..'.json') then
        Library:CreatePrompt('TwoButton', 'Delete Config', 'Are you sure that you want to delete this config?', {
            'Yes',
            function()
                local Json = HttpService:JSONEncode(Config)
                local File = delfile(ConfigF..'/'..Name..'.json')
                Library:CreateNotification('Deleted Config', 'Successfully deleted config with the name, \''..Name..'.json'..'\'.', 5)
            end,
            'No',
            function()
                Library:CreateNotification('Config Not Deleted', 'Config was not deleted.', 5)
            end
        })
    end
end

function Library:GetConfigs()
    if isfolder(ConfigF) then
        local Configs = listfiles(ConfigF)
        local Table = {}
        for Index, Value in next, Configs do
            local New = Value:gsub(ConfigF..'\\', ''):gsub('.json', '')
            table.insert(Table, tostring(New))
        end
        return Table
    end
end 

function Library:CreateWindow(Name, ConfigFolder, Theme)
    local HasCustom = false
    local Name = Name or 'cal'
    local ConfigFolder = ConfigFolder or 'Cal'

    UIName = UIName .. Name
    
    if not Theme then
        Theme = Themes['Default']

    elseif type(Theme) == 'table' then
        Theme = Theme
        Themes['Custom'] = Theme
        HasCustom = true

    elseif type(Theme) == 'string' then
        Theme = Theme:lower()
        if Theme == 'default' then
            Theme = Themes['Default']
        end
    end

    local NewTable = {}

    for Index, Value in next, Theme do

        NewTable[Index] = Utility:SplitColor(Value)
    end

    if isfile('UILibraryCurrentTheme.json') then
        delfile('UILibraryCurrentTheme.json')
    end

    ConfigF = ConfigFolder

    writefile('UILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))

    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)

    local Container = Utility:Create('ScreenGui', {
        Name = UIName,
        Parent = CoreGui,
        ResetOnSpawn = false
    }, {
        Utility:Create('Frame', {
            Name = 'Main',
            BackgroundColor3 = Theme.BackgroundColor,
            BorderSizePixel = 6,
            BorderColor3 = Theme.BorderColor,
            BackgroundTransparency = 0,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.new(0, 750, 0, 650)
        }, {
            Utility:Create('ImageLabel', {
                Name = 'ColourBar',
                BackgroundColor3 = Theme.AccentColor,
                BorderSizePixel = 0,
                ImageColor3 = Theme.AccentColor,
                BorderColor3 = Theme.BorderColor,
                BackgroundTransparency = 0,
                Position = UDim2.new(0, 0, 0, 0),
                ZIndex = 1000000,
                Size = UDim2.new(0, 750 , 0, 1)
            })
        })
    })

    Utility:Create('Frame', {
        Name = 'Sidebar',
        Parent = Container.Main,
        BackgroundColor3 = Theme.SidebarColor,
        BorderSizePixel = 1,
        ZIndex = 1,
        BorderColor3 = Theme.BorderColor,
        BackgroundTransparency = 0,
        Position = UDim2.new(0, 0, 0, 1),
        Size = UDim2.new(0, 75 , 0, 649)
    }, {
        Utility:Create('ScrollingFrame', {
            Name = 'TabButtonHolder',
            Active = true,
            BackgroundColor3 = Theme.SidebarColorColor,
            BackgroundTransparency = 1,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            BorderSizePixel = 0,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Position = UDim2.new(0, 0, 0, 15),
            CanvasSize = UDim2.new(0, 75, 0, 635),
            Size = UDim2.new(0, 75, 0, 635),
            ScrollBarThickness = 1,
            ScrollBarImageColor3 = Theme.BorderColor
        }, {
            Utility:Create('Frame', {
                Name = 'Filler',
                BackgroundColor3 = Theme.BackgroundColor,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 6,
                Position = UDim2.new(0, 0, 0, 0),
                Size = UDim2.new(0, 0, 0, 1)
            }),
            Utility:Create('UIListLayout', {
                Name = 'TabButtonHolderListLayout',
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 1)
            })
        }),
    })

    Utility:Create('Frame', {
        Name = 'TabContainer',
        BackgroundColor3 = Theme.BackgroundColor,
        Parent = Container.Main,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ZIndex = 6,
        Position = UDim2.new(0, 86, 0, 1),
        Size = UDim2.new(0, 664, 0, 649)
    }, {
        Utility:Create('Folder', {
            Name = 'TabsFolder'
        })
    })

    Utility:Create('Frame', {
        Name = 'NOLINE',
        Parent = Container.Main,
        BackgroundColor3 = Theme.BackgroundColor,
        BackgroundTransparency = 0,
        ZIndex = 11,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 75, 0, 0),
        Visible = false,
        BorderColor3 = Theme.BorderColor,
        Size = UDim2.new(0, 1, 0, 75)
    })

    -- // NOLINE Func
    local function LineVisible(Bool, Tab)
        local NoLine = Container.Main.NOLINE

        if Bool then
            if Tab == 1 then
                NoLine.Position = UDim2.new(0, 75, 0, Tab + 16 + 1)
                NoLine.Visible = true
            else
                NoLine.Position = UDim2.new(0, 75, 0, (((Tab * 75) - 75) + Tab + 1) + 16)
                NoLine.Visible = true
            end
        else
            local NoLine = Container.Main.NOLINE
            NoLine.Visible = false
        end
    end

    -- // Variables
    local Sidebar = Container.Main.Sidebar
    local TabButtonHolder = Sidebar.TabButtonHolder
    local TabsContainer = Container.Main.TabContainer
    local TabsFolder = TabsContainer.TabsFolder

    -- // Dragging
    Utility:EnableDragging(Container.Main)

    -- // Rainbow Function
    task.spawn(function()
        local Counter = 0
        local ColourBar = Container.Main.ColourBar

        local function Rainbow(X) 
            return math.acos(math.cos(X * math.pi)) / math.pi 
        end

        while task.wait(0.1) do
            ColourBar.BackgroundColor3 = Color3.fromHSV(Rainbow(Counter), 1, 1)
            Counter = Counter + 0.01
        end
    end)

    -- // Tabs
    local Tabs = {}

    function Tabs:AddTab(TabName, Icon)
        TabCount = TabCount + 1

        if TabCount > 8 then
            Utility:Error('warn', 'Maximum amount of tabs reached (8)')
            return
        end

        local TabName = TabName or 'Tab'
        local Icon = Icon:gsub('rbxassetid://', '') or '13224108173'

        Utility:Create('Frame', {
            Name = TabName .. 'ButtonFrame',
            Parent = TabButtonHolder,
            BackgroundColor3 = Theme.SidebarColor,
            BackgroundTransparency = 0,
            ZIndex = 10,
            BorderSizePixel = 0,
            BorderColor3 = Theme.BorderColor,
            Size = UDim2.new(0, 75, 0, 75)
        }, {
            Utility:Create('NumberValue', {
                Name = 'TabValue',
                Value = TabCount
            }),
            Utility:Create('ImageLabel', {
                Name = TabName .. 'ButtonImage',
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 10,
                Position = UDim2.new(0.5, 0, 0.5, 0),
                ImageColor3 = Theme.SecondaryTextColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
            
                Size = UDim2.new(0, 45, 0, 45),
                Image = 'rbxassetid://' .. Icon
            }),
            Utility:Create('TextButton', {
                Name = TabName .. 'Button',
                BackgroundColor3 = Theme.SidebarColor,
                BackgroundTransparency = 1,
                Text = '',
                AutoButtonColor = false,
                Size = UDim2.new(0, 75, 0, 75),
                BorderSizePixel = 0,
                ZIndex = 26
            })
        })

        Utility:Create('Frame', {
            Name = TabName,
            Parent = TabsFolder,
            Active = true,
            Visible = false,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 664, 0, 649),
            BorderSizePixel = 0,
        })

        local TabButtonFrame = TabButtonHolder:FindFirstChild(TabName .. 'ButtonFrame')
        local TabButton = TabButtonFrame:FindFirstChild(TabName .. 'Button')
        local TabButtonImage = TabButtonFrame:FindFirstChild(TabName .. 'ButtonImage')
        local TabFrame = TabsFolder:FindFirstChild(TabName)
        
        TabButton.MouseButton1Down:Connect(function()
            for _, Tab in next, TabsFolder:GetChildren() do
                Tab.Visible = false
            end

            TabFrame.Visible = true
                
            for _, Item in next, TabButtonHolder:GetDescendants() do
                if Item:IsA('Frame') and string.find(Item.Name, 'ButtonFrame') then 
                    Utility:Tween(Item, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                    Utility:Tween(Item, {Size = UDim2.new(0, 75, 0, 75)}, 0.25)
                    Item.BorderSizePixel = 0
                end
            end

            for Index in next, Tabs do
                LineVisible(false, Index)
            end

            for _, Item in next, TabButtonHolder:GetChildren() do
                if Item.Name == TabName .. 'ButtonFrame' then
                    LineVisible(true, Item:FindFirstChild('TabValue').Value)
                end
            end

            Utility:Tween(TabButtonFrame, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
            Utility:Tween(TabButtonFrame, {Size = UDim2.new(0, 75, 0, 75)}, 0.25)
            TabButtonFrame.BorderSizePixel = 1
        end)

        -- // Groupboxes
        local GroupBoxes = {}
        local Boxes = {}

        -- // GroupBox
        function GroupBoxes:AddGroupBox(GroupBoxName, Type, Height)
            local GroupBoxName = GroupBoxName or 'Group Box'
            local GroupBoxHolder
            local GB

            local function FindPreviousBox(Side)
                if Side:lower() == 'left' then
                    for _, Item in next, TabFrame:GetChildren() do
                        if string.find(Item.Name, 'LeftFrame1') then
                            return Item
                        else
                            return
                        end
                    end
                elseif Side:lower() == 'right' then
                    for _, Item in next, TabFrame:GetChildren() do
                        if string.find(Item.Name, 'RightFrame1') then
                            return Item
                        else
                            return
                        end
                    end
                else
                    Utility:Error('warn', 'Args: Side ("left" or "right")')
                end
            end

            local function CheckGroupBoxSize(Side, NewBox)
                local MaxSizeOneBox = 599
                local MaxSizeTwoBoxes = 574
                local PreviousBoxSize
                local Gaps
                local Total

                if Side:lower() == 'left' then
                    if FindPreviousBox('left') then
                        PreviousBoxSize = FindPreviousBox('left').Size.Y.Offset
                        Total = (PreviousBoxSize + NewBox)

                        if Total > MaxSizeTwoBoxes then
                            local Recommended = (MaxSizeTwoBoxes - PreviousBoxSize)

                            Utility:Error('warn', 'Max size for GroupBoxes reached. Maximum size for second GroupBox. Changed to: ' .. tostring(Recommended) .. 'px.')

                            return Recommended
                        else 
                            return NewBox
                        end
                    else
                        if NewBox > MaxSizeOneBox then
                            local Recommended = (MaxSizeOneBox)

                            Utility:Error('warn', 'Max size for GroupBoxes reached. Maximum size for GroupBox. Changed to: ' .. tostring(Recommended) .. 'px.')

                            return Recommended
                        else 
                            return NewBox
                        end
                    end  
                elseif Side:lower() == 'right' then
                    if FindPreviousBox('right') then
                        PreviousBoxSize = FindPreviousBox('right').Size.Y.Offset
                        Total = (PreviousBoxSize + NewBox)

                        if Total > MaxSizeTwoBoxes then
                            local Recommended = (MaxSizeTwoBoxes - PreviousBoxSize)

                            Utility:Error('warn', 'Max size for GroupBoxes reached. Maximum size for second GroupBox. Changed to: ' .. tostring(Recommended) .. 'px.')

                            return Recommended
                        else 
                            return NewBox
                        end
                    else
                        if NewBox > MaxSizeOneBox then
                            local Recommended = (MaxSizeOneBox)

                            Utility:Error('warn', 'Max size for GroupBoxes reached. Maximum size for GroupBox. Changed to: ' .. tostring(Recommended) .. 'px.')

                            return Recommended
                        else 
                            return NewBox
                        end
                    end  
                else
                    Utility:Error('warn', 'Args: Side ("left" or "right")')
                end
            end

            if Type:lower() == 'left' then
                if not FindPreviousBox('left') then
                    Utility:Create('Frame', {
                        Name = GroupBoxName .. 'LeftFrame1',
                        Parent = TabFrame,
                        BackgroundColor3 = Theme.SecondaryColor,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 1,
                        BorderColor3 = Theme.BorderColor,
                        ZIndex = 7,
                        Size = UDim2.new(0, (664 / 2) - 30, 0, CheckGroupBoxSize('left', Height)),
                        Position = UDim2.new(0, 15, 0, 25)
                    })

                    GB = TabFrame[GroupBoxName .. 'LeftFrame1']
                else
                    Utility:Create('Frame', {
                        Name = GroupBoxName .. 'LeftFrame2',
                        Parent = TabFrame,
                        BackgroundColor3 = Theme.SecondaryColor,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 1,
                        BorderColor3 = Theme.BorderColor,
                        ZIndex = 7,
                        Size = UDim2.new(0, (664 / 2) - 30, 0, CheckGroupBoxSize('left', Height)),
                        Position = UDim2.new(0, 15, 0, 50 + FindPreviousBox('left').Size.Y.Offset)
                    })

                    GB = TabFrame[GroupBoxName .. 'LeftFrame2']
                end

                local GroupBox = GB

                Utility:Create('Frame', {
                    Name = 'NameFiller',
                    BackgroundColor3 = Theme.BackgroundColor,
                    Parent = GroupBox,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 10,
                    Size = UDim2.new(0, 73, 0, 4),
                    Position = UDim2.new(0, 15, 0, -5)
                })

                Utility:Create('Frame', {
                    Name = 'NameHolder',
                    BackgroundColor3 = Theme.SecondaryColor,
                    Parent = GroupBox,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 9,
                    Size = UDim2.new(0, 73, 0, 10),
                    Position = UDim2.new(0, 15, 0, -5)
                }, {
                    Utility:Create('TextLabel', {
                        Name = GroupBoxName .. 'Title',
                        BackgroundColor3 = Theme.SecondaryColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, -1),
                        Size = UDim2.new(0, 73, 0, 10),
                        Font = Enum.Font.ArialBold,
                        Parent = GroupBox,
                        Text = GroupBoxName,
                        ZIndex = 11,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'Padding',
                            PaddingLeft = UDim.new(0, 3)
                        })
                    })
                })
                Utility:Create('ScrollingFrame', {
                    Name = 'ElementsHolder',
                    BackgroundColor3 = Theme.SecondaryColor,
                    BackgroundTransparency = 0,
                    Parent = GroupBox,
                    BorderSizePixel = 0,
                    ScrollingDirection = Enum.ScrollingDirection.Y,
                    ScrollBarThickness = 1,
                    ScrollBarImageColor3 = Theme.BorderColor,
                    ZIndex = 9,
                    Size = UDim2.new(0, (664 / 2) - 45, 0, GroupBox.Size.Y.Offset - 15),
                    CanvasSize = UDim2.new(0, (664 / 2) - 45, 0, GroupBox.Size.Y.Offset - 15),
                    Position = UDim2.new(0, 0, 0, 15)
                }, {
                    Utility:Create('UIListLayout', {
                        Name = 'UIListLayout',
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 3)
                    })
                }) 

                local NameFiller = GroupBox.NameFiller
                local NameHolder = GroupBox.NameHolder
                local Title = NameHolder[GroupBoxName .. 'Title']
                local ElementsHolder = GroupBox['ElementsHolder']
                GroupBoxHolder = ElementsHolder

                -- // Name Size
                local TextSize = TextService:GetTextSize(Title.Text, 14, Enum.Font.ArialBold, Vector2.new((664 / 2) - 45 - 18, 10))
                
                Utility:Tween(TabButtonFrame, {Size = UDim2.new(0, 75, 0, 75)}, 0.25)
                Utility:Tween(NameFiller, {Size = UDim2.new(0, TextSize.X + 6, 0, 4)}, 0.25)
                Utility:Tween(NameHolder, {Size = UDim2.new(0, TextSize.X + 6, 0, 10)}, 0.25)

                -- // Elements
                ElementsHolder.ChildAdded:Connect(function(Child)
                    task.wait(0.25)
                    ElementsHolder.CanvasSize = UDim2.new(0, GroupBox.Size.X.Offset, 0, ElementsHolder.UIListLayout.AbsoluteContentSize.Y + 6)
                end)
            
            elseif Type:lower() == 'right' then
                if not FindPreviousBox('right') then
                    Utility:Create('Frame', {
                        Name = GroupBoxName .. 'RightFrame1',
                        Parent = TabFrame,
                        BackgroundColor3 = Theme.SecondaryColor,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 1,
                        BorderColor3 = Theme.BorderColor,
                        ZIndex = 7,
                        Size = UDim2.new(0, (664 / 2) - 30, 0, CheckGroupBoxSize('right', Height)),
                        Position = UDim2.new(0, (664 / 2) + 5, 0, 25)
                    })

                    GB = TabFrame[GroupBoxName .. 'RightFrame1']
                else
                    Utility:Create('Frame', {
                        Name = GroupBoxName .. 'RightFrame2',
                        Parent = TabFrame,
                        BackgroundColor3 = Theme.SecondaryColor,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 1,
                        BorderColor3 = Theme.BorderColor,
                        ZIndex = 7,
                        Size = UDim2.new(0, (664 / 2) - 30, 0, CheckGroupBoxSize('right', Height)),
                        Position = UDim2.new(0, (664 / 2) + 5, 0, 50 + FindPreviousBox('right').Size.Y.Offset)
                    })

                    GB = TabFrame[GroupBoxName .. 'RightFrame2']
                end

                local GroupBox = GB

                Utility:Create('Frame', {
                    Name = 'NameFiller',
                    BackgroundColor3 = Theme.BackgroundColor,
                    Parent = GroupBox,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 10,
                    Size = UDim2.new(0, 73, 0, 4),
                    Position = UDim2.new(0, 15, 0, -5)
                })

                Utility:Create('Frame', {
                    Name = 'NameHolder',
                    BackgroundColor3 = Theme.SecondaryColor,
                    Parent = GroupBox,
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 9,
                    Size = UDim2.new(0, 73, 0, 10),
                    Position = UDim2.new(0, 15, 0, -5)
                }, {
                    Utility:Create('TextLabel', {
                        Name = GroupBoxName .. 'Title',
                        BackgroundColor3 = Theme.SecondaryColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, -1),
                        Size = UDim2.new(0, 73, 0, 10),
                        Font = Enum.Font.ArialBold,
                        Parent = GroupBox,
                        Text = GroupBoxName,
                        ZIndex = 11,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'Padding',
                            PaddingLeft = UDim.new(0, 3)
                        })
                    })
                })
                Utility:Create('ScrollingFrame', {
                    Name = 'ElementsHolder',
                    BackgroundColor3 = Theme.SecondaryColor,
                    BackgroundTransparency = 0,
                    Parent = GroupBox,
                    BorderSizePixel = 0,
                    ScrollingDirection = Enum.ScrollingDirection.Y,
                    ScrollBarThickness = 1,
                    ScrollBarImageColor3 = Theme.BorderColor,
                    ZIndex = 9,
                    Size = UDim2.new(0, (664 / 2) - 45, 0, GroupBox.Size.Y.Offset - 15),
                    CanvasSize = UDim2.new(0, (664 / 2) - 45, 0, GroupBox.Size.Y.Offset - 15),
                    Position = UDim2.new(0, 0, 0, 15)
                }, {
                    Utility:Create('UIListLayout', {
                        Name = 'UIListLayout',
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDim.new(0, 3)
                    })
                }) 

                local NameFiller = GroupBox.NameFiller
                local NameHolder = GroupBox.NameHolder
                local Title = NameHolder[GroupBoxName .. 'Title']
                local ElementsHolder = GroupBox['ElementsHolder']
                GroupBoxHolder = ElementsHolder

                -- // Name Size
                local TextSize = TextService:GetTextSize(Title.Text, 14, Enum.Font.ArialBold, Vector2.new((664 / 2) - 45 - 18, 10))
                
                Utility:Tween(TabButtonFrame, {Size = UDim2.new(0, 75, 0, 75)}, 0.25)
                Utility:Tween(NameFiller, {Size = UDim2.new(0, TextSize.X + 6, 0, 4)}, 0.25)
                Utility:Tween(NameHolder, {Size = UDim2.new(0, TextSize.X + 6, 0, 10)}, 0.25)

                -- // Elements
                ElementsHolder.ChildAdded:Connect(function(Child)
                    task.wait(0.25)
                    ElementsHolder.CanvasSize = UDim2.new(0, GroupBox.Size.X.Offset, 0, ElementsHolder.UIListLayout.AbsoluteContentSize.Y + 6)
                end)
            else
                Utility:Error('warn', 'Args: Side ("left" or "right")')
            end
        end
        return GroupBoxes
    end
    return Tabs
end

local Window = Library:CreateWindow('CAL', '', 'Default')

local Tab1 = Window:AddTab('Name1', '13224108173')

local GroupBoxLeft1 = Tab1:AddGroupBox('Groupbox Left One', 'left', 300)

local GroupBoxLeft2 = Tab1:AddGroupBox('Groupbox Left Two', 'left', 274)

local GroupBoxRight1 = Tab1:AddGroupBox('Groupbox Right One', 'right', 599)











local Tab2 = Window:AddTab('Name2', '13224108173')

local Tab3 = Window:AddTab('Name3', '13224108173')

local Tab1 = Window:AddTab('Name4', '13224108173')

local Tab2 = Window:AddTab('Name5', '13224108173')

local Tab3 = Window:AddTab('Name6', '13224108173')

local Tab3 = Window:AddTab('Name7', '13224108173')

local Tab3 = Window:AddTab('Name8', '13224108173')
