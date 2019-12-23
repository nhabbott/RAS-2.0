net.Receive("RASBanMenu", function(len, ply)
  local config = RAS.Config
  bans = net.ReadTable()
  exempts = net.ReadTable()
  players = net.ReadTable()
  
  local DFrame = vgui.Create("DFrame")
  DFrame:SetSize(800, 500)
  DFrame:Center()
  DFrame:SetDraggable(true)
  DFrame:MakePopup()
  DFrame:SetTitle(config.Language[config.LanguageToUse]["MenuTitleBan"])
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

  local newpic = "ras/addban.png"

  local ViewBox = vgui.Create("DComboBox", DFrame)
    ViewBox:SetPos((DFrame:GetWide() / 2) - 35, DFrame:GetTall() - 30)
    ViewBox:SetSize(70, 20)
    ViewBox:SetValue(config.Language[config.LanguageToUse]["View"])
    ViewBox:AddChoice(config.Language[config.LanguageToUse]["Ban"])
    ViewBox:AddChoice(config.Language[config.LanguageToUse]["Exempt"])
    ViewBox.OnSelect = function(_, _, val)
      if val == config.Language[config.LanguageToUse]["Ban"] then
        if ExemptList ~= nil && ExemptList:IsValid() then ExemptList:Clear() end
        if EELabel ~= nil && EELabel:IsValid() then EELabel:Remove() end
        BanList = vgui.Create("DListView", DFrame)
        BanList:DockMargin(-6, 3, -6, 65)
        BanList:Dock(FILL)
        BanList:SetMultiSelect(false)
        BanList:SetPaintBackground(false)
        BanList:SetSortable(true)
        BanList:SetHeaderHeight(30)
        BanList:SetDataHeight(25)
        BanList:AddColumn(config.Language[config.LanguageToUse]["Column0"]):SetWide(1)
        BanList:AddColumn(config.Language[config.LanguageToUse]["Column1"]):SetWide(1)
        BanList:AddColumn(config.Language[config.LanguageToUse]["Column4"]):SetWide(120)
        BanList:AddColumn(config.Language[config.LanguageToUse]["Column5"]):SetWide(120)
        //BanList:AddColumn(config.Language[config.LanguageToUse]["Column6"]):SetWide(500)
        BanList:AddColumn(config.Language[config.LanguageToUse]["Column7"]):SetWide(380)
        
        if table.IsEmpty(bans) then
          EBLabel = vgui.Create("DLabel", DFrame)
          EBLabel:SetPos(DFrame:GetWide() / 2 - 80, DFrame:GetTall() / 2)
          EBLabel:SetText(config.Language[config.LanguageToUse]["MenuEmptyB"])
          EBLabel:SetTextColor(Color(0, 0, 0, 255))
          EBLabel:SetFont("RASMainTextFont")
          EBLabel:SizeToContents()
        else 
          for k, v in pairs(bans) do
            BanList:AddLine(k, v.kind, v.asid, v.bsid, v.reason)
          end

          for _, line in pairs(BanList:GetLines()) do
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

          function BanList:OnRowRightClick(_, line) 
            local id = line:GetColumnText(1)
  
            local Menu = DermaMenu()
            Menu:AddOption(config.Language[config.LanguageToUse]["Copy1"], function() 
              local Steam64 = bans[id].asid
              SetClipboardText(Steam64)
            end):SetIcon("icon16/page_white_copy.png")
            Menu:AddOption(config.Language[config.LanguageToUse]["Copy2"], function() 
              local Steam64 = bans[id].bsid
              SetClipboardText(Steam64)
            end):SetIcon("icon16/page_white_copy.png")
            Menu:AddOption(config.Language[config.LanguageToUse]["MenuUnban"], function() 
              local Steam64 = bans[id].bsid
              net.Start("RASUnBanUser")
                net.WriteString(Steam64)
                net.WriteString(bans[id].kind)
              net.SendToServer()
              net.Start("RASBMenuRefreshSend")
              net.SendToServer()
            end):SetIcon("icon16/delete.png")
            Menu:Open()
          end
        end

        for _, v in pairs(BanList.Columns) do
          function v.Header:Paint(w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(190, 190, 190))
          end
          v.Header:SetFont("RASLblTextFont")
        end

        BanList:SortByColumn(1, true)

        function BanList.VBar:Paint(w, h) 
          draw.RoundedBox(100, 0, 0, w, h, Color(214, 214, 214))
        end

        function BanList.VBar.btnUp:Paint(w, h) 
        end

        function BanList.VBar.btnDown:Paint(w, h)
        end

        function BanList.VBar.btnGrip:Paint(w, h)
          draw.RoundedBox(100, 0, 0, w, h, Color(190, 190, 190))
        end
      elseif val == config.Language[config.LanguageToUse]["Exempt"] then
        if BanList ~= nil && BanList:IsValid() then BanList:Clear() end
        if EBLabel ~= nil && EBLabel:IsValid() then EBLabel:Remove() end
        ExemptList = vgui.Create("DListView", DFrame)
        ExemptList:DockMargin(-6, 3, -6, 65)
        ExemptList:Dock(FILL)
        ExemptList:SetMultiSelect(false)
        ExemptList:SetPaintBackground(false)
        ExemptList:SetSortable(true)
        ExemptList:SetHeaderHeight(30)
        ExemptList:SetDataHeight(25)
        ExemptList:AddColumn(config.Language[config.LanguageToUse]["Column0"]):SetWide(1)
        ExemptList:AddColumn(config.Language[config.LanguageToUse]["Column1"]):SetWide(1)
        ExemptList:AddColumn(config.Language[config.LanguageToUse]["Column4"]):SetWide(120)
        ExemptList:AddColumn(config.Language[config.LanguageToUse]["Column5"]):SetWide(120)
        //ExemptList:AddColumn(config.Language[config.LanguageToUse]["Column6"]):SetWide(500)
        ExemptList:AddColumn(config.Language[config.LanguageToUse]["Column7"]):SetWide(380)

        if table.IsEmpty(exempts) then
          EELabel = vgui.Create("DLabel", DFrame)
          EELabel:SetPos(DFrame:GetWide() / 2 - 90, DFrame:GetTall() / 2)
          EELabel:SetText(config.Language[config.LanguageToUse]["MenuEmptyE"])
          EELabel:SetTextColor(Color(0, 0, 0, 255))
          EELabel:SetFont("RASMainTextFont")
          EELabel:SizeToContents()
        else
          for k, v in pairs(exempts) do
            ExemptList:AddLine(k, v.kind, v.asid, v.bsid, v.reason)
          end
  
          for _, line in pairs(ExemptList:GetLines()) do
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

          function ExemptList:OnRowRightClick(_, line) 
            local id = line:GetColumnText(1)
  
            local Menu = DermaMenu()
            Menu:AddOption(config.Language[config.LanguageToUse]["Copy1"], function() 
              local Steam64 = exempts[id].asid
              SetClipboardText(Steam64)
            end):SetIcon("icon16/page_white_copy.png")
            Menu:AddOption(config.Language[config.LanguageToUse]["Copy2"], function() 
              local Steam64 = exempts[id].bsid
              SetClipboardText(Steam64)
            end):SetIcon("icon16/page_white_copy.png")
            Menu:AddOption(config.Language[config.LanguageToUse]["MenuUnexempt"], function() 
              local Steam64 = exempts[id].bsid
              net.Start("RASUnExemptUser")
                net.WriteString(Steam64)
                net.WriteString(exempts[id].kind)
              net.SendToServer()
              net.Start("RASBMenuRefreshSend")
              net.SendToServer()
            end):SetIcon("icon16/delete.png")
            Menu:Open()
          end
        end

        for _, v in pairs(ExemptList.Columns) do
          function v.Header:Paint(w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(190, 190, 190))
          end
          v.Header:SetFont("RASLblTextFont")
        end

        ExemptList:SortByColumn(1, true)

        function ExemptList.VBar:Paint(w, h) 
          draw.RoundedBox(100, 0, 0, w, h, Color(214, 214, 214))
        end

        function ExemptList.VBar.btnUp:Paint(w, h) 
        end

        function ExemptList.VBar.btnDown:Paint(w, h)
        end

        function ExemptList.VBar.btnGrip:Paint(w, h)
          draw.RoundedBox(100, 0, 0, w, h, Color(190, 190, 190))
        end
      end
    end

  local New = vgui.Create("DImageButton", DFrame)
  New:SetPos(DFrame:GetWide() - 42, DFrame:GetTall() - 52)
  New:SetSize(24, 24)
  New:SetImage(newpic)
  New.DoClick = function()
    rippleraid2 = 0
    show2ripple = true
    timer.Simple(.3, function() 
      show2ripple = false
    end)

    local kind = nil
    local type = nil
    local reason = nil
    local pta = nil

    local DFrame = vgui.Create("DFrame")
    DFrame:SetSize(250, 200)
    DFrame:Center()
    DFrame:SetDraggable(true)
    DFrame:MakePopup()
    DFrame:SetTitle(config.Language[config.LanguageToUse]["MenuTitleNewBan"])
    DFrame:ShowCloseButton(true)
    DFrame.Paint = function(s, w, h)
      draw.RoundedBox(0, 0, 0, w, h, Color(214, 214, 214))
      --draw.RoundedBox(0, 0, h-40, w, 40, Color(230, 230, 230))

      draw.RoundedBox(0, 0, 0, w, 30, RAS.Config.DarkColor)
      draw.RoundedBox(0, 0, 30, w, 2, RAS.Config.LightColor)

      surface.SetDrawColor(Color(0, 0, 0, 255))
      surface.DrawOutlinedRect(0, 0, w, h)
    end

    local KLabel = vgui.Create("DLabel", DFrame)
    KLabel:SetPos(15, 52.5)
    KLabel:SetText(config.Language[config.LanguageToUse]["MenuModule"])
    KLabel:SetTextColor(Color(0, 0, 0, 255))
    KLabel:SizeToContents()

    local KindBox = vgui.Create("DComboBox", DFrame)
    KindBox:SetPos(170, 50)
    KindBox:SetSize(65, 20)
    KindBox:SetValue(config.Language[config.LanguageToUse]["Module"])
    for k, v in pairs(config.Language[config.LanguageToUse]["Kinds"]) do
      KindBox:AddChoice(v:gsub("^%l", string.upper))
    end
    KindBox.OnSelect = function(_, _, val)
      kind = val
    end

    local TLabel = vgui.Create("DLabel", DFrame)
    TLabel:SetPos(16, 77.5)
    TLabel:SetText(config.Language[config.LanguageToUse]["MenuRType"])
    TLabel:SetTextColor(Color(0, 0, 0, 255))
    TLabel:SizeToContents()

    local TypeBox = vgui.Create("DComboBox", DFrame)
    TypeBox:SetPos(170, 75)
    TypeBox:SetSize(65, 20)
    TypeBox:SetValue(config.Language[config.LanguageToUse]["MenuType"])
    TypeBox:AddChoice(config.Language[config.LanguageToUse]["Ban"])
    TypeBox:AddChoice(config.Language[config.LanguageToUse]["Exempt"])
    TypeBox.OnSelect = function(_, _, val)
      type = val
    end

    local PLabel = vgui.Create("DLabel", DFrame)
    PLabel:SetPos(16, 102.5)
    PLabel:SetText(config.Language[config.LanguageToUse]["Player"])
    PLabel:SetTextColor(Color(0, 0, 0, 255))
    PLabel:SizeToContents()

    local PlayerBox = vgui.Create("DComboBox", DFrame)
    PlayerBox:SetPos(170, 100)
    PlayerBox:SetSize(65, 20)
    PlayerBox:SetValue(config.Language[config.LanguageToUse]["Player"])
    for k, v in pairs(players) do
      PlayerBox:AddChoice(v.name)
    end
    PlayerBox.OnSelect = function(_, _, val)
      pta = val
    end

    local ReasonBox = vgui.Create("DTextEntry", DFrame)
    ReasonBox:SetPos(15, 135)
    ReasonBox:SetSize(220, 20)
    ReasonBox:SetValue(config.Language[config.LanguageToUse]["Reason"])
    ReasonBox:SelectAllOnFocus(true)
    ReasonBox:SetUpdateOnType(true)
    ReasonBox.OnChange = function()
      reason = ReasonBox:GetText()
    end

    local SubmitButton = vgui.Create("DButton", DFrame)
    SubmitButton:SetText(config.Language[config.LanguageToUse]["Submit"])
    SubmitButton:SetPos(15, 170)
    SubmitButton:SetSize(220, 20)
    SubmitButton.DoClick = function()
      local p = nil
      for k, v in pairs(players) do
        if pta == v.name then
          p = v.sid 
        end
      end

      if string.lower(type) == "ban" then
        net.Start("RASBanUser")
          net.WriteString(p)
          net.WriteString(reason)
          net.WriteString(string.lower(kind))
        net.SendToServer()
        DFrame:Close()
      elseif string.lower(type) == "exempt" then
        net.Start("RASExemptUser")
          net.WriteString(p)
          net.WriteString(reason)
          net.WriteString(string.lower(kind))
        net.SendToServer()
        DFrame:Close()
      end

      net.Start("RASBMenuRefreshSend")
      net.SendToServer()
      --DFrame:Refresh(true)
    end
  end
end)

net.Receive("RASBMenuRefresh", function(len, ply) 
  bans = net.ReadTable()
  exempts = net.ReadTable()
  players = net.ReadTable()
end)