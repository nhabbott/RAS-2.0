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
  AntiSpam:SetPos(DFrame:GetWide() - 70, 126)
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
end)