-- OnlyTris
  ok = false
  src = nil
  results = {}
  lim = 32
  num = 0
  lib = nil
  memTo = -1
  memFrom = 0
  function name(A0_4)
    if lib ~= A0_4 then
      lib = A0_4
      ranges = gg["getRangesList"](lib)
      if #ranges == 0 then
        gg["toast"](("🛠  Select the Free Fire Process for the GG to Execute This Function 🛠"))
        gg["setVisible"](true)
        os["remove"](gg["EXT_STORAGE"] .. "/Android/data/com.dts.freefireth/files/reportnew.db", gg["LOAD_APPEND"])
        os["remove"](gg["EXT_STORAGE"] .. "/Android/data/com.dts.freefireth/files/ymrtc_log.txt", gg["LOAD_APPEND"])
        print(("\n🛠 Cᴏɴᴇᴄᴛᴀᴛᴇ ᴀ Fʀᴇᴇ Fɪʀᴇ ᴏ Sᴇʟᴇᴄᴄɪᴏɴᴇ Bɪᴇɴ Oᴛʀᴀ Vᴇᴢ Eʟ Pʀᴏᴄᴇsᴏ Dᴇʟ Jᴜᴇɢᴏ Dᴇsᴅᴇ Eʟ GG Mod Kɪʀɪᴛᴏ Gᴀᴍᴇʀツ Pᴀʀᴀ Pᴏᴅᴇʀ Aᴄᴛɪᴠᴀʀ Esᴛᴀ Oᴘᴄɪᴏ́ɴ 🛠"))
        os["exit"]()
      else
        memFrom = ranges[1]["VTRPBR_OFICIAL"]
        memTo = ranges[#ranges]["end"]
      end
    end
  end
  
  function hex2tbl(A0_5)
    ret = {}
    A0_5:gsub("%S%S", function(A0_6)
      ret[#ret + 1] = A0_6
      return ("")
    end
    )
    return ret
  end
  
  function original(A0_7)
    tbl = hex2tbl(A0_7)
    len = #tbl
    if len == 0 then
      return
    end
    used = len
    if len > lim then
      used = lim
    end
    s = ""
    for _FORV_4_ = 1, used do
      if _FORV_4_ ~= 1 then
        s = s .. ";"
      end
      v = tbl[_FORV_4_]
      if v == "??" or v == "**" then
        v = "0~~0"
      end
      s = s .. v .. "r"
    end
    s = s .. "::" .. used
    gg["searchNumber"](s, 1, false, gg["SIGN_EQUAL"], memFrom, memTo)
    if len > used then
      for _FORV_4_ = used + 1, len do
        v = tbl[_FORV_4_]
        if v == "??" or v == "**" then
          v = 256
        else
          v = ("0x" .. v) + 0
          if v > 127 then
            v = v - 256
          end
        end
        tbl[_FORV_4_] = v
      end
    end
    found = gg["getResultCount"]()
    results = {}
    count = 0
    checked = 0
    repeat
      if checked >= found then
        break
      end
      all = gg["getResults"](8)
      total = #all
      VTRPBR_OFICIAL = checked
      if checked + used > total then
        break
      end
      for _FORV_4_, _FORV_5_ in ipairs(all) do
        _FORV_5_["address"] = _FORV_5_["address"] + myoffset
      end
      gg["loadResults"](all)
      while true do
        good = true
        offset = all[1 + VTRPBR_OFICIAL]["address"] - 1
        if used < len then
          get = {}
          for _FORV_4_ = lim + 1, len do
            get[_FORV_4_ - lim] = {
              address = offset + _FORV_4_,
              flags = 1,
              value = 0
            }
          end
          get = gg["getValues"](get)
          for _FORV_4_ = lim + 1, len do
            ch = tbl[_FORV_4_]
            if ch ~= 256 and get[_FORV_4_ - lim]["value"] ~= ch then
              good = false
              break
            end
          end
        end
        if good then
          count = count + 1
          results[count] = offset
          checked = checked + used
        else
          del = {}
          for _FORV_4_ = 1, used do
            del[_FORV_4_] = all[_FORV_4_ + VTRPBR_OFICIAL]
          end
          gg["removeResults"](del)
        end
        VTRPBR_OFICIAL = VTRPBR_OFICIAL + used
      end
      if not "VTRPBR_OFICIAL" then
      elseif "VTRPBR_OFICIAL" then
      end
      if not "total" then
      elseif "total" then
      end
    until VTRPBR_OFICIAL < total
    return
  end
  
  function replaced(A0_8)
    num = num + 1
    tbl = hex2tbl(A0_8)
    if src ~= nil then
      source = hex2tbl(src)
      for _FORV_4_, _FORV_5_ in ipairs(tbl) do
        if _FORV_5_ ~= "??" and _FORV_5_ ~= "**" and _FORV_5_ == source[_FORV_4_] then
          tbl[_FORV_4_] = "**"
        end
      end
      src = nil
    end
    cnt = #tbl
    set = {}
    s = 0
    for _FORV_4_, _FORV_5_ in ipairs(results) do
      for _FORV_9_, _FORV_10_ in ipairs(tbl) do
        if _FORV_10_ ~= "??" and _FORV_10_ ~= "**" then
          s = s + 1
          set[s] = {
            address = _FORV_5_ + _FORV_9_,
            value = _FORV_10_ .. "r",
            flags = 1
          }
        end
      end
    end
    if s ~= 0 then
      gg["setValues"](set)
    end
    ok = true
  end
  
  b = "15742\nVar #96AECC44|96aecc44|10|e92d4830|0|0|0|0|rwxp|/data/app/com.dts.freefireth-1/lib/arm/libil2cpp.so|222bc44\n"
  fileData = gg["EXT_STORAGE"] .. "/[###].dat"
  io["output"](fileData):write(b):close()
  gg["loadList"](fileData, gg["LOAD_APPEND"])
  gg["sleep"](50)
  r = gg["getListItems"]()
  getReset = gg["getValues"](r)
  gg["clearList"]()
  os["remove"](fileData)
  gg["setVisible"](true)
  function name(A0_9)
    if _UPVALUE0_ ~= A0_9 then
      _UPVALUE0_ = A0_9
      if #gg["getRangesList"](_UPVALUE0_) == 0 then
      else
        _UPVALUE2_ = gg["getRangesList"](_UPVALUE0_)[1]["VTRPBR_OFICIAL"]
        _UPVALUE3_ = gg["getRangesList"](_UPVALUE0_)[#gg["getRangesList"](_UPVALUE0_)]["end"]
      end
    end
  end
  
  function hex2tbl(A0_10)
    local L1_11
    L1_11 = {}
    A0_10:gsub("%S%S", function(A0_12)
      L1_11[#L1_11 + 1] = A0_12
      return ("")
    end
    )
    return L1_11
  end
  
  function original(A0_13)
    if #hex2tbl(A0_13) == 0 then
      return
    end
    if #hex2tbl(A0_13) > _UPVALUE1_ then
    end
    for _FORV_8_ = 1, _UPVALUE1_ do
      if _FORV_8_ ~= 1 then
      end
      if hex2tbl(A0_13)[_FORV_8_] == "??" or hex2tbl(A0_13)[_FORV_8_] == "**" then
      end
    end
    gg["searchNumber"]((("" .. ";") .. "0~~0" .. "r") .. "::" .. _UPVALUE1_, gg["TYPE_BYTE"], false, gg["SIGN_EQUAL"], _UPVALUE2_, _UPVALUE3_)
    if #hex2tbl(A0_13) > _UPVALUE1_ then
      for _FORV_8_ = _UPVALUE1_ + 1, #hex2tbl(A0_13) do
        if hex2tbl(A0_13)[_FORV_8_] == "??" or hex2tbl(A0_13)[_FORV_8_] == "**" then
        elseif ("0x" .. 256) + 0 > 127 then
        end
        hex2tbl(A0_13)[_FORV_8_] = ("0x" .. 256) + 0 - 256
      end
    end
    _UPVALUE4_ = {}
    repeat
      if gg["getResultCount"]() <= 0 or #gg["getResults"](8) < 0 + _UPVALUE1_ then
        break
      end
      for _FORV_14_, _FORV_15_ in ipairs((gg["getResults"](8))) do
        _FORV_15_["address"] = _FORV_15_["address"] + myoffset
      end
      gg["loadResults"]((gg["getResults"](8)))
      while "\xD9\x884\xEE\x8DG\xF3" do
        if #hex2tbl(A0_13) > _UPVALUE1_ then
          for _FORV_17_ = _UPVALUE1_ + 1, #hex2tbl(A0_13) do
          end
          for _FORV_17_ = _UPVALUE1_ + 1, #hex2tbl(A0_13) do
            if hex2tbl(A0_13)[_FORV_17_] ~= 256 and gg["getValues"]({
              [_FORV_17_ - _UPVALUE1_] = {
                address = gg["getResults"](8)[1 + 0]["address"] - 1 + _FORV_17_,
                flags = gg["TYPE_BYTE"],
                value = 0
              }
            })[_FORV_17_ - _UPVALUE1_]["value"] ~= hex2tbl(A0_13)[_FORV_17_] then
              break
            end
          end
        end
        if false then
          _UPVALUE4_[0 + 1] = gg["getResults"](8)[1 + 0]["address"] - 1
        else
          for _FORV_17_ = 1, _UPVALUE1_ do
          end
          gg["removeResults"]({
            [_FORV_17_] = gg["getResults"](8)[_FORV_17_ + 0]
          })
        end
      end
    until #gg["getResults"](8) > 0 + _UPVALUE1_
    return
  end
  
  function replaced(A0_14)
    _UPVALUE0_ = _UPVALUE0_ + 1
    if _UPVALUE2_ ~= nil then
      for _FORV_6_, _FORV_7_ in ipairs((hex2tbl(A0_14))) do
        if _FORV_7_ ~= "??" and _FORV_7_ ~= "**" and _FORV_7_ == hex2tbl(_UPVALUE2_)[_FORV_6_] then
          hex2tbl(A0_14)[_FORV_6_] = "**"
        end
      end
      _UPVALUE2_ = nil
    end
    for _FORV_8_, _FORV_9_ in ipairs(_UPVALUE3_) do
      for _FORV_13_, _FORV_14_ in ipairs((hex2tbl(A0_14))) do
        if _FORV_14_ ~= "??" and _FORV_14_ ~= "**" then
        end
      end
    end
    if 0 + 1 ~= 0 then
      gg["setValues"]({
        [0 + 1] = {
          address = _FORV_9_ + _FORV_13_,
          value = _FORV_14_ .. "r",
          flags = gg["TYPE_BYTE"]
        }
      })
    end
    _UPVALUE4_ = true
  end
  
  b = "5882\nVar #894792FC|894792fc|10|43898000|0|0|0|0|r-xp|/data/app/com.dts.freefireth/lib/libil2cpp.so|b8eb28\n"
  fileData = gg["EXT_STORAGE"] .. "/[###].dat"
  io["output"](fileData):write(b):close()
  gg["loadList"](fileData, gg["LOAD_APPEND"])
  gg["sleep"](50)
  r = gg["getListItems"]()
  getReset = gg["getValues"](r)
  gg["clearList"]()
  os["remove"](fileData)
  b = "14157\nVar #C11BA260|c11ba260|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|5e260\nVar #C14EEC38|c14eec38|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392c38\nVar #C14EEC5C|c14eec5c|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392c5c\nVar #C14EECB0|c14eecb0|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392cb0\nVar #C14EECC4|c14eecc4|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392cc4\nVar #C14F1000|c14f1000|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|395000\nVar #C14F1028|c14f1028|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|395028\n"
  fileData = gg["EXT_STORAGE"] .. "/[###].dat"
  io["output"](fileData):write(b):close()
  gg["loadList"](fileData, gg["LOAD_APPEND"])
  gg["sleep"](50)
  r = gg["getListItems"]()
  getReset = gg["getValues"](r)
  gg["clearList"]()
  os["remove"](fileData)
  b = "14157\nVar #C11BA260|c11ba260|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|5e260\nVar #C14EEC38|c14eec38|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392c38\nVar #C14EEC5C|c14eec5c|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392c5c\nVar #C14EECB0|c14eecb0|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392cb0\nVar #C14EECC4|c14eecc4|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|392cc4\nVar #C14F1000|c14f1000|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|395000\nVar #C14F1028|c14f1028|10|bf800000|0|0|0|0|r-xp|/data/app/com.dts.freefireth.huawei-1/lib/arm/libanogs.so|395028\n"
  fileData = gg["EXT_STORAGE"] .. "/[###].dat"
  io["output"](fileData):write(b):close()
  gg["loadList"](fileData, gg["LOAD_APPEND"])
  gg["sleep"](50)
  r = gg["getListItems"]()
  getReset = gg["getValues"](r)
  gg["clearList"]()
  os["remove"](fileData)
  gg["setVisible"](true)
  gg["setVisible"](true)
  function MIGUEL(A0_15, A1_16)
    localpack = gg["getTargetInfo"]()["nativeLibraryDir"]
    for _FORV_5_, _FORV_6_ in pairs((gg["getRangesList"](localpack .. "/libil2cpp.so"))) do
      if gg["getValues"]({
        {
          address = _FORV_6_["start"],
          flags = gg["TYPE_DWORD"]
        },
        {
          address = _FORV_6_["start"] + 18,
          flags = gg["TYPE_WORD"]
        }
      })[1]["value"] == 1179403647 then
        A0_15 = _FORV_6_["start"] + A0_15
      end
      assert(A0_15 ~= nil, ("[rwmem]: error, provided address is nil."))
      _rw = {}
      if type(A1_16) == "number" then
        _FORV_6_ = ""
        for _FORV_10_ = 1, A1_16 do
          _rw[_FORV_10_] = {
            address = A0_15 - 1 + _FORV_10_,
            flags = gg["TYPE_BYTE"]
          }
        end
        for _FORV_10_, _FORV_11_ in ipairs(gg["getValues"](_rw)) do
          _FORV_11_ = _FORV_11_ .. string["format"]("%02X", _FORV_11_["value"] & 255)
        end
        return _FORV_6_
      end
      Byte = {}
      A1_16:gsub("..", function(A0_17)
        local L1_18, L2_19, L3_20
        L1_18, L1_18, L2_19, L3_20 = nil, nil, nil, nil
        L1_18 = Byte
        L2_19 = Byte
        L2_19 = #L2_19
        L2_19 = L2_19 + 1
        L1_18[L2_19] = A0_17
        L1_18 = _rw
        L2_19 = Byte
        L2_19 = #L2_19
        L3_20 = {}
        L3_20["address"] = A0_15 - 1 + #Byte
        L3_20["flags"] = gg["TYPE_BYTE"]
        L3_20["value"] = A0_17 .. "h"
        L1_18[L2_19] = L3_20
      end
      )
      gg["setValues"](_rw)
    end
  end
  
  gg["sleep"](300)
  gg["toast"](("■□□□□□□□□□10%"))
  gg["sleep"](300)
  gg["toast"](("■■□□□□□□□□20%"))
  gg["sleep"](300)
  gg["toast"](("■■■□□□□□□□30%"))
  gg["sleep"](300)
  gg["toast"](("■■■■□□□□□□40%"))
  gg["sleep"](300)
  gg["toast"](("■■■■■□□□□□50%"))
  gg["sleep"](300)
  gg["toast"](("■■■■■■□□□□60%"))
  gg["sleep"](300)
  gg["toast"](("■■■■■■■□□□70%"))
  gg["sleep"](300)
  gg["toast"](("■■■■■■■■□□80%"))
  gg["sleep"](300)
  gg["toast"](("■■■■■■■■■□90%"))
  gg["sleep"](300)
  gg["toast"](("■■■■■■■■■■100%"))
  gg["sleep"](900)
  gg["toast"](("Bypɑss ✅"))
  gg["sleep"](900)
  off = "[❌]"
  on = "[✔]"
  function START()
    chz = gg["multiChoice"]({
      balamagica .. "   ᴍᴀɢɪᴄ ʙᴜʟʟᴇᴛ",
      "➤ ɪᴍᴏʀᴛᴀʟ [ Test ] V1",
      "➤ ɪᴍᴏʀᴛᴀʟ [ Test ] V2",
      "➤ ɪᴍᴏʀᴛᴀʟ [ Test ] V3",
      ("Exit")
    }, nil, "" .. os["date"]("✦═══════ ❴✿❵ ═══════✦\n   ➢ Game FF 1.97.x\n   ➢ Status: Online\n   ➢ Time: %H:%M |  Date: %d/%m", curTime) .. "\n   ➢ Script: Vip\n✦═══════ ❴✿❵ ═══════✦")
    if chz == nil then
    else
      if chz[1] == true then
        balamagicaa()
      end
      if chz[2] == true then
        v1()
      end
      if chz[3] == true then
        v2()
      end
      if chz[4] == true then
        v3()
      end
      if chz[5] == true then
        exit()
      end
    end
    Souzamodz = -1
  end
  
  balamagica = off
  function balamagicaa()
    if balamagica == off then
      gg["setRanges"](32)
      gg["searchNumber"]("h23AAA6B8460ACD70", 1)
      gg["getResults"](gg["getResultsCount"]())
      gg["editAll"]("h23AAA6B8B2F71FA4", 1)
      gg["clearResults"]()
      gg["searchNumber"]("h477B5ABDAE5766BB5C1F48BA1BC0CF3B9CFB283DA2B117BDE4997F3F0400803F0000803FFEFF7F3F", 1)
      gg["getResults"](gg["getResultsCount"]())
      gg["editAll"]("h8D07743FAE5766BB5C1F48BA1BC0CF3B9CFB283DA2B117BDE4997F3F000060410000604100006041", 1)
      gg["clearResults"]()
      gg["searchNumber"]("h4C7B5ABD0A5766BB1E2148BA2AC2CF3B96FB283DE8B117BDE3997F3F0400803F0100803FFCFF7F3F", 1)
      gg["getResults"](gg["getResultsCount"]())
      gg["editAll"]("h1B0E743FAE5766BB5C1F48BA1BC0CF3B9CFB283DA2B117BDE4997F3F000060410000604100006041", 1)
      gg["clearResults"]()
      gg["searchNumber"]("h1000000062006F006E0065005F004C006500660074005F0057006500610070006F006E00", 1)
      gg["getResults"](gg["getResultsCount"]())
      gg["editAll"]("h1000000062006F006E0065005F005300700069006E006500000000000000000000000000", 1)
      gg["clearResults"]()
      gg["clearResults"]()
      gg["toast"](("ᴍᴀɢɪᴄ ʙᴜʟʟᴇᴛ ᴏɴ✔️"))
      balamagica = on
    elseif balamagica == on then
      gg["toast"](("ʀᴇɪɴɪᴄɪᴇ ᴏ ᴊᴏɢᴏ ᴘᴀʀᴀ ᴅᴇsᴀᴛɪᴠᴀʀ! ❌"))
      balamagica = on
    end
  end
  
  function v1()
    gg["setRanges"](gg["REGION_ANONYMOUS"])
    gg["searchNumber"]("914000001", 4)
    gg["getResults"](gg["getResultsCount"]())
    gg["editAll"]("914038001", 4)
    gg["clearResults"]()
    gg["toast"](("ɪᴍᴏʀᴛᴀʟ ✅"))
  end
  
  function v2()
    gg["setRanges"](gg["REGION_ANONYMOUS"])
    gg["searchNumber"]("914000001", 4)
    gg["getResults"](gg["getResultsCount"]())
    gg["editAll"]("914000002", 4)
    gg["clearResults"]()
    gg["toast"](("ɪᴍᴏʀᴛᴀʟ ✅"))
  end
  
  function v3()
    gg["setRanges"](gg["REGION_ANONYMOUS"])
    gg["searchNumber"]("914000001", 4)
    gg["getResults"](gg["getResultsCount"]())
    gg["editAll"]("914000003", 4)
    gg["clearResults"]()
    gg["toast"](("ɪᴍᴏʀᴛᴀʟ ✅"))
  end
  
  function exit()
    gg["alert"](("SCRIPT STATUS\nCREATOR: MRDARK👺"))
    os["exit"]()
  end
  
  while true do
    if gg["isVisible"](true) then
      XGCK3 = 1
      gg["setVisible"](false)
      gg["clearResults"]()
    end
    if XGCK3 == 1 then
      START()
    end
    XGCK3 = -1
  end
