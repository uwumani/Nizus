local ClickButton = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")

if game.CoreGui:FindFirstChild("ClickButton") then
    game.CoreGui:FindFirstChild("ClickButton"):Destroy()
end

ClickButton.Name = "ClickButton"
ClickButton.Parent = game.CoreGui
ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ClickButton
MainFrame.AnchorPoint = Vector2.new(1, 0)
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(1, -60, 0, 10)
MainFrame.Size = UDim2.new(0, 45, 0, 45)

UICorner.CornerRadius = UDim.new(0, 100)
UICorner.Parent = MainFrame

UICorner_2.CornerRadius = UDim.new(0, 100)
UICorner_2.Parent = ImageLabel

ImageLabel.Parent = MainFrame
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 45, 0, 45)
ImageLabel.Image = "rbxassetid://"

TextButton.Parent = MainFrame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 1
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.Size = UDim2.new(0, 45, 0, 45)
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "#Nizus"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 15

TextButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "End", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "End", false, game)
end)
