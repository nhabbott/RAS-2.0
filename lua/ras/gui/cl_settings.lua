net.Receive("RASSettingMenu", function(len, ply)
  local config = RAS.Config
  local settings = net.ReadTable()
  
  local DFrame = vgui.Create("DFrame")
  DFrame:SetSize(800, 500)
  DFrame:Center()
  DFrame:SetDraggable(true)
  DFrame:MakePopup()
  DFrame:SetTitle(config.Language[config.LanguageToUse]["MenuTitleSetting"])
  DFrame:ShowCloseButton(true)
  DFrame.Paint = function(s, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(214, 214, 214))
    draw.RoundedBox(0, 0, h-40, w, 40, Color(230, 230, 230))

    draw.RoundedBox(0, 0, 0, w, 30, RAS.Config.DarkColor)
    draw.RoundedBox(0, 0, 30, w, 2, RAS.Config.LightColor)
    --draw.RoundedBox(0,0,32,w,80,RAS.Config.PrimaryColor)

    surface.SetDrawColor(RAS.Config.PrimaryColor)
		draw.NoTexture()
		RASCircle(30, h - 40, 20, 360)

		surface.SetDrawColor(RAS.Config.PrimaryColor)
		draw.NoTexture()
		RASCircle(w - 30, h - 40, 20, 360)

    if show1ripple then
      surface.SetDrawColor(RAS.Config.CircleRippleColor)
      draw.NoTexture()
      RASCircle(30, h - 40, rippleraid1, 360)
      rippleraid1 = rippleraid1 + .8
      if rippleraid1 >= 20 then rippleraid1 = 20 end
    end

    if show2ripple then
      surface.SetDrawColor(RAS.Config.CircleRippleColor)
      draw.NoTexture()
      RASCircle(w - 30, h - 40, rippleraid2, 360)
      rippleraid2 = rippleraid2 + .8
      if rippleraid2 >= 20 then rippleraid2 = 20 end
    end
  end

  local backpic = "ras/back.png"
  local savepic = "ras/save.png"

  local Back = vgui.Create("DImageButton", DFrame)
  Back:SetPos(18, DFrame:GetTall() - 52)
  Back:SetSize(24, 24)
  Back:SetImage(backpic)
  Back.DoClick = function()
    rippleraid1 = 0
    show1ripple = true
    timer.Simple(.3, function() 
      show1ripple = false
      net.Start("RASOpenMainMenu")
      net.SendToServer()
      timer.Simple(.1, function() DFrame:Close() end)
    end)
  end

  local Save = vgui.Create("DImageButton", DFrame)
  Save:SetPos(DFrame:GetWide() - 42, DFrame:GetTall() - 52)
  Save:SetSize(24, 24)
  Save:SetImage(savepic)
  Save.DoClick = function()
    rippleraid2 = 0
    show2ripple = true
    timer.Simple(.3, function() 
      show2ripple = false
      net.Start("RASSaveConfig")
        net.WriteTable(settings)
      net.SendToServer()
      DFrame:Close()
    end)
  end

  local AntiSpam = vgui.Create("DButton", DFrame)
  AntiSpam:SetPos(DFrame:GetWide() - 70, 76)
  AntiSpam:SetSize(50, 30)
  AntiSpam:SetText("")
  AntiSpam.IsOn = settings.AntiSpamming
  AntiSpam.Paint = function(s, w, h)
    local val = nil
    if AntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if AntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  AntiSpam.DoClick = function()
    if AntiSpam.IsOn then
      AntiSpam.IsOn = false
      settings.AntiSpamming = false
    else
      AntiSpam.IsOn = true
      settings.AntiSpamming = true
    end
  end

  local ChatAntiSpam = vgui.Create("DButton", DFrame)
  ChatAntiSpam:SetPos(DFrame:GetWide() - 70, 116)
  ChatAntiSpam:SetSize(50, 30)
  ChatAntiSpam:SetText("")
  ChatAntiSpam.IsOn = settings.Chat.Enabled
  ChatAntiSpam.Paint = function(s, w, h)
    local val = nil
    if ChatAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if ChatAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  ChatAntiSpam.DoClick = function()
    if ChatAntiSpam.IsOn then
      ChatAntiSpam.IsOn = false
      settings.Chat.Enabled = false
    else
      ChatAntiSpam.IsOn = true
      settings.Chat.Enabled = true
    end
  end

  local ChatDelayBox = vgui.Create("DNumberWang", DFrame)
  ChatDelayBox:SetPos(DFrame:GetWide() - 145, 123)
  ChatDelayBox:SetSize(55, 20)
  ChatDelayBox:SetValue(settings.Chat.Delay)
  ChatDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  ChatDelayBox:SetNumeric(true)
  ChatDelayBox:SetUpdateOnType(true)
  ChatDelayBox.OnValueChange = function(value)
    settings.Chat.Delay = value
  end

  local PropAntiSpam = vgui.Create("DButton", DFrame)
  PropAntiSpam:SetPos(DFrame:GetWide() - 70, 156)
  PropAntiSpam:SetSize(50, 30)
  PropAntiSpam:SetText("")
  PropAntiSpam.IsOn = settings.Prop.Enabled
  PropAntiSpam.Paint = function(s, w, h)
    local val = nil
    if PropAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if PropAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  PropAntiSpam.DoClick = function()
    if PropAntiSpam.IsOn then
      PropAntiSpam.IsOn = false
      settings.Prop.Enabled = false
    else
      PropAntiSpam.IsOn = true
      settings.Prop.Enabled = true
    end
  end

  local PropDelayBox = vgui.Create("DNumberWang", DFrame)
  PropDelayBox:SetPos(DFrame:GetWide() - 145, 161)
  PropDelayBox:SetSize(55, 20)
  PropDelayBox:SetValue(settings.Prop.Delay)
  PropDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  PropDelayBox:SetNumeric(true)
  PropDelayBox:SetUpdateOnType(true)
  PropDelayBox.OnValueChange = function(value)
    settings.Prop.Delay = value
  end

  local SentAntiSpam = vgui.Create("DButton", DFrame)
  SentAntiSpam:SetPos(DFrame:GetWide() - 70, 196)
  SentAntiSpam:SetSize(50, 30)
  SentAntiSpam:SetText("")
  SentAntiSpam.IsOn = settings.Sent.Enabled
  SentAntiSpam.Paint = function(s, w, h)
    local val = nil
    if SentAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if SentAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  SentAntiSpam.DoClick = function()
    if SentAntiSpam.IsOn then
      SentAntiSpam.IsOn = false
      settings.Sent.Enabled = false
    else
      SentAntiSpam.IsOn = true
      settings.Sent.Enabled = true
    end
  end

  local SentDelayBox = vgui.Create("DNumberWang", DFrame)
  SentDelayBox:SetPos(DFrame:GetWide() - 145, 201)
  SentDelayBox:SetSize(55, 20)
  SentDelayBox:SetValue(settings.Sent.Delay)
  SentDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  SentDelayBox:SetNumeric(true)
  SentDelayBox:SetUpdateOnType(true)
  SentDelayBox.OnValueChange = function(value)
    settings.Sent.Delay = value
  end

  local EffectAntiSpam = vgui.Create("DButton", DFrame)
  EffectAntiSpam:SetPos(DFrame:GetWide() - 70, 236)
  EffectAntiSpam:SetSize(50, 30)
  EffectAntiSpam:SetText("")
  EffectAntiSpam.IsOn = settings.Effect.Enabled
  EffectAntiSpam.Paint = function(s, w, h)
    local val = nil
    if EffectAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if EffectAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  EffectAntiSpam.DoClick = function()
    if EffectAntiSpam.IsOn then
      EffectAntiSpam.IsOn = false
      settings.Effect.Enabled = false
    else
      EffectAntiSpam.IsOn = true
      settings.Effect.Enabled = true
    end
  end

  local EffectDelayBox = vgui.Create("DNumberWang", DFrame)
  EffectDelayBox:SetPos(DFrame:GetWide() - 145, 241)
  EffectDelayBox:SetSize(55, 20)
  EffectDelayBox:SetValue(settings.Effect.Delay)
  EffectDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  EffectDelayBox:SetNumeric(true)
  EffectDelayBox:SetUpdateOnType(true)
  EffectDelayBox.OnValueChange = function(value)
    settings.Effect.Delay = value
  end

  local RagdollAntiSpam = vgui.Create("DButton", DFrame)
  RagdollAntiSpam:SetPos(DFrame:GetWide() - 70, 276)
  RagdollAntiSpam:SetSize(50, 30)
  RagdollAntiSpam:SetText("")
  RagdollAntiSpam.IsOn = settings.Ragdoll.Enabled
  RagdollAntiSpam.Paint = function(s, w, h)
    local val = nil
    if RagdollAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if RagdollAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  RagdollAntiSpam.DoClick = function()
    if RagdollAntiSpam.IsOn then
      RagdollAntiSpam.IsOn = false
      settings.Ragdoll.Enabled = false
    else
      RagdollAntiSpam.IsOn = true
      settings.Ragdoll.Enabled = true
    end
  end

  local RagdollDelayBox = vgui.Create("DNumberWang", DFrame)
  RagdollDelayBox:SetPos(DFrame:GetWide() - 145, 281)
  RagdollDelayBox:SetSize(55, 20)
  RagdollDelayBox:SetValue(settings.Ragdoll.Delay)
  RagdollDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  RagdollDelayBox:SetNumeric(true)
  RagdollDelayBox:SetUpdateOnType(true)
  RagdollDelayBox.OnValueChange = function(value)
    settings.Ragdoll.Delay = value
  end

  local VehicleAntiSpam = vgui.Create("DButton", DFrame)
  VehicleAntiSpam:SetPos(DFrame:GetWide() - 70, 316)
  VehicleAntiSpam:SetSize(50, 30)
  VehicleAntiSpam:SetText("")
  VehicleAntiSpam.IsOn = settings.Vehicle.Enabled
  VehicleAntiSpam.Paint = function(s, w, h)
    local val = nil
    if VehicleAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if VehicleAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  VehicleAntiSpam.DoClick = function()
    if VehicleAntiSpam.IsOn then
      VehicleAntiSpam.IsOn = false
      settings.Vehicle.Enabled = false
    else
      VehicleAntiSpam.IsOn = true
      settings.Vehicle.Enabled = true
    end
  end

  local VehicleDelayBox = vgui.Create("DNumberWang", DFrame)
  VehicleDelayBox:SetPos(DFrame:GetWide() - 145, 321)
  VehicleDelayBox:SetSize(55, 20)
  VehicleDelayBox:SetValue(settings.Vehicle.Delay)
  VehicleDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  VehicleDelayBox:SetNumeric(true)
  VehicleDelayBox:SetUpdateOnType(true)
  VehicleDelayBox.OnValueChange = function(value)
    settings.Vehicle.Delay = value
  end

  local NpcAntiSpam = vgui.Create("DButton", DFrame)
  NpcAntiSpam:SetPos(DFrame:GetWide() - 70, 356)
  NpcAntiSpam:SetSize(50, 30)
  NpcAntiSpam:SetText("")
  NpcAntiSpam.IsOn = settings.Npc.Enabled
  NpcAntiSpam.Paint = function(s, w, h)
    local val = nil
    if NpcAntiSpam.IsOn then
      val = 1
    else
      val = 0
    end

    if NpcAntiSpam.IsOn then
      draw.RoundedBox(15, 0, 0, w, h, Color(0, 100, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(15, h - 15, 15, 360)
    else
      draw.RoundedBox(15, 0, 0, w, h, Color(100, 0, 0, 255))
      surface.SetDrawColor(RAS.Config.PrimaryColor)
      draw.NoTexture()
      RASCircle(35, h - 15, 15, 360)
    end
  end

  NpcAntiSpam.DoClick = function()
    if NpcAntiSpam.IsOn then
      NpcAntiSpam.IsOn = false
      settings.Npc.Enabled = false
    else
      NpcAntiSpam.IsOn = true
      settings.Npc.Enabled = true
    end
  end

  local NpcDelayBox = vgui.Create("DNumberWang", DFrame)
  NpcDelayBox:SetPos(DFrame:GetWide() - 145, 361)
  NpcDelayBox:SetSize(55, 20)
  NpcDelayBox:SetValue(settings.Npc.Delay)
  NpcDelayBox:SetPlaceholderText(config.Language[config.LanguageToUse]["Delay"])
  NpcDelayBox:SetNumeric(true)
  NpcDelayBox:SetUpdateOnType(true)
  NpcDelayBox.OnValueChange = function(value)
    settings.Npc.Delay = value
  end

  if !AntiSpam.IsOn then
    ChatAntiSpam.IsOn = false
    PropAntiSpam.IsOn = false
    SentAntiSpam.IsOn = false
    EffectAntiSpam.IsOn = false
    RagdollAntiSpam.IsOn = false
    VehicleAntiSpam.IsOn = false
    NpcAntiSpam.IsOn = false
  end
end)