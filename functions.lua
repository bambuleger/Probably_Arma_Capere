  -- =======================================
  --      Arma Capere - Arms Warrior PvE
  -- =======================================
  --          Optimized for T16 2P 
  -- =======================================
  -- If you have any questions, please ask
  -- https://probablyengine.com/forum/viewtopic.php?id=153
  -- =======================================

-----------------------------------------------------------------------------------------------------------------------------
-- Initialize Tables -------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
local armaCap = {} 

armaCap.queueSpell = nil
armaCap.queueTime = 0
-----------------------------------------------------------------------------------------------------------------------------
-- Notify Frame -- (c)xrn overlay for pqr -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.5 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    arc = CreateFrame("Frame",nil,ChatFrame1) 
    arc:SetSize(ChatFrame1:GetWidth(),30)
    arc:Hide()
    arc:SetScript("OnUpdate",onUpdate)
    arc:SetPoint("TOPLEFT",0,150)
    arc.text = arc:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    arc.text:SetAllPoints()
    arc.texture = arc:CreateTexture()
    arc.texture:SetAllPoints()
    arc.texture:SetTexture(0,0,0,.50) 
    arc.time = 0
    function arc:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
    
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.8 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    arc = CreateFrame("Frame",nil,ChatFrame1) 
    arc:SetSize(ChatFrame1:GetWidth(),30)
    arc:Hide()
    arc:SetScript("OnUpdate",onUpdate)
    arc:SetPoint("TOP",0,0)
    arc.text = arc:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    arc.text:SetAllPoints()
    arc.texture = arc:CreateTexture()
    arc.texture:SetAllPoints()
    arc.texture:SetTexture(0,0,0,.50) 
    arc.time = 0
    function arc:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
-----------------------------------------------------------------------------------------------------------------------------
-- Macros ------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
ProbablyEngine.command.register('arma', function(msg, box)
  local command, text = msg:match("^(%S*)%s*(.-)$")
-- Toggle -------------------------------------------------------------------------------------------------------------------
  if command == 'toggle' then
    if ProbablyEngine.toggle.states.MasterToggle then
        --ProbablyEngine.buttons.toggle('MasterToggle')
        ProbablyEngine.buttons.buttons['MasterToggle']:Click()
        arc:message("|cFFB30000Arma Capere off")
    else
        --ProbablyEngine.buttons.toggle('MasterToggle')
        ProbablyEngine.buttons.buttons['MasterToggle']:Click()
        arc:message("|cFF00B34AArma Capere on")
    end
  end
  if command == 'kick' then
    if ProbablyEngine.toggle.states.interrupt then
      --ProbablyEngine.buttons.toggle('interrupt')
      ProbablyEngine.buttons.buttons['interrupt']:Click()
      arc:message("|cFFB30000Interrupts off")
    else
      --ProbablyEngine.buttons.toggle('interrupt')
      ProbablyEngine.buttons.buttons['interrupt']:Click()
      arc:message("|cFF00B34AInterrupts on")
    end
  end

  if command == 'cds' then
    if ProbablyEngine.toggle.states.cooldowns then
      --ProbablyEngine.buttons.toggle('cooldowns')
      ProbablyEngine.buttons.buttons['cooldowns']:Click()
      arc:message("|cFFB30000Offensive Cooldowns off")
    else
      --ProbablyEngine.buttons.toggle('cooldowns')
      ProbablyEngine.buttons.buttons['cooldowns']:Click()
      arc:message("|cFF00B34AOffensive Cooldowns on")
    end
  end

  if command == 'aoe' then
    if ProbablyEngine.toggle.states.multitarget then
      --ProbablyEngine.buttons.toggle('multitarget')
      ProbablyEngine.buttons.buttons['multitarget']:Click()
      arc:message("|cFFB30000AoE off")
    else
      --ProbablyEngine.buttons.toggle('multitarget')
      ProbablyEngine.buttons.buttons['multitarget']:Click()
      arc:message("|cFF00B34AAoE on")
    end
  end
  
  if command == 'autobanner' then
    if ProbablyEngine.toggle.states.autobanner then
      --ProbablyEngine.buttons.toggle('autobanner')
      ProbablyEngine.buttons.buttons['autobanner']:Click()
      arc:message("|cFFB30000SoO Auto Skull Banner off")
    else
      --ProbablyEngine.buttons.toggle('autobanner')
      ProbablyEngine.buttons.buttons['autobanner']:Click()
      arc:message("|cFF00B34ASoO Auto Skull Banner on")
    end
  end

  if command == 'def' then
    if ProbablyEngine.toggle.states.guard then
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['def']:Click()
      arc:message("|cFFB30000Defensive Cooldowns off")
    else
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['def']:Click()
      arc:message("|cFF00B34ADefensive Cooldowns on")
    end
  end

  if command == 'macros' then
    armaCap.createAllMacros()
  end

  if command == 'help' then
    armaCap.macroHelp()
  end

-- Spell Queue -- thank you merq for basic code -----------------------------------------------------------------------------
  if command == "qSkullb" or command == 114207 then
    armaCap.queueSpell = 114207
    arc:message("Skull Banner queued")
  elseif command == "qShieldWall" or command == 871 then
    armaCap.queueSpell = 871
    arc:message("Shield Wall queued")
  elseif command == "qDiebtSw" or command == 118038 then
    armaCap.queueSpell = 118038
    arc:message("Die by the Sword queued")
  elseif command == "qDemob" or command == 114203 then
    armaCap.queueSpell = 114203
    arc:message("Demoralizing Banner queued")
  elseif command == "qRally" or command == 97462 then
    armaCap.queueSpell = 97462
    arc:message("Rallying Cry queued")
  elseif command == "qTfour" then
    if select(2,GetTalentRowSelectionInfo(4)) == 10 then
        armaCap.queueSpell = 46924
        arc:message("Bladestorm queued") 
    elseif select(2,GetTalentRowSelectionInfo(4)) == 11 then
        armaCap.queueSpell = 46968
        arc:message("Shockwave queued") 
    elseif select(2,GetTalentRowSelectionInfo(4)) == 12 then
        armaCap.queueSpell = 118000
        arc:message("Dragon Roar queued") 
    end
  elseif command == "qTfive" then
    if select(2,GetTalentRowSelectionInfo(5)) == 13 then
        armaCap.queueSpell = 114028
        arc:message("Mass Spell Reflection queued") 
    elseif select(2,GetTalentRowSelectionInfo(5)) == 14 then
        armaCap.queueSpell = 114029
        arc:message("Safeguard queued")
    elseif select(2,GetTalentRowSelectionInfo(5)) == 15 then
        armaCap.queueSpell = 114030
        arc:message("Vigilance queued")  
    end
  else
    armaCap.queueSpell = nil
  end
  if armaCap.queueSpell ~= nil then armaCap.queueTime = GetTime() end
end)
-----------------------------------------------------------------------------------------------------------------------------
-- Spell Queue Check -- thank you merq for basic code ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
armaCap.checkQueue = function (spellId)
    if (GetTime() - armaCap.queueTime) > 4 then
        armaCap.queueTime = 0
        armaCap.queueSpell = nil
    return false
    else
    if armaCap.queueSpell then
        if armaCap.queueSpell == spellId then
            if ProbablyEngine.parser.lastCast == GetSpellName(spellId) then
                armaCap.queueSpell = nil
                armaCap.queueTime = 0
            end
        return true
        end
    end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------
