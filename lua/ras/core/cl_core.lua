RAS.NotifySystem = function(type, message)
  local plyscurrtime = CurTime()

  local NotifyPanel = vgui.Create("DNotify")
  NotifyPanel:SetPos(15, 15)
  NotifyPanel:SetSize(160, 50)
  NotifyPanel:SetLife(10)

  local bg = vgui.Create("DPanel", NotifyPanel)
  bg:Dock(FILL)
  bg.Paint = function(s, w, h)
    draw.RoundedBox(0,0,0,w,h,Color(214, 214, 214))

    draw.RoundedBox(0,0,0,w,15,RAS.Config.DarkColor)
    draw.RoundedBox(0,0,15,w,2,RAS.Config.LightColor)
    draw.RoundedBox(0,0,17,w,40,RAS.Config.PrimaryColor)
  end

  local MainText = vgui.Create("DLabel", bg)
  MainText:SetPos(0, 15)
  MainText:SetSize(NotifyPanel:GetWide(), 40)
  MainText:SetText(RAS.Config.Language[RAS.Config.LanguageToUse].NotificationTitle .. " (" .. NotifyPanel:GetLife() .. ")")
  MainText:SetContentAlignment(5)
  MainText:SetFont("RASLblTextFontSmall")
  MainText:SetTextColor(RAS.Config.MainTextColor)
  MainText.Think = function()
    MainText:SetText(RAS.Config.Language[RAS.Config.LanguageToUse].NotificationTitle .. " (" .. math.Clamp(math.ceil(NotifyPanel:GetLife() - (CurTime() - plyscurrtime)), 0, 9999) .. ")")
  end

  local label = vgui.Create("DLabel", bg)
  label:SetPos(10, 70)
  label:SetWide(NotifyPanel:GetWide() - 20)
  label:SetText(message)
  label:SetTextColor(RAS.Config.LblTextColor)
  label:SetWrap(true)
  label:SetFont("GModNotify")
  label:SetAutoStretchVertical(true)
  timer.Simple(.1,function()
    local nextHeight = label:GetTall() + 55
    NotifyPanel:SetTall(NotifyPanel:GetTall() + nextHeight)

    if type == "bool" then
      local YesBtn = vgui.Create("DButton", bg)
      YesBtn:SetPos(10, NotifyPanel:GetTall() - 25)
      YesBtn:SetSize(NotifyPanel:GetWide() / 2 - 20, 20)
      YesBtn:SetText(RAS.Config.Language[RAS.Config.LanguageToUse]["Yes"])
      YesBtn:SetTextColor(RAS.Config.MainTextColor)
      YesBtn.Paint = function(s, w, h)
        draw.RoundedBox(3,0,0,w,h,RAS.Config.PrimaryColor)
      end
      YesBtn.DoClick = function()
        NotifyPanel:SetVisible(false)
        net.Start("RASNotifyButtonCallback")
          net.WriteBool(true)
        net.SendToServer()
      end

      local NoBtn = vgui.Create("DButton", bg)
      NoBtn:SetPos(NotifyPanel:GetWide() / 2 + 10, NotifyPanel:GetTall() - 25)
      NoBtn:SetSize(NotifyPanel:GetWide() / 2 - 20, 20)
      NoBtn:SetText(RAS.Config.Language[RAS.Config.LanguageToUse]["No"])
      NoBtn:SetTextColor(RAS.Config.MainTextColor)
      NoBtn.Paint = function(s, w, h)
        draw.RoundedBox(3,0,0,w,h,RAS.Config.PrimaryColor)
      end
      NoBtn.DoClick = function()
        NotifyPanel:SetVisible(false)
        net.Start("RASNotifyButtonCallback")
          net.WriteBool(false)
        net.SendToServer()
      end
    else
      local CloseBtn = vgui.Create("DButton", bg)
      CloseBtn:SetPos(10, NotifyPanel:GetTall() - 25)
      CloseBtn:SetSize(NotifyPanel:GetWide() - 20, 20)
      CloseBtn:SetText(RAS.Config.Language[RAS.Config.LanguageToUse]["Close"])
      CloseBtn:SetTextColor(RAS.Config.MainTextColor)
      CloseBtn.Paint = function(s, w, h)
        draw.RoundedBox(3,0,0,w,h,RAS.Config.PrimaryColor)
      end
      CloseBtn.DoClick = function()
        NotifyPanel:SetVisible(false)
      end
    end
  end)

  NotifyPanel:AddItem( bg )
end

net.Receive("RASSendNotification",function()
	local type = net.ReadString()
  local message = net.ReadString()
	RAS.NotifySystem(type, message)
end)