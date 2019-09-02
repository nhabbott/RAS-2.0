net.Receive("RASMainMenu", function(len, ply)
  local config = RAS.Config
  local events = net.ReadTable()
  
  local DFrame = vgui.Create("DFrame")
  DFrame:SetSize(800, 500)
  DFrame:Center()
  DFrame:SetDraggable(true)
  DFrame:MakePopup()
  DFrame:SetTitle(config.Language[config.LanguageToUse]["MenuTitleMain"])
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

  local settingspic = "ras/settings.png"
  local banspic = "ras/bans.png"

  local ViewSettings = vgui.Create("DImageButton", DFrame)
  ViewSettings:SetPos(DFrame:GetWide() - 42, DFrame:GetTall() - 52)
  ViewSettings:SetSize(24, 24)
  ViewSettings:SetImage(settingspic)
  ViewSettings.DoClick = function()
    rippleraid2 = 0
    show2ripple = true
    timer.Simple(.3, function() 
      show2ripple = false
      net.Start("RASOpenSettingsMenu")
      net.SendToServer()
      timer.Simple(.1, function() DFrame:Close() end)
    end)
  end

  local ViewBans = vgui.Create("DImageButton", DFrame)
  ViewBans:SetPos(18, DFrame:GetTall() - 52)
  ViewBans:SetSize(24, 24)
  ViewBans:SetImage(banspic)
  ViewBans.DoClick = function()
    rippleraid1 = 0
    show1ripple = true
    timer.Simple(.3, function() 
      show1ripple = false
      net.Start("RASOpenBansMenu")
      net.SendToServer()
      timer.Simple(.1, function() DFrame:Close() end)
    end)
  end

  local EventList = vgui.Create("DListView", DFrame)
  EventList:DockMargin(-6, 3, -6, 65)
  EventList:Dock(FILL)
  EventList:SetMultiSelect(false)
  EventList:SetPaintBackground(false)
  EventList:SetSortable(true)
  EventList:SetHeaderHeight(30)
  EventList:SetDataHeight(25)
  EventList:AddColumn(config.Language[config.LanguageToUse]["Column0"]):SetWide(1)
  EventList:AddColumn(config.Language[config.LanguageToUse]["Column1"]):SetWide(1)
  EventList:AddColumn(config.Language[config.LanguageToUse]["Column2"]):SetWide(120)
  EventList:AddColumn(config.Language[config.LanguageToUse]["Column3"]):SetWide(500)
  for k, v in pairs(events) do
    EventList:AddLine(k, v.kind, v.time, v.event)
  end

  for _, line in pairs(EventList:GetLines()) do
    function line:Paint(w, h)
      if self:IsHovered() then 
        draw.RoundedBox(0, 0, 0, w, h, RAS.Config.LightColor)
      elseif self:IsSelected() then
        draw.RoundedBox(0, 0, 0, w, h, RAS.Config.DarkColor)
      elseif self:GetAltLine() then
        draw.RoundedBox(0, 0, 0, w, h, Color(230, 230, 230))
      else
        draw.RoundedBox(0, 0, 0, w, h+10, Color(214, 214, 214))
      end
    end
    for _, column in pairs(line.Columns) do
      column:SetFont("RASMainTextFont")
    end
  end

  for _, v in pairs(EventList.Columns) do
    function v.Header:Paint(w, h)
      draw.RoundedBox(0, 0, 0, w, h, Color(190, 190, 190))
    end
    v.Header:SetFont("RASLblTextFont")
  end

  EventList:SortByColumn(1, true)

  function EventList.VBar:Paint(w, h) 
    draw.RoundedBox(100, 0, 0, w, h, Color(214, 214, 214))
  end

  function EventList.VBar.btnUp:Paint(w, h) 
  end

  function EventList.VBar.btnDown:Paint(w, h)
  end

  function EventList.VBar.btnGrip:Paint(w, h)
    draw.RoundedBox(100, 0, 0, w, h, Color(190, 190, 190))
  end

  function EventList:OnRowRightClick(_, line) 
    local id = line:GetColumnText(1)

    local Menu = DermaMenu()
    Menu:AddOption(config.Language[config.LanguageToUse]["Copy1"], function() 
      local Steam64 = events[id].adminSteam64
      SetClipboardText(Steam64)
    end):SetIcon("icon16/page_white_copy.png")
    Menu:AddOption(config.Language[config.LanguageToUse]["Copy2"], function() 
      local Steam64 = events[id].playerSteam64
      SetClipboardText(Steam64)
    end):SetIcon("icon16/page_white_copy.png")
    Menu:Open()
  end
end)