if (SERVER) then
  RAS = {}

  RAS.MySQLInfo = {}

  RAS.Config = {}

  RAS.ExemptPlayers = {}
  RAS.BannedPlayers = {}

  RAS.Config.Chat = {}
  RAS.Config.Prop = {}
  RAS.Config.Sent = {}
  RAS.Config.Effect = {}
  RAS.Config.Ragdoll = {}
  RAS.Config.Vehicle = {}
  RAS.Config.Npc = {}

  MsgC(Color(255,255,255,255), "/////////////////////////////////////////////////\n")
  MsgC(Color(255,255,255,255), "//          RAS Loading... Created By:         //\n")
  MsgC(Color(255,255,255,255), "//               MexicanRaindeer               //\n")
  MsgC(Color(255,255,255,255), "/////////////////////////////////////////////////\n")

  local fol = "ras/"
  local files, folders = file.Find(fol .. "*", "LUA")
  local filesnumber = 0

  for k, v in pairs(files) do
    if string.GetExtensionFromFilename(v) == "lua" then
      include(fol .. v)
    end
  end

  for _, folder in SortedPairs(folders, true) do
    local localfilenum = 0
    for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
      AddCSLuaFile(fol .. folder .. "/" .. File)
      filesnumber = filesnumber + 1
      localfilenum = localfilenum + 1
    end
    for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
      include(fol .. folder .. "/" .. File)
      filesnumber = filesnumber + 1
      localfilenum = localfilenum + 1
    end
    for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
      include(fol .. folder .. "/" .. File)
      AddCSLuaFile(fol .. folder .. "/" .. File)
      filesnumber = filesnumber + 1
      localfilenum = localfilenum + 1
    end
    if localfilenum > 1 or localfilenum < 1 then
      local stringtoinput = folder .. " module loaded with " .. localfilenum .. " files!"
      local stringtoinputafter = ""
      local ftsub = string.len(stringtoinput)
      local spacestoins = 44 - ftsub
      for i = 1, spacestoins do
        stringtoinputafter = stringtoinputafter .. " "
      end
      MsgC(Color(255,255,255,255), "// " .. stringtoinput .. stringtoinputafter, Color(255,255,255,255), "//\n")
    else
      local stringtoinput = folder .. " module loaded with " .. localfilenum .. " file!"
      local stringtoinputafter = ""
      local ftsub = string.len(stringtoinput)
      local spacestoins = 44 - ftsub
      for i = 1, spacestoins do
        stringtoinputafter = stringtoinputafter .. " "
      end
      MsgC(Color(255,255,255,255), "// " .. stringtoinput .. stringtoinputafter, Color(255,255,255,255), "//\n")
    end
  end

  if !file.Exists("ras", "DATA") then
    file.CreateDir("ras")
  end

  if !file.Exists("ras/config.txt", "DATA") then
    file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
  else
    local data = file.Read("ras/config.txt", "DATA")
    RAS.Config = util.JSONToTable(data)
  end

  MsgC(Color(255,255,255,255), "/////////////////////////////////////////////////\n")
  MsgC(Color(255,255,255,255), "//                  RAS Loaded!                //\n")
  MsgC(Color(255,255,255,255), "/////////////////////////////////////////////////\n")
end

if (CLIENT) then
  RAS = {}
  RAS.Config = {}
  local fol = "ras/"
  local files, folders = file.Find(fol .. "*", "LUA")
  for k, v in pairs(files) do
    if string.GetExtensionFromFilename(v) == "lua" then
      include(fol .. v)
    end
  end
  for _, folder in SortedPairs(folders, true) do
    for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
      include(fol .. folder .. "/" .. File)
    end
    for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
      include(fol .. folder .. "/" .. File)
    end
  end
end