-- Create Macros ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
function armaCap.createAllMacros( ... )
  local usedslots = select(2,GetNumMacros())
  if usedslots <= 5 then
    CreateMacro("toggle", "Inv_sword_01", "/arma toggle", 1, 1)
    CreateMacro("kick", "inv_gauntlets_04", "#showtooltip Pummel\n/arma kick", 1, 1)
    CreateMacro("cds", "ability_criticalstrike", "/arma cds", 1, 1)
    CreateMacro("aoe", "Ability_warlock_jinx", "/arma aoe", 1, 1)
    CreateMacro("autobanner", "inv_banner_03", "/arma autobanner", 1, 1)
    CreateMacro("def", "Inv_shield_08", "/arma def", 1, 1)
    CreateMacro("qSkullb", "warrior_skullbanner", "#showtooltip Skull Banner\n/arma qSkullb", 1, 1)
    CreateMacro("qShieldWall", "ability_warrior_shieldwall", "#showtooltip Shield Wall\n/arma qShieldWall", 1, 1)
    CreateMacro("qDiebtSw", "ability_warrior_challange", "#showtooltip Die by the Sword\n/arma qDiebtSw", 1, 1)
    CreateMacro("qDemob", "demoralizing_banner", "#showtooltip Demoralizing Banner\n/arma qDemob", 1, 1)
    CreateMacro("qRally", "ability_toughness", "#showtooltip Rallying Cry\n/arma qRally", 1, 1)
    CreateMacro("qTfour", "ability_parry", "/arma qTfour", 1, 1)
    CreateMacro("qTfive", "ability_parry", "/arma qTfive", 1, 1)
  else
    print("You don't have enough free Macroslots")
  end
end  
-----------------------------------------------------------------------------------------------------------------------------
-- Create Help Message ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
function armaCap.macroHelp( ... )
  print("|cFFC79C6EArma Capere |rv1.1")
  print("|cFFC79C6ECommands:|r\n/arma macros - Create all Toggle / Spellqueue Macros")
  print("|cFFC79C6EToggle Macros:|r\n/arma toggle - Rotation on/off\n/arma kick - Interrupt & Disarm on/off\n/arma cds - Offensive Cooldowns on/off\n/arma aoe - Multitarget-Rotation on/off\n/arma autobanner - Auto Skull Banner on/off\n/arma def - Auto Defensive Cooldowns on/off")
  print("|cFFC79C6EQueue Macros:|r\n/arma qSkullb | qShieldWall | qDiebtSw | qDemob | qTfour | qTfive | qRally")
  print("|cFFC79C6EAdditional Help:|r\nhttp://tinyurl.com/armacap")
end  
-----------------------------------------------------------------------------------------------------------------------------
-- Healthstone -------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
function armaCap.Healthstone(...)
    local PlayerHP = 100 * UnitHealth("player") / UnitHealthMax("player")
    if PlayerHP < 40
    and GetItemCount(5512,false,false) > 0 
    and ( select(2, GetItemCooldown(5512)) == 0 ) then
        return true
    end
end 
-----------------------------------------------------------------------------------------------------------------------------
-- Register Library --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
ProbablyEngine.library.register("armaCap", armaCap)