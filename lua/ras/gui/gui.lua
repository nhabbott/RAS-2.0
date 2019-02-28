if (CLIENT) then
	surface.CreateFont( "RASfontclose", {
			font = "Lato Light",
			size = 25,
			weight = 250,
			antialias = true,
			strikeout = false,
			additive = true,
	} )

	surface.CreateFont( "RASTitleFont", {
		font = "Lato Light",
		size = 30,
		weight = 250,
		antialias = true,
		strikeout = false,
		additive = true,
	} )

	surface.CreateFont( "RASHeadingFont", {
		font = "Arial",
		size = 25,
		weight = 500,
	} )

	surface.CreateFont( "RASTextFont", {
		font = "Arial",
		size = 35,
		weight = 500,
	} )

	surface.CreateFont( "RASTextFontSmall", {
		font = "Arial",
		size = 25,
		weight = 500,
	} )

	surface.CreateFont( "RASTextFontExtraSmall", {
		font = "Arial",
		size = 20,
		weight = 500,
	} )

	surface.CreateFont( "RASNameFont", {
			font = "Lato Light",
			size = 46,
			weight = 250,
			antialias = true,
			strikeout = false,
			additive = true,
	} )

	surface.CreateFont( "RASFontSmall", {
			font = "Lato Light",
			size = 34,
			weight = 250,
			antialias = true,
			strikeout = false,
			additive = true,
	} )

	surface.CreateFont( "RASFont", {
			font = "Lato Light",
			size = 20,
			weight = 250,
			antialias = true,
			strikeout = false,
			additive = true,
	} )

	local blur = Material("pp/blurscreen")
	local function DrawBlur(panel, amount) --Panel blur function
		local x, y = panel:LocalToScreen(0, 0)
		local scrW, scrH = ScrW(), ScrH()
		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(blur)
		for i = 1, 6 do
			blur:SetFloat("$blur", (i / 3) * (amount or 6))
			blur:Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
		end
	end

	local function drawRectOutline( x, y, w, h, color )
		surface.SetDrawColor( color )
		surface.DrawOutlinedRect( x, y, w, h )
	end

	net.Receive("RASOpenConfigEditor", function()
		tbl = net.ReadTable()

		tfpick1 = tobool(tbl.AntiSpamming)
		tfpick2 = tobool(tbl.Chat.Enabled)
		tfpick3 = tobool(tbl.Prop.Enabled)
		tfpick4 = tobool(tbl.Sent.Enabled)
		tfpick5 = tobool(tbl.Effect.Enabled)
		tfpick6 = tobool(tbl.Ragdoll.Enabled)
		tfpick7 = tobool(tbl.Vehicle.Enabled)
		tfpick8 = tobool(tbl.Npc.Enabled)

		local function check(tfpick)
			if tfpick then
				return 1
			else
				return 0
			end
			return 0
		end

		local menu = vgui.Create( "DFrame" )
		menu:SetSize( 300, 480 )
		menu:Center()
		menu:SetDraggable( true )
		menu:MakePopup()
		menu:SetTitle( "" )
		menu:ShowCloseButton( false )
		menu.Paint = function( self, w, h )
			DrawBlur(menu, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 85))
			drawRectOutline( 2, 2, w - 4, h / 9.9, Color( 0, 0, 0, 85 ) )
			draw.RoundedBox(0, 2, 2, w - 4, h / 10, Color(0,0,0,125))
			draw.SimpleText( "RAS Config", "RASTitleFont", menu:GetWide() / 2, 25, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		local frameclose = vgui.Create( "DButton", menu )
		frameclose:SetSize( 35, 35 )
		frameclose:SetPos( menu:GetWide() - 34,10 )
		frameclose:SetText( "X" )
		frameclose:SetFont( "RASfontclose" )
		frameclose:SetTextColor( Color( 255, 255, 255 ) )
		frameclose.Paint = function()

		end
		frameclose.DoClick = function()
			menu:Close()
		end

		local label1 = vgui.Create("DLabel", menu)
		label1:SetText("Anti Spaming")
		label1:SetPos(20, 50)
		label1:SetSize(500, 25)
		label1:SetTextColor(Color(255,255,255))
		label1:SetFont("RASTextFontSmall")

		local Dermabox1 = vgui.Create( "DCheckBox", menu )
		Dermabox1:SetPos( 150, 55 )
		Dermabox1:SetValue( check(tfpick1) )

 		local label2 = vgui.Create("DLabel", menu)
		label2:SetText("Chat Protection")
		label2:SetPos(20, 75)
		label2:SetSize(500, 25)
		label2:SetTextColor(Color(255,255,255))
		label2:SetFont("RASTextFontSmall")

		local Dermabox2 = vgui.Create( "DCheckBox", menu )
		Dermabox2:SetPos( 175, 80 )
		Dermabox2:SetValue( check(tfpick2) )

  		local label3 = vgui.Create("DLabel", menu)
		label3:SetText("Chat delay")
		label3:SetPos(20, 100)
		label3:SetSize(500, 25)
		label3:SetTextColor(Color(255,255,255))
		label3:SetFont("RASTextFontSmall")

		local DermaNumSlider1 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider1:SetPos( 20, 100 )
		DermaNumSlider1:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider1:SetText( "" )
		DermaNumSlider1:SetMin( 0 )
		DermaNumSlider1:SetMax( 50 )
		DermaNumSlider1:SetValue( tonumber( tbl.Chat.Delay ) )
		DermaNumSlider1:SetDecimals( 0 )

 		local label4 = vgui.Create("DLabel", menu)
		label4:SetText("Prop Protection")
		label4:SetPos(20, 125)
		label4:SetSize(500, 25)
		label4:SetTextColor(Color(255,255,255))
		label4:SetFont("RASTextFontSmall")

		local Dermabox3 = vgui.Create( "DCheckBox", menu )
		Dermabox3:SetPos( 175, 130 )
		Dermabox3:SetValue( check(tfpick3) )

  		local label5 = vgui.Create("DLabel", menu)
		label5:SetText("Prop delay")
		label5:SetPos(20, 150)
		label5:SetSize(500, 25)
		label5:SetTextColor(Color(255,255,255))
		label5:SetFont("RASTextFontSmall")

		local DermaNumSlider2 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider2:SetPos( 20, 150 )
		DermaNumSlider2:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider2:SetText( "" )
		DermaNumSlider2:SetMin( 0 )
		DermaNumSlider2:SetMax( 50 )
		DermaNumSlider2:SetValue( tonumber( tbl.Prop.Delay ) )
		DermaNumSlider2:SetDecimals( 0 )

 		local label6 = vgui.Create("DLabel", menu)
		label6:SetText("Sent Protection")
		label6:SetPos(20, 175)
		label6:SetSize(500, 25)
		label6:SetTextColor(Color(255,255,255))
		label6:SetFont("RASTextFontSmall")

		local Dermabox4 = vgui.Create( "DCheckBox", menu )
		Dermabox4:SetPos( 175, 180 )
		Dermabox4:SetValue( check(tfpick4) )

  		local label7 = vgui.Create("DLabel", menu)
		label7:SetText("Sent delay")
		label7:SetPos(20, 200)
		label7:SetSize(500, 25)
		label7:SetTextColor(Color(255,255,255))
		label7:SetFont("RASTextFontSmall")

		local DermaNumSlider3 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider3:SetPos( 20, 200 )
		DermaNumSlider3:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider3:SetText( "" )
		DermaNumSlider3:SetMin( 0 )
		DermaNumSlider3:SetMax( 50 )
		DermaNumSlider3:SetValue( tonumber( tbl.Sent.Delay ) )
		DermaNumSlider3:SetDecimals( 0 )

 		local label8 = vgui.Create("DLabel", menu)
		label8:SetText("Effect Protection")
		label8:SetPos(20, 225)
		label8:SetSize(500, 25)
		label8:SetTextColor(Color(255,255,255))
		label8:SetFont("RASTextFontSmall")

		local Dermabox5 = vgui.Create( "DCheckBox", menu )
		Dermabox5:SetPos( 185, 230 )
		Dermabox5:SetValue( check(tfpick5) )

  		local label9 = vgui.Create("DLabel", menu)
		label9:SetText("Effect delay")
		label9:SetPos(20, 250)
		label9:SetSize(500, 25)
		label9:SetTextColor(Color(255,255,255))
		label9:SetFont("RASTextFontSmall")

		local DermaNumSlider4 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider4:SetPos( 25, 250 )
		DermaNumSlider4:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider4:SetText( "" )
		DermaNumSlider4:SetMin( 0 )
		DermaNumSlider4:SetMax( 50 )
		DermaNumSlider4:SetValue( tonumber( tbl.Effect.Delay ) )
		DermaNumSlider4:SetDecimals( 0 )

 		local label10 = vgui.Create("DLabel", menu)
		label10:SetText("Ragdoll Protection")
		label10:SetPos(20, 275)
		label10:SetSize(500, 25)
		label10:SetTextColor(Color(255,255,255))
		label10:SetFont("RASTextFontSmall")

		local Dermabox6 = vgui.Create( "DCheckBox", menu )
		Dermabox6:SetPos( 200, 280 )
		Dermabox6:SetValue( check(tfpick6) )

  		local label11 = vgui.Create("DLabel", menu)
		label11:SetText("Ragdoll delay")
		label11:SetPos(20, 300)
		label11:SetSize(500, 25)
		label11:SetTextColor(Color(255,255,255))
		label11:SetFont("RASTextFontSmall")

		local DermaNumSlider5 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider5:SetPos( 40, 300 )
		DermaNumSlider5:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider5:SetText( "" )
		DermaNumSlider5:SetMin( 0 )
		DermaNumSlider5:SetMax( 50 )
		DermaNumSlider5:SetValue( tonumber( tbl.Ragdoll.Delay ) )
		DermaNumSlider5:SetDecimals( 0 )

 		local label12 = vgui.Create("DLabel", menu)
		label12:SetText("Vehicle Protection")
		label12:SetPos(20, 325)
		label12:SetSize(500, 25)
		label12:SetTextColor(Color(255,255,255))
		label12:SetFont("RASTextFontSmall")

		local Dermabox7 = vgui.Create( "DCheckBox", menu )
		Dermabox7:SetPos( 200, 330 )
		Dermabox7:SetValue( check(tfpick7) )

  		local label13 = vgui.Create("DLabel", menu)
		label13:SetText("Vehicle delay")
		label13:SetPos(20, 350)
		label13:SetSize(500, 25)
		label13:SetTextColor(Color(255,255,255))
		label13:SetFont("RASTextFontSmall")

		local DermaNumSlider6 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider6:SetPos( 40, 350 )
		DermaNumSlider6:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider6:SetText( "" )
		DermaNumSlider6:SetMin( 0 )
		DermaNumSlider6:SetMax( 50 )
		DermaNumSlider6:SetValue( tonumber( tbl.Vehicle.Delay ) )
		DermaNumSlider6:SetDecimals( 0 )

 		local label14 = vgui.Create("DLabel", menu)
		label14:SetText("NPC Protection")
		label14:SetPos(20, 375)
		label14:SetSize(500, 25)
		label14:SetTextColor(Color(255,255,255))
		label14:SetFont("RASTextFontSmall")

		local Dermabox8 = vgui.Create( "DCheckBox", menu )
		Dermabox8:SetPos( 175, 380 )
		Dermabox8:SetValue( check(tfpick8) )

  		local label15 = vgui.Create("DLabel", menu)
		label15:SetText("NPC delay")
		label15:SetPos(20, 400)
		label15:SetSize(500, 25)
		label15:SetTextColor(Color(255,255,255))
		label15:SetFont("RASTextFontSmall")

		local DermaNumSlider7 = vgui.Create( "DNumSlider", menu )
		DermaNumSlider7:SetPos( 20, 400 )
		DermaNumSlider7:SetSize( menu:GetWide() - 40, 20 )
		DermaNumSlider7:SetText( "" )
		DermaNumSlider7:SetMin( 0 )
		DermaNumSlider7:SetMax( 50 )
		DermaNumSlider7:SetValue( tonumber( tbl.Npc.Delay ) )
		DermaNumSlider7:SetDecimals( 0 )

		local rbutton = vgui.Create( "DButton", menu )
		rbutton:SetPos( 20, 430 )
		rbutton:SetSize( menu:GetWide() - 30,20 )
		rbutton:SetText( "Reset to default" )
		rbutton:SetTextColor( Color( 255, 255, 255 ) )
		rbutton.Paint = function( self, w, h )
			DrawBlur(rbutton, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end
		rbutton.DoClick = function()
			net.Start("RASResetConfigOptions")
			net.SendToServer()
			menu:Remove()
		end

		local sbutton = vgui.Create( "DButton", menu )
		sbutton:SetPos( 20, 455 )
		sbutton:SetSize( menu:GetWide() - 30,20 )
		sbutton:SetText( "Save config" )
		sbutton:SetTextColor( Color( 255, 255, 255 ) )
		sbutton.Paint = function( self, w, h )
			DrawBlur(sbutton, 2)
			drawRectOutline( 0, 0, w, h, Color( 0, 0, 0, 85 ) )
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 125))
		end
		sbutton.DoClick = function()
			net.Start("RASSaveConfigOptions")
				net.WriteBool(Dermabox1:GetChecked())
				net.WriteBool(Dermabox2:GetChecked())
				net.WriteFloat(DermaNumSlider1:GetValue())
				net.WriteBool(Dermabox3:GetChecked())
				net.WriteFloat(DermaNumSlider1:GetValue())
				net.WriteBool(Dermabox4:GetChecked())
				net.WriteFloat(DermaNumSlider3:GetValue())
				net.WriteBool(Dermabox5:GetChecked())
				net.WriteFloat(DermaNumSlider4:GetValue())
				net.WriteBool(Dermabox6:GetChecked())
				net.WriteFloat(DermaNumSlider5:GetValue())
				net.WriteBool(Dermabox7:GetChecked())
				net.WriteFloat(DermaNumSlider6:GetValue())
				net.WriteBool(Dermabox8:GetChecked())
				net.WriteFloat(DermaNumSlider7:GetValue())
			net.SendToServer()
			menu:Remove()
		end

	end)
end
