
if SERVER then AddCSLuaFile() return end

--START OF CONFIG

local replacePropsTab = { --Any usergroup in this table will have the custom props menu
    "usergroup1"
}

local config = {
    [language.GetPhrase("spawnmenu.category.npcs")] = { --Any usergroup in this table can't see the NPCs tab
        "usergroup1",
        "usergroup2"
    },
    [language.GetPhrase("spawnmenu.category.entities")] = { --Any usergroup in this table can't see the Entities tab
        "usergroup1",
        "usergroup2"
    },
    [language.GetPhrase("spawnmenu.category.weapons")] = { --Any usergroup in this table can't see the Weapons tab
        "usergroup1",
        "usergroup2"
    },
    [language.GetPhrase("spawnmenu.category.vehicles")] = { --Any usergroup in this table can't see the Vehicles tab
        "usergroup1",
        "usergroup2"
    },
    [language.GetPhrase("spawnmenu.category.postprocess")] = { --Any usergroup in this table can't see the Post Process tab
        "usergroup1",
        "usergroup2"
    },
    [language.GetPhrase("spawnmenu.category.dupes")] = { --Any usergroup in this table can't see the Dupes tab
        "usergroup1",
        "usergroup2"
    },
    [language.GetPhrase("spawnmenu.category.saves")] = { --Any usergroup in this table can't see the Saves tab
        "usergroup1",
        "usergroup2"
    }
}

--END OF CONFIG

hook.Add("SpawnMenuOpen", "TomQMenuRestrict.SpawnMenuOpen", function()
    local usergroup = LocalPlayer():GetUserGroup()

    for k, v in pairs(g_SpawnMenu.CreateMenu.Items) do
        if v.Tab:GetText() == language.GetPhrase("spawnmenu.content_tab") and table.HasValue(replacePropsTab, usergroup) then
            g_SpawnMenu.CreateMenu:CloseTab( v.Tab, true )
        end

        if !config[v.Tab:GetText()] then continue end
        if table.HasValue(config[v.Tab:GetText()], usergroup) then
            g_SpawnMenu.CreateMenu:CloseTab(v.Tab, true)
        end
    end
end)

hook.Remove("OnSaveSpawnlist", "DoSaveSpawnlist") 