--$Name:Return of Red Riding Hood, New Adventures$
--$Name(ru):Возвращение Красной Шапочки, новые приключения$
--$Version:1.02$
--$Author:NLB project$
instead_version '2.3.0'

--package.cpath = './?.so'
require 'luapassing'

require 'prefs'
require 'xact'
require 'nouse'
require 'hideinv'
--require 'para'
require 'dash'
require 'snapshots'
require 'theme'
require 'timer'
require 'modules/nlb'
require 'modules/fonts'
require 'modules/paginator'
require 'modules/vn'
require 'modules/gobj'
game.codepage='UTF-8';
stead.scene_delim = '^';

game.act = function() nlb:curloc().lasttext = 'Nothing happens.'; p(nlb:curloc().lasttext); nlb:curloc().wastext = true; end;
game.inv = function() nlb:curloc().lasttext = 'Hm... This is strange thing...'; p(nlb:curloc().lasttext); nlb:curloc().wastext = true; end;
game.nouse = function() nlb:curloc().lasttext = 'Does not work...'; p(nlb:curloc().lasttext); nlb:curloc().wastext = true; end;
game.forcedsc = false;
paginator.delim = '\n[ \t]*\n'
function exec(s)
    p('$'..s:gsub('\n', '^')..'$^^')
end
function init()
    statsAPI.init();
    if dice then
        paginator:set_onproceed(function()
            dice:hide(true);
            -- Use code below if you want smooth rollout animation and text change on next step
            --if dice:hide() then
            --    return
            --end
        end);
    end
    vn:scene(nil);
    nlbticks = stead.ticks();
    _export_lang = 'en';
    _syscall_showmenubtn:act();
    format.quotes = false;
    if not prefs.achievements_max then
        prefs.achievements_max = {};
    end
    if not prefs.achievements_ids then
        prefs.achievements_ids = {};
    end
    if not prefs.achievements_ids['MAIN_MENU'] then prefs.achievements_ids['MAIN_MENU'] = {}; end;
    prefs:store();
    nlb:resendAchievements(statsAPI);
    initializeVariables();
end

_version_obj = gobj {
    nam = 'version_obj',
    system_type = true,
    pic = 'gfx/version.png',
    txtfn = function(s) return { [1] = {['text'] = '1.02', ['color'] = 'white' } }; end,
    eff = 'left-top@0,0',
    iarm = {[0] = {0, 16}}

}

-- In INSTEAD, when using the snapshots module, you will run into unpredictable behaviour if the variable is not initialized yet.
-- More specifically, if the value is nil, it won't be included in the snapshot & therefore will not be overwritten when the snapshot is loaded.
-- So, for example, if the flag was initially nil, then you make snapshot, then you walked into location which sets this flag to true,
-- than when loading the snapshot the value of the flag will NOT change back to nil.
-- That's why we should initialize all nil variables on start (so that they equal false or 0 or '', but not nil).
function initializeVariables()
    if _version_holder_obj == nil then
        _version_holder_obj = false;
    end
    if _seen_main_menu == nil then
        _seen_main_menu = 0;
    end
    if _back2menu == nil then
        _back2menu = false;
    end
    if _credits == nil then
        _credits = false;
    end
    if _intro == nil then
        _intro = false;
    end
    if _our_games == nil then
        _our_games = false;
    end
end

-- 
v_a4cef361_0298_4788_a0cb_327257883d49 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'a4cef361-0298-4788-a0cb-327257883d49',
    deref = function(s) return stead.deref(v_a4cef361_0298_4788_a0cb_327257883d49); end,
    nam = 'v_a4cef361_0298_4788_a0cb_327257883d49',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by RochesterLoki^"..
"{https://musescore.com/user/66635/scores/114768}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/66635/scores/114768");
    end,
};

-- nlblogo_in
v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf = gobj {
    var { tag = ''; container = function() return v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc; end; },
    nlbid = 'd4b18a63-4da0-4b5b-ab8a-3da3f6dc16bf',
    deref = function(s) return stead.deref(v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf); end,
    nam = 'nlblogo_in',
    eff = 'fadein-middle-middle@0,0',
    maxStep = 68,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/nlblogo.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_nlblogo_in = v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf
-- back2menuObj
v_bb4991ef_0c52_45a7_92f9_10ade18afaef = nlbmenu {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'bb4991ef-0c52-45a7-92f9-10ade18afaef',
    deref = function(s) return stead.deref(v_bb4991ef_0c52_45a7_92f9_10ade18afaef); end,
    nam = 'back2menuObj',
    snd = function(s) 
    end,
    disp = function(s) return "Back" end,
    dscf = function(s) end,
    dsc = function(s) p(s.dscf(s)); end,
    tak = function(s)
        s.act(s);
        return true;
    end,
    menu = function(s)
        return s.act(s);
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Back";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_back2menu =  true ;
    end,
};

_back2menuObj = v_bb4991ef_0c52_45a7_92f9_10ade18afaef
-- 
v_c6830a05_c040_4488_970c_1cc082fac5fa = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'c6830a05-c040-4488-970c-1cc082fac5fa',
    deref = function(s) return stead.deref(v_c6830a05_c040_4488_970c_1cc082fac5fa); end,
    nam = 'v_c6830a05_c040_4488_970c_1cc082fac5fa',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Special thanks for the awesome model of wolf:^"..
"Dennis Haupt aka DennisH2010^"..
"{http://www.blendswap.com/blends/view/24800}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://www.blendswap.com/blends/view/24800");
    end,
};

-- russianOutObj
v_da368deb_0207_479b_96ba_87b1c1ae4159 = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = 'da368deb-0207-479b-96ba-87b1c1ae4159',
    deref = function(s) return stead.deref(v_da368deb_0207_479b_96ba_87b1c1ae4159); end,
    nam = 'russianOutObj',
    eff = 'middle-middle@277,-248',
    morphover = function(s) return v_f3c09bc0_96f8_424a_9f3c_e7621f1dde98:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/russian.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_russianOutObj = v_da368deb_0207_479b_96ba_87b1c1ae4159
-- loadGameOverObj
v_4965a77e_89c1_489d_ac34_00fd06266729 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '4965a77e-89c1-489d-ac34-00fd06266729',
    deref = function(s) return stead.deref(v_4965a77e_89c1_489d_ac34_00fd06266729); end,
    nam = 'loadGameOverObj',
    eff = 'middle-middle@251,-53',
    morphout = function(s) return v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_menu_load);
    end,
    pic = function(s)
        if (true) then
            return 'images/load_game_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_loadGameOverObj = v_4965a77e_89c1_489d_ac34_00fd06266729
-- 
v_1ad8b242_09f7_416d_87c6_10db7318648e = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '1ad8b242-09f7-416d-87c6-10db7318648e',
    deref = function(s) return stead.deref(v_1ad8b242_09f7_416d_87c6_10db7318648e); end,
    nam = 'v_1ad8b242_09f7_416d_87c6_10db7318648e',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"== Software ==^"..
"INSTEAD^"..
"Simple Text Adventure, The Interpreter^"..
"For Unix and Windows^"..
"{http://instead.syscall.ru}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://instead.syscall.ru");
    end,
};

-- 
v_1faf185c_7b96_454b_bd3c_1c68886c3d00 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '1faf185c-7b96-454b-bd3c-1c68886c3d00',
    deref = function(s) return stead.deref(v_1faf185c_7b96_454b_bd3c_1c68886c3d00); end,
    nam = 'v_1faf185c_7b96_454b_bd3c_1c68886c3d00',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Low Poly Bunny Rabbit (Rigged) by bertling^"..
"{https://www.blendswap.com/blends/view/81060}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.blendswap.com/blends/view/81060");
    end,
};

-- 
v_3ceb65ce_f520_49f8_aa12_6745544b5c3e = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '3ceb65ce-f520-49f8-aa12-6745544b5c3e',
    deref = function(s) return stead.deref(v_3ceb65ce_f520_49f8_aa12_6745544b5c3e); end,
    nam = 'v_3ceb65ce_f520_49f8_aa12_6745544b5c3e',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Musette D major BMW Anh 126 by Johann Sebastian Bach,^"..
"{https://www.youtube.com/watch?v=6mXUbBppMcY}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=6mXUbBppMcY");
    end,
};

-- creditsOutObj
v_b476964e_29f8_4a1f_af08_73765a6b92d3 = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = 'b476964e-29f8-4a1f-af08-73765a6b92d3',
    deref = function(s) return stead.deref(v_b476964e_29f8_4a1f_af08_73765a6b92d3); end,
    nam = 'creditsOutObj',
    eff = 'middle-middle@265,101',
    morphover = function(s) return v_a109d8ab_90cf_46cd_9a4d_18c7f908b704:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/credits.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_creditsOutObj = v_b476964e_29f8_4a1f_af08_73765a6b92d3
-- 
v_fb325b80_3494_470d_8b3a_c9fe020cf94d = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'fb325b80-3494-470d-8b3a-c9fe020cf94d',
    deref = function(s) return stead.deref(v_fb325b80_3494_470d_8b3a_c9fe020cf94d); end,
    nam = 'v_fb325b80_3494_470d_8b3a_c9fe020cf94d',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by ScH^"..
"{https://musescore.com/user/161743/scores/222166}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/161743/scores/222166");
    end,
};

-- 
v_76c5c7bf_0ce5_47a0_a945_254063ee11b9 = nlbobj {
    var { tag = ''; container = function() return v_6104baf7_01b3_4e7b_9eba_1377f12009a7; end; },
    nlbid = '76c5c7bf-0ce5-47a0-a945-254063ee11b9',
    deref = function(s) return stead.deref(v_76c5c7bf_0ce5_47a0_a945_254063ee11b9); end,
    nam = 'v_76c5c7bf_0ce5_47a0_a945_254063ee11b9',
    snd = function(s) 
    end,
    disp = function(s) return s.imgv(s).."" end,
    dscf = function(s) return "^"..
"{"..s.imgv(s).."    The Adventurous Four}^"..
"It is the sequel to the visual novel \"Wild Island Quest\". You will have to go on a journey full of dangers and adventures, where the main characters are young people connected by their solid friendship."; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "The Adventurous Four";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://store.steampowered.com/app/815070/The_Adventurous_Four/");
    end,
    pic = function(s)
        if (true) then
            return 'images/advfour.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

-- 
v_2e187c0d_1e47_4f4a_bdc1_fb4f07c6ebfb = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '2e187c0d-1e47-4f4a-bdc1-fb4f07c6ebfb',
    deref = function(s) return stead.deref(v_2e187c0d_1e47_4f4a_bdc1_fb4f07c6ebfb); end,
    nam = 'v_2e187c0d_1e47_4f4a_bdc1_fb4f07c6ebfb',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Symphony No. 5, originally written by Ludwig van Beethoven,^"..
"{https://www.youtube.com/watch?v=6z4KK7RWjmk}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=6z4KK7RWjmk");
    end,
};

-- 
v_7d6ef07f_a9e9_4f34_88f3_d26ac88dde55 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '7d6ef07f-a9e9-4f34-88f3-d26ac88dde55',
    deref = function(s) return stead.deref(v_7d6ef07f_a9e9_4f34_88f3_d26ac88dde55); end,
    nam = 'v_7d6ef07f_a9e9_4f34_88f3_d26ac88dde55',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"GIMP^"..
"GNU Image Manipulation Program^"..
"{https://www.gimp.org/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.gimp.org/");
    end,
};

-- version_holder_obj
v_43243a00_7e14_49eb_a1b7_afbad9eb6df2 = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = '43243a00-7e14-49eb-a1b7-afbad9eb6df2',
    deref = function(s) return stead.deref(v_43243a00_7e14_49eb_a1b7_afbad9eb6df2); end,
    nam = 'version_holder_obj',
    eff = 'left-bottom@0,0',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/version_holder.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_version_holder_obj = v_43243a00_7e14_49eb_a1b7_afbad9eb6df2
-- 
v_d180f174_cffe_42a9_81bb_d4154e129d17 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'd180f174-cffe-42a9-81bb-d4154e129d17',
    deref = function(s) return stead.deref(v_d180f174_cffe_42a9_81bb_d4154e129d17); end,
    nam = 'v_d180f174_cffe_42a9_81bb_d4154e129d17',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by MickeyCs^"..
"{https://musescore.com/user/18700/scores/74655}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/18700/scores/74655");
    end,
};

-- presents_out
v_3978214c_072b_44e9_92e9_a9749927b2c0 = gobj {
    var { tag = ''; container = function() return v_a135a9ec_65be_4774_b2c5_14e06026385c; end; },
    nlbid = '3978214c-072b-44e9-92e9-a9749927b2c0',
    deref = function(s) return stead.deref(v_3978214c_072b_44e9_92e9_a9749927b2c0); end,
    nam = 'presents_out',
    eff = 'fadeout-middle-middle@0,0',
    maxStep = 68,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/presents.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_presents_out = v_3978214c_072b_44e9_92e9_a9749927b2c0
-- 
v_4acb3d44_760b_47a3_bbde_a3624251f799 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '4acb3d44-760b-47a3-bbde-a3624251f799',
    deref = function(s) return stead.deref(v_4acb3d44_760b_47a3_bbde_a3624251f799); end,
    nam = 'v_4acb3d44_760b_47a3_bbde_a3624251f799',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"== Fonts ==^"..
"Steinem Unicode^"..
"© 2001 Apostrophic Labs. All rights reserved.^"..
"Free for commercial use.^"..
"{http://www.1001fonts.com/steinem-font.html}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://www.1001fonts.com/steinem-font.html");
    end,
};

-- nlblogo_out
v_60e27336_12ef_4702_b1cb_d9b822a36fcc = gobj {
    var { tag = ''; container = function() return v_5bd37bb6_9454_4388_b33d_291d4ccd20ce; end; },
    nlbid = '60e27336-12ef-4702-b1cb-d9b822a36fcc',
    deref = function(s) return stead.deref(v_60e27336_12ef_4702_b1cb_d9b822a36fcc); end,
    nam = 'nlblogo_out',
    eff = 'fadeout-middle-middle@0,0',
    maxStep = 68,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/nlblogo.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_nlblogo_out = v_60e27336_12ef_4702_b1cb_d9b822a36fcc
-- ourGamesOverObj
v_55c9b789_a33a_47df_8d37_5b7dcca7f989 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '55c9b789-a33a-47df-8d37-5b7dcca7f989',
    deref = function(s) return stead.deref(v_55c9b789_a33a_47df_8d37_5b7dcca7f989); end,
    nam = 'ourGamesOverObj',
    eff = 'left-top@0,900',
    morphout = function(s) return v_ec014653_9193_4399_8185_eea017b96b35:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_our_games = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/our_games_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_ourGamesOverObj = v_55c9b789_a33a_47df_8d37_5b7dcca7f989
-- 
v_84ae1bd1_458c_405a_bba8_f7bdd996b682 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '84ae1bd1-458c-405a-bba8-f7bdd996b682',
    deref = function(s) return stead.deref(v_84ae1bd1_458c_405a_bba8_f7bdd996b682); end,
    nam = 'v_84ae1bd1_458c_405a_bba8_f7bdd996b682',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"== Music ==^"..
"Some tracks were written by NLB project team.^"..
"{https://nlbproject.com}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://nlbproject.com");
    end,
};

-- 
v_2b5d88c5_11f6_493d_829d_2c49de7c5e26 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '2b5d88c5-11f6-493d-829d-2c49de7c5e26',
    deref = function(s) return stead.deref(v_2b5d88c5_11f6_493d_829d_2c49de7c5e26); end,
    nam = 'v_2b5d88c5_11f6_493d_829d_2c49de7c5e26',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Sonata No. 14 \"Moonlight\" by Ludwig van Beethoven,^"..
"{https://www.youtube.com/watch?v=4Tr0otuiQuU}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=4Tr0otuiQuU");
    end,
};

-- 
v_107b0bce_dc04_4bf4_bd03_7c046cbe71e9 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '107b0bce-dc04-4bf4-bd03-7c046cbe71e9',
    deref = function(s) return stead.deref(v_107b0bce_dc04_4bf4_bd03_7c046cbe71e9); end,
    nam = 'v_107b0bce_dc04_4bf4_bd03_7c046cbe71e9',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Audacity^"..
"free, open source, cross-platform audio software^"..
"for multi-track recording and editing.^"..
"{https://www.audacityteam.org/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.audacityteam.org/");
    end,
};

-- 
v_24af92d2_5d0c_48d4_89f2_c50f31e29aab = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '24af92d2-5d0c-48d4-89f2-c50f31e29aab',
    deref = function(s) return stead.deref(v_24af92d2_5d0c_48d4_89f2_c50f31e29aab); end,
    nam = 'v_24af92d2_5d0c_48d4_89f2_c50f31e29aab',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Chanson Triste, by Pyotr Ilyich Tchaikovsky,^"..
"{https://www.youtube.com/watch?v=T3COuOkizgA}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=T3COuOkizgA");
    end,
};

-- skipObj
v_04d2f69b_7b46_45ab_854d_dbb230454344 = gobj {
preserved = true,
    var { tag = ''; container = function() return v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc; end; },
    nlbid = '04d2f69b-7b46-45ab-854d-dbb230454344',
    actonkey = function(s, down, key)
        if down then
            s:actf();
        end
        return down;
    end,
    deref = function(s) return stead.deref(v_04d2f69b_7b46_45ab_854d_dbb230454344); end,
    nam = 'skipObj',
    eff = 'right-top@0',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    alive = function(s)
        return (_intro) and s:cont_alive();
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_intro =  false ;
nlb:nlbwalk(nil, v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8);
    end,
    pic = function(s)
        if (true) then
            return 'images/skip.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_04d2f69b_7b46_45ab_854d_dbb230454344');
_skipObj = v_04d2f69b_7b46_45ab_854d_dbb230454344
-- 
v_8ee3fa56_a35c_417c_9bbe_bc61d6b050c6 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '8ee3fa56-a35c-417c-9bbe-bc61d6b050c6',
    deref = function(s) return stead.deref(v_8ee3fa56_a35c_417c_9bbe_bc61d6b050c6); end,
    nam = 'v_8ee3fa56_a35c_417c_9bbe_bc61d6b050c6',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by Seungtae Steven Kim^"..
"{https://musescore.com/user/127562/scores/162053}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/127562/scores/162053");
    end,
};

-- presents_in
v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b = gobj {
    var { tag = ''; container = function() return v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1; end; },
    nlbid = '0b66da23-7a3d-4bd9-a9a6-b3bfd8e0c58b',
    deref = function(s) return stead.deref(v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b); end,
    nam = 'presents_in',
    eff = 'fadein-middle-middle@0,0',
    maxStep = 68,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/presents.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_presents_in = v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b
-- optionsOverObj
v_92f6f6a4_04f6_4aa7_a75c_59a1acdea2da = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '92f6f6a4-04f6-4aa7-a75c-59a1acdea2da',
    deref = function(s) return stead.deref(v_92f6f6a4_04f6_4aa7_a75c_59a1acdea2da); end,
    nam = 'optionsOverObj',
    eff = 'middle-middle@270,253',
    morphout = function(s) return v_5943beec_862b_406c_b4fc_ae4a8f03a21e:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_menu);
    end,
    pic = function(s)
        if (true) then
            return 'images/options_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_optionsOverObj = v_92f6f6a4_04f6_4aa7_a75c_59a1acdea2da
-- creditsOverObj
v_a109d8ab_90cf_46cd_9a4d_18c7f908b704 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'a109d8ab-90cf-46cd-9a4d-18c7f908b704',
    deref = function(s) return stead.deref(v_a109d8ab_90cf_46cd_9a4d_18c7f908b704); end,
    nam = 'creditsOverObj',
    eff = 'middle-middle@265,101',
    morphout = function(s) return v_b476964e_29f8_4a1f_af08_73765a6b92d3:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_credits = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/credits_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_creditsOverObj = v_a109d8ab_90cf_46cd_9a4d_18c7f908b704
-- 
v_5080431d_08f0_4f38_b293_4d0ed9736e16 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '5080431d-08f0-4f38-b293-4d0ed9736e16',
    deref = function(s) return stead.deref(v_5080431d_08f0_4f38_b293_4d0ed9736e16); end,
    nam = 'v_5080431d_08f0_4f38_b293_4d0ed9736e16',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Blender^"..
"Free & Open Source 3D Creation Suite^"..
"{https://www.blender.org/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.blender.org/");
    end,
};

-- 
v_82557da3_7f02_4996_9961_211e71e919b2 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '82557da3-7f02-4996-9961-211e71e919b2',
    deref = function(s) return stead.deref(v_82557da3_7f02_4996_9961_211e71e919b2); end,
    nam = 'v_82557da3_7f02_4996_9961_211e71e919b2',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"== Tracks from http://musescore.org ==^"..
"\"Flight of the Bumblebee\", orchestral interlude originally written by Nikolai Rimsky-Korsakov^"..
"{https://www.youtube.com/watch?v=aYAJopwEYv8}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=aYAJopwEYv8");
    end,
};

-- 
v_e9e4cf1b_911f_48a2_9ee5_8e880e9fc926 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'e9e4cf1b-911f-48a2-9ee5-8e880e9fc926',
    deref = function(s) return stead.deref(v_e9e4cf1b_911f_48a2_9ee5_8e880e9fc926); end,
    nam = 'v_e9e4cf1b_911f_48a2_9ee5_8e880e9fc926',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"== 3D graphics ==^"..
"reddeer by chip^"..
"{https://www.blendswap.com/blends/view/21278}^"..
"^"..
"Cave bear by Mark Loftesnes (blenderman95)^"..
"http://www.blendswap.com/blends/view/76630"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.blendswap.com/blends/view/21278");
    end,
};

-- optionsOutObj
v_5943beec_862b_406c_b4fc_ae4a8f03a21e = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = '5943beec-862b-406c-b4fc-ae4a8f03a21e',
    deref = function(s) return stead.deref(v_5943beec_862b_406c_b4fc_ae4a8f03a21e); end,
    nam = 'optionsOutObj',
    eff = 'middle-middle@270,253',
    morphover = function(s) return v_92f6f6a4_04f6_4aa7_a75c_59a1acdea2da:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/options.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_optionsOutObj = v_5943beec_862b_406c_b4fc_ae4a8f03a21e
-- 
v_797a2da9_e518_4e6d_930e_29d75f211db7 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '797a2da9-e518-4e6d-930e-29d75f211db7',
    deref = function(s) return stead.deref(v_797a2da9_e518_4e6d_930e_29d75f211db7); end,
    nam = 'v_797a2da9_e518_4e6d_930e_29d75f211db7',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Flohwalzer variations^"..
"{https://www.youtube.com/watch?v=M5O0EuWmLgM}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=M5O0EuWmLgM");
    end,
};

-- 
v_61072012_2883_4387_a31e_246ae60fbc8c = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '61072012-2883-4387-a31e-246ae60fbc8c',
    deref = function(s) return stead.deref(v_61072012_2883_4387_a31e_246ae60fbc8c); end,
    nam = 'v_61072012_2883_4387_a31e_246ae60fbc8c',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by PT8475^"..
"{https://musescore.com/user/49518/scores/70393}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/49518/scores/70393");
    end,
};

-- 
v_7da3027b_822e_453d_8cee_893d6f189a8d = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '7da3027b-822e-453d-8cee-893d6f189a8d',
    deref = function(s) return stead.deref(v_7da3027b_822e_453d_8cee_893d6f189a8d); end,
    nam = 'v_7da3027b_822e_453d_8cee_893d6f189a8d',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Coriolan Overture, Op. 62, composed by Ludwig van Beethoven^"..
"{https://musopen.org/music/1549/ludwig-van-beethoven/coriolan-overture-op-62/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musopen.org/music/1549/ludwig-van-beethoven/coriolan-overture-op-62/");
    end,
};

-- 
v_1a3d32ec_5719_40d9_8275_eced8e90ff82 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '1a3d32ec-5719-40d9-8275-eced8e90ff82',
    deref = function(s) return stead.deref(v_1a3d32ec_5719_40d9_8275_eced8e90ff82); end,
    nam = 'v_1a3d32ec_5719_40d9_8275_eced8e90ff82',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Overture to William Tell by Gioachino Antonio Rossini,^"..
"{https://musopen.org/music/461/gioachino-antonio-rossini/overture-to-william-tell/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musopen.org/music/461/gioachino-antonio-rossini/overture-to-william-tell/");
    end,
};

-- 
v_20fcf939_1dbe_477e_b62d_5eaa8831cb8c = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '20fcf939-1dbe-477e-b62d-5eaa8831cb8c',
    deref = function(s) return stead.deref(v_20fcf939_1dbe_477e_b62d_5eaa8831cb8c); end,
    nam = 'v_20fcf939_1dbe_477e_b62d_5eaa8831cb8c',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by horydadr^"..
"{https://musescore.com/user/62886/scores/169834}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/62886/scores/169834");
    end,
};

-- englishOverObj
v_ca290951_f649_459c_bd23_d04a26667e5b = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'ca290951-f649-459c-bd23-d04a26667e5b',
    deref = function(s) return stead.deref(v_ca290951_f649_459c_bd23_d04a26667e5b); end,
    nam = 'englishOverObj',
    eff = 'middle-middle@273,-433',
    morphout = function(s) return v_248ae96e_a969_4583_b4e6_16215496a13e:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_starten);
    end,
    pic = function(s)
        if (true) then
            return 'images/english_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_englishOverObj = v_ca290951_f649_459c_bd23_d04a26667e5b
-- 
v_09e3dfe7_48ec_4510_bc7c_c1d850b16e84 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '09e3dfe7-48ec-4510-bc7c-c1d850b16e84',
    deref = function(s) return stead.deref(v_09e3dfe7_48ec_4510_bc7c_c1d850b16e84); end,
    nam = 'v_09e3dfe7_48ec_4510_bc7c_c1d850b16e84',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"In the Halls of the Frost Giant Jarl by John Arthur Wolfrey^"..
"(based on the Edvard Grieg\'s Mountain King)^"..
"Submitted by joakimwo^"..
"{https://musescore.com/user/140902/scores/147690}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/140902/scores/147690");
    end,
};

-- 
v_c40021fb_866a_4f3a_a3ad_13c8c7d96f42 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'c40021fb-866a-4f3a-a3ad-13c8c7d96f42',
    deref = function(s) return stead.deref(v_c40021fb_866a_4f3a_a3ad_13c8c7d96f42); end,
    nam = 'v_c40021fb_866a_4f3a_a3ad_13c8c7d96f42',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Toccata and Fugue in D minor, BWV 565 by Johann Sebastian Bach, performed by Paul Pitman^"..
"{https://musopen.org/music/730/johann-sebastian-bach/toccata-and-fugue-in-dm-bwv-565/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musopen.org/music/730/johann-sebastian-bach/toccata-and-fugue-in-dm-bwv-565/");
    end,
};

-- loadGameOutObj
v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = '26baf5c3-7f9d-4b4d-b956-5cd3774c114c',
    deref = function(s) return stead.deref(v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c); end,
    nam = 'loadGameOutObj',
    eff = 'middle-middle@251,-53',
    morphover = function(s) return v_4965a77e_89c1_489d_ac34_00fd06266729:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/load_game.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_loadGameOutObj = v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c
-- 
v_d9cc21f5_f95b_4300_8971_1733183e1ab9 = nlbobj {
    var { tag = ''; container = function() return v_6104baf7_01b3_4e7b_9eba_1377f12009a7; end; },
    nlbid = 'd9cc21f5-f95b-4300-8971-1733183e1ab9',
    deref = function(s) return stead.deref(v_d9cc21f5_f95b_4300_8971_1733183e1ab9); end,
    nam = 'v_d9cc21f5_f95b_4300_8971_1733183e1ab9',
    snd = function(s) 
    end,
    disp = function(s) return s.imgv(s).."" end,
    dscf = function(s) return "^^"..
"{"..s.imgv(s).."    Return of Red Riding Hood Enhanced Edition}^"..
"It is a visual novel with elements of a text adventure quest. The main characters keep getting into funny situations, and how they\'re going to find their way out depends on you."; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Return of Red Riding Hood Enhanced Edition";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://store.steampowered.com/app/594320/Return_of_Red_Riding_Hood_Enhanced_Edition/");
    end,
    pic = function(s)
        if (true) then
            return 'images/red_hood.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

-- 
v_3b458b75_c53f_41c7_94c9_f43327811822 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '3b458b75-c53f-41c7-94c9-f43327811822',
    deref = function(s) return stead.deref(v_3b458b75_c53f_41c7_94c9_f43327811822); end,
    nam = 'v_3b458b75_c53f_41c7_94c9_f43327811822',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Excerpt from Movement 1 of Tchaikovsky Symphony no. 4,^"..
"{https://youtu.be/iAfQIcmqfmk?t=784}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://youtu.be/iAfQIcmqfmk?t=784");
    end,
};

-- 
v_cc5ebee8_54ee_438a_8468_3811c4e57291 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'cc5ebee8-54ee-438a-8468-3811c4e57291',
    deref = function(s) return stead.deref(v_cc5ebee8_54ee_438a_8468_3811c4e57291); end,
    nam = 'v_cc5ebee8_54ee_438a_8468_3811c4e57291',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"== Text ==^"..
"NLB project team.^"..
"Special thanks for English translation proofreading: Greg Wilcox.^"..
"{https://fanboydestroy.com}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://fanboydestroy.com");
    end,
};

-- ourGamesOutObj
v_ec014653_9193_4399_8185_eea017b96b35 = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = 'ec014653-9193-4399-8185-eea017b96b35',
    deref = function(s) return stead.deref(v_ec014653_9193_4399_8185_eea017b96b35); end,
    nam = 'ourGamesOutObj',
    eff = 'left-top@0,900',
    morphover = function(s) return v_55c9b789_a33a_47df_8d37_5b7dcca7f989:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/our_games.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_ourGamesOutObj = v_ec014653_9193_4399_8185_eea017b96b35
-- 
v_7ba7ae39_80b4_4b1e_9fbd_7221f7327872 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '7ba7ae39-80b4-4b1e-9fbd-7221f7327872',
    deref = function(s) return stead.deref(v_7ba7ae39_80b4_4b1e_9fbd_7221f7327872); end,
    nam = 'v_7ba7ae39_80b4_4b1e_9fbd_7221f7327872',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Studies on Chopin\'s Etudes No.1, Leopold Godowsky,^"..
"{https://www.youtube.com/watch?v=zF3sDRMjI34}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=zF3sDRMjI34");
    end,
};

-- 
v_7d24e710_f4cb_4d72_9ae7_ffdd0b5e4c29 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '7d24e710-f4cb-4d72-9ae7-ffdd0b5e4c29',
    deref = function(s) return stead.deref(v_7d24e710_f4cb_4d72_9ae7_ffdd0b5e4c29); end,
    nam = 'v_7d24e710_f4cb_4d72_9ae7_ffdd0b5e4c29',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "== Pictures ==^"..
"Pictures in the bedroom: \"Птица Сва-Слава\", \"Хорс\"^"..
"Andrey Shishkin {http://a-shishkin.ru/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://a-shishkin.ru/");
    end,
};

-- 
v_66edebcb_50ca_4edb_89e3_bdd513cfcfd0 = nlbobj {
    var { tag = ''; container = function() return v_6104baf7_01b3_4e7b_9eba_1377f12009a7; end; },
    nlbid = '66edebcb-50ca-4edb-89e3-bdd513cfcfd0',
    deref = function(s) return stead.deref(v_66edebcb_50ca_4edb_89e3_bdd513cfcfd0); end,
    nam = 'v_66edebcb_50ca_4edb_89e3_bdd513cfcfd0',
    snd = function(s) 
    end,
    disp = function(s) return s.imgv(s).."" end,
    dscf = function(s) return "^^"..
"{"..s.imgv(s).."    Wild Island Quest}^"..
"It is visual novel about traveling teenagers on a dangerous flying island."; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Wild Island Quest";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://store.steampowered.com/app/392820/Wild_Island_Quest/");
    end,
    pic = function(s)
        if (true) then
            return 'images/wild_island_quest.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

-- 
v_b8c712cf_585e_4660_bdfd_1fe68d7163a2 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'b8c712cf-585e-4660-bdfd-1fe68d7163a2',
    deref = function(s) return stead.deref(v_b8c712cf_585e_4660_bdfd_1fe68d7163a2); end,
    nam = 'v_b8c712cf_585e_4660_bdfd_1fe68d7163a2',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"La Marmotte \"A Merry Song\" Op. 52 No. 7 by Ludwig van Beethoven,^"..
"{https://www.youtube.com/watch?v=yLl5kAcWrAs}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=yLl5kAcWrAs");
    end,
};

-- exitOutObj
v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = 'aaa5f6c7-a75d-4599-a519-00ee5977ba7d',
    deref = function(s) return stead.deref(v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d); end,
    nam = 'exitOutObj',
    eff = 'middle-middle@203,417',
    morphover = function(s) return v_7069e536_c763_4098_ad91_8f25c74280c9:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/exit.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_exitOutObj = v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d
-- exitOverObj
v_7069e536_c763_4098_ad91_8f25c74280c9 = gobj {
collapsable = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '7069e536-c763-4098-ad91-8f25c74280c9',
    deref = function(s) return stead.deref(v_7069e536_c763_4098_ad91_8f25c74280c9); end,
    nam = 'exitOverObj',
    eff = 'middle-middle@203,417',
    morphout = function(s) return v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_menu_exit);
        local v = vn:glookup(stead.deref(s));
        if s.is_paused then
            vn:vpause(v, false);
        else
            vn:set_step(v, nil, not v.forward);
        end
        vn:start();
    end,
    pic = function(s)
        if (true) then
            return 'images/exit_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_exitOverObj = v_7069e536_c763_4098_ad91_8f25c74280c9
-- 
v_914a61df_c426_4829_8864_99f5aaa6f164 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '914a61df-c426-4829-8864-99f5aaa6f164',
    deref = function(s) return stead.deref(v_914a61df_c426_4829_8864_99f5aaa6f164); end,
    nam = 'v_914a61df_c426_4829_8864_99f5aaa6f164',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by smart246^"..
"{https://musescore.com/user/1072556/scores/3271071}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/1072556/scores/3271071");
    end,
};

-- 
v_b0d3de0f_a304_4601_8e89_1cd26dc4e809 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'b0d3de0f-a304-4601-8e89-1cd26dc4e809',
    deref = function(s) return stead.deref(v_b0d3de0f_a304_4601_8e89_1cd26dc4e809); end,
    nam = 'v_b0d3de0f_a304_4601_8e89_1cd26dc4e809',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"Submitted by users Austin, Entire Music^"..
"{https://musescore.com/user/1905/scores/4487}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/1905/scores/4487");
    end,
};

-- russianOverObj
v_f3c09bc0_96f8_424a_9f3c_e7621f1dde98 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'f3c09bc0-96f8-424a-9f3c-e7621f1dde98',
    deref = function(s) return stead.deref(v_f3c09bc0_96f8_424a_9f3c_e7621f1dde98); end,
    nam = 'russianOverObj',
    eff = 'middle-middle@277,-248',
    morphout = function(s) return v_da368deb_0207_479b_96ba_87b1c1ae4159:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_startru);
    end,
    pic = function(s)
        if (true) then
            return 'images/russian_over.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_russianOverObj = v_f3c09bc0_96f8_424a_9f3c_e7621f1dde98
-- 
v_42b813e7_1ca4_4a4e_a6ab_629f72efddfc = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '42b813e7-1ca4-4a4e-a6ab-629f72efddfc',
    deref = function(s) return stead.deref(v_42b813e7_1ca4_4a4e_a6ab_629f72efddfc); end,
    nam = 'v_42b813e7_1ca4_4a4e_a6ab_629f72efddfc',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Mozart - Violin Concerto No.3 , 1st Mov.,^"..
"{https://www.youtube.com/watch?v=CrpvZYkeM3s}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=CrpvZYkeM3s");
    end,
};

-- 
v_4c23d348_b87a_4929_b929_2bc39c87a583 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '4c23d348-b87a-4929-b929-2bc39c87a583',
    deref = function(s) return stead.deref(v_4c23d348_b87a_4929_b929_2bc39c87a583); end,
    nam = 'v_4c23d348_b87a_4929_b929_2bc39c87a583',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Bocklin^"..
"Copyright © 1990-2001 by George Williams^"..
"{https://www.1001fonts.com/bocklin-font.html}^"..
"^"..
"Redistribution and use in source and binary forms, with or without^"..
"modification, are permitted provided that the following conditions^"..
"are met:^"..
"^"..
"Redistributions of source code must retain the above copyright^"..
"notice, this list of conditions and the following disclaimer.^"..
"^"..
"Redistributions in binary form must reproduce the above copyright^"..
"notice, this list of conditions and the following disclaimer in^"..
"the documentation and/or other materials provided with the^"..
"distribution.^"..
"^"..
"The name of the author may not be used to endorse or promote^"..
"products derived from this software without specific prior^"..
"written permission.^"..
"^"..
"THIS SOFTWARE IS PROVIDED BY THE AUTHOR \"AS IS\" AND ANY^"..
"EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED^"..
"TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS^"..
"FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL^"..
"THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,^"..
"SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,^"..
"BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR^"..
"SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS^"..
"INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF^"..
"LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT^"..
"(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT^"..
"OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE^"..
"POSSIBILITY OF SUCH DAMAGE."; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.1001fonts.com/bocklin-font.html");
    end,
};

-- 
v_930585ec_bbe5_473b_acd4_ed6f3a2605d7 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '930585ec-bbe5-473b-acd4-ed6f3a2605d7',
    deref = function(s) return stead.deref(v_930585ec_bbe5_473b_acd4_ed6f3a2605d7); end,
    nam = 'v_930585ec_bbe5_473b_acd4_ed6f3a2605d7',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Non-Linear Book Builder^"..
"Open Source tool for making interactive stories^"..
"{https://nlbproject.com/soft.html}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://nlbproject.com/soft.html");
    end,
};

-- 
v_d5260fb9_dfd5_4c7e_a447_a328fb400a09 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'd5260fb9-dfd5-4c7e-a447-a328fb400a09',
    deref = function(s) return stead.deref(v_d5260fb9_dfd5_4c7e_a447_a328fb400a09); end,
    nam = 'v_d5260fb9_dfd5_4c7e_a447_a328fb400a09',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Piano Sonata No. 16 (K 545) Allegro by W.A. Mozart,^"..
"{https://www.youtube.com/watch?v=HmkVBf01XhQ}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://www.youtube.com/watch?v=HmkVBf01XhQ");
    end,
};

-- 
v_fdc08234_89c5_4dd2_a57b_026bc07e86f0 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'fdc08234-89c5-4dd2-a57b-026bc07e86f0',
    deref = function(s) return stead.deref(v_fdc08234_89c5_4dd2_a57b_026bc07e86f0); end,
    nam = 'v_fdc08234_89c5_4dd2_a57b_026bc07e86f0',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"MakeHuman^"..
"Open Source tool for making 3D characters^"..
"{http://www.makehuman.org/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://www.makehuman.org/");
    end,
};

-- 
v_eb58dab3_3e56_427d_ae99_787b986dfe72 = nlbobj {
    var { tag = ''; container = function() return v_6104baf7_01b3_4e7b_9eba_1377f12009a7; end; },
    nlbid = 'eb58dab3-3e56-427d-ae99-787b986dfe72',
    deref = function(s) return stead.deref(v_eb58dab3_3e56_427d_ae99_787b986dfe72); end,
    nam = 'v_eb58dab3_3e56_427d_ae99_787b986dfe72',
    snd = function(s) 
    end,
    disp = function(s) return s.imgv(s).."" end,
    dscf = function(s) return "^^"..
"{"..s.imgv(s).."    The Barbarian and the Subterranean Caves}^"..
"It is an adventure themed visual novel, where you\'ll have to make lots of choices and follow many different branching paths to know the full story and unmask the evildoer."; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "The Barbarian and the Subterranean Caves";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("http://store.steampowered.com/app/490690/The_Barbarian_and_the_Subterranean_Caves/");
    end,
    pic = function(s)
        if (true) then
            return 'images/the_barbarian.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

-- 
v_42266c7d_0a53_482d_875a_9395519c3157 = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '42266c7d-0a53-482d-875a-9395519c3157',
    deref = function(s) return stead.deref(v_42266c7d_0a53_482d_875a_9395519c3157); end,
    nam = 'v_42266c7d_0a53_482d_875a_9395519c3157',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by J.S.G. Fernandez^"..
"{https://musescore.com/user/55219/scores/110272}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/55219/scores/110272");
    end,
};

-- 
v_cfd7c121_b2ef_41f4_8063_ff897d20c92a = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = 'cfd7c121-b2ef-41f4-8063-ff897d20c92a',
    deref = function(s) return stead.deref(v_cfd7c121_b2ef_41f4_8063_ff897d20c92a); end,
    nam = 'v_cfd7c121_b2ef_41f4_8063_ff897d20c92a',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by Jenne Van Antwerpen^"..
"{https://musescore.com/user/53615/scores/143812}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/53615/scores/143812");
    end,
};

-- 
v_1072b77b_1115_46a6_b017_f840a73572eb = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '1072b77b-1115-46a6-b017-f840a73572eb',
    deref = function(s) return stead.deref(v_1072b77b_1115_46a6_b017_f840a73572eb); end,
    nam = 'v_1072b77b_1115_46a6_b017_f840a73572eb',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"submitted by PetraV^"..
"{https://musescore.com/user/153042/scores/164396}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.com/user/153042/scores/164396");
    end,
};

-- 
v_11acd3a9_3989_4c01_b9de_c927f15f09ea = nlbobj {
    var { tag = ''; container = function() return v_b097ad4f_f32d_41d7_acb9_b69632ce070c; end; },
    nlbid = '11acd3a9-3989-4c01-b9de-c927f15f09ea',
    deref = function(s) return stead.deref(v_11acd3a9_3989_4c01_b9de_c927f15f09ea); end,
    nam = 'v_11acd3a9_3989_4c01_b9de_c927f15f09ea',
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) return "^"..
"^"..
"Musescore^"..
"World\'s most popular notation software^"..
"{https://musescore.org/}"; end,
    dsc = function(s) p(s.dscf(s)); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
statsAPI.openURL("https://musescore.org/");
    end,
};

-- englishOutObj
v_248ae96e_a969_4583_b4e6_16215496a13e = gobj {
    var { tag = ''; container = function() return v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8; end; },
    nlbid = '248ae96e-a969-4583-b4e6-16215496a13e',
    deref = function(s) return stead.deref(v_248ae96e_a969_4583_b4e6_16215496a13e); end,
    nam = 'englishOutObj',
    eff = 'middle-middle@273,-433',
    morphover = function(s) return v_ca290951_f649_459c_bd23_d04a26667e5b:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/english.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_englishOutObj = v_248ae96e_a969_4583_b4e6_16215496a13e
-- 
main, v_489e8c3a_519a_4587_bedd_1d291036b82a = room { nam = 'main', enter = function(s) nlb:nlbwalk(s, v_489e8c3a_519a_4587_bedd_1d291036b82a); end }, room {
    nam = 'Return of Red Riding Hood, New Adventures',
    nosave = true,
    notes = '',
    bgimg = function(s)
return nlb:std_bg();
    end,
    pic = function(s)
    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = true,
    way = {
    },
    xdsc = function(s)
        p(nlb:alts_txt(s));
    end,
    wcns = {
    },
    alts = {
    },
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if ((_seen_main_menu ~= nil) and (_seen_main_menu <= 0)) then         nlb:nlbwalk(v_489e8c3a_519a_4587_bedd_1d291036b82a, v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc); 
        return false;
 end;
        if ((_seen_main_menu ~= nil) and (_seen_main_menu > 0)) then         nlb:nlbwalk(v_489e8c3a_519a_4587_bedd_1d291036b82a, v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8); 
        return false;
 end;
        vn:standard_renew();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_489e8c3a_519a_4587_bedd_1d291036b82a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_standard.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
            nlb:addf(v_43243a00_7e14_49eb_a1b7_afbad9eb6df2, _version_obj, false);
_seen_main_menu = nlb:getAchievement(statsAPI, 'MAIN_MENU');
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/a_la_mozart.ogg', 0);
        s.nextsnd(s);
    end,
    sndout = function(s) end,
    obj = { 
        xdsc()
    },
};

-- 
v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8 = vnr {
    nam = 'Return of Red Riding Hood, New Adventures',
    nosave = true,
    notes = '',
    bgimg = function(s)
        if (true) then
            return 'images/menu.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if ((_credits)) then     _credits =  false ;
    nlb:actf(_syscall_hud_dark_sparse);
                nlb:addf(nil, v_bb4991ef_0c52_45a7_92f9_10ade18afaef, false);
        nlb:nlbwalk(v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8, v_b097ad4f_f32d_41d7_acb9_b69632ce070c); 

        return false;
 end;
        if ((_intro)) then         nlb:nlbwalk(v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8, v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc); 

        return false;
 end;
        if ((_our_games)) then     _our_games =  false ;
    nlb:actf(_syscall_hud_dark_sparse);
                nlb:addf(nil, v_bb4991ef_0c52_45a7_92f9_10ade18afaef, false);
        nlb:nlbwalk(v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8, v_6104baf7_01b3_4e7b_9eba_1377f12009a7); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_credits =  false ;
_back2menu =  false ;
_intro =  false ;
_our_games =  false ;
nlb:setAchievement(statsAPI, 'MAIN_MENU', '29ee9abf-405d-4735-bf3b-be69a7c80289');
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_43243a00_7e14_49eb_a1b7_afbad9eb6df2.preload then
            geomFuncNeedToCall = false;
            v_43243a00_7e14_49eb_a1b7_afbad9eb6df2:preload(s);
        else
            vn:gshow(v_43243a00_7e14_49eb_a1b7_afbad9eb6df2);
        end
        if v_da368deb_0207_479b_96ba_87b1c1ae4159.preload then
            geomFuncNeedToCall = false;
            v_da368deb_0207_479b_96ba_87b1c1ae4159:preload(s);
        else
            vn:gshow(v_da368deb_0207_479b_96ba_87b1c1ae4159);
        end
        if v_b476964e_29f8_4a1f_af08_73765a6b92d3.preload then
            geomFuncNeedToCall = false;
            v_b476964e_29f8_4a1f_af08_73765a6b92d3:preload(s);
        else
            vn:gshow(v_b476964e_29f8_4a1f_af08_73765a6b92d3);
        end
        if v_5943beec_862b_406c_b4fc_ae4a8f03a21e.preload then
            geomFuncNeedToCall = false;
            v_5943beec_862b_406c_b4fc_ae4a8f03a21e:preload(s);
        else
            vn:gshow(v_5943beec_862b_406c_b4fc_ae4a8f03a21e);
        end
        if v_248ae96e_a969_4583_b4e6_16215496a13e.preload then
            geomFuncNeedToCall = false;
            v_248ae96e_a969_4583_b4e6_16215496a13e:preload(s);
        else
            vn:gshow(v_248ae96e_a969_4583_b4e6_16215496a13e);
        end
        if v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d.preload then
            geomFuncNeedToCall = false;
            v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d:preload(s);
        else
            vn:gshow(v_aaa5f6c7_a75d_4599_a519_00ee5977ba7d);
        end
        if v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c.preload then
            geomFuncNeedToCall = false;
            v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c:preload(s);
        else
            vn:gshow(v_26baf5c3_7f9d_4b4d_b956_5cd3774c114c);
        end
        if v_ec014653_9193_4399_8185_eea017b96b35.preload then
            geomFuncNeedToCall = false;
            v_ec014653_9193_4399_8185_eea017b96b35:preload(s);
        else
            vn:gshow(v_ec014653_9193_4399_8185_eea017b96b35);
        end
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- Credits
v_b097ad4f_f32d_41d7_acb9_b69632ce070c = room {
    nam = "Credits",
    nosave = true,
    notes = 'Credits',
    bgimg = function(s)
        if (true) then
            return 'images/15.jpg';
        end
return nlb:std_bg();
    end,
    pic = function(s)
    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = true,
    way = {
    },
    xdsc = function(s)
        p "^";
        p(nlb:alts_txt(s));
    end,
    wcns = {
    },
    alts = {
    },
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if ((_back2menu)) then     _back2menu =  false ;
    nlb:actf(_syscall_hud_default);
                if have(stead.deref(_back2menuObj)) then remove(stead.deref(_back2menuObj), inv()); end;
        nlb:nlbwalk(v_b097ad4f_f32d_41d7_acb9_b69632ce070c, v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8); 
        return false;
 end;
        vn:standard_renew();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b097ad4f_f32d_41d7_acb9_b69632ce070c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_standard.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
theme.win.geom(68, 70, 1704, 901);
theme.win.color('white', '#00FF00', 'gold');
theme.inv.color('white', '#00FF00', 'gold');

        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
        s.nextsnd(s);
    end,
    sndout = function(s) end,
    obj = { 
        'v_7d24e710_f4cb_4d72_9ae7_ffdd0b5e4c29',
        'v_cc5ebee8_54ee_438a_8468_3811c4e57291',
        'v_e9e4cf1b_911f_48a2_9ee5_8e880e9fc926',
        'v_1faf185c_7b96_454b_bd3c_1c68886c3d00',
        'v_c6830a05_c040_4488_970c_1cc082fac5fa',
        'v_84ae1bd1_458c_405a_bba8_f7bdd996b682',
        'v_82557da3_7f02_4996_9961_211e71e919b2',
        'v_b0d3de0f_a304_4601_8e89_1cd26dc4e809',
        'v_7ba7ae39_80b4_4b1e_9fbd_7221f7327872',
        'v_8ee3fa56_a35c_417c_9bbe_bc61d6b050c6',
        'v_2e187c0d_1e47_4f4a_bdc1_fb4f07c6ebfb',
        'v_fb325b80_3494_470d_8b3a_c9fe020cf94d',
        'v_7da3027b_822e_453d_8cee_893d6f189a8d',
        'v_914a61df_c426_4829_8864_99f5aaa6f164',
        'v_3b458b75_c53f_41c7_94c9_f43327811822',
        'v_61072012_2883_4387_a31e_246ae60fbc8c',
        'v_09e3dfe7_48ec_4510_bc7c_c1d850b16e84',
        'v_d5260fb9_dfd5_4c7e_a447_a328fb400a09',
        'v_42266c7d_0a53_482d_875a_9395519c3157',
        'v_42b813e7_1ca4_4a4e_a6ab_629f72efddfc',
        'v_1072b77b_1115_46a6_b017_f840a73572eb',
        'v_2b5d88c5_11f6_493d_829d_2c49de7c5e26',
        'v_b8c712cf_585e_4660_bdfd_1fe68d7163a2',
        'v_a4cef361_0298_4788_a0cb_327257883d49',
        'v_24af92d2_5d0c_48d4_89f2_c50f31e29aab',
        'v_cfd7c121_b2ef_41f4_8063_ff897d20c92a',
        'v_3ceb65ce_f520_49f8_aa12_6745544b5c3e',
        'v_20fcf939_1dbe_477e_b62d_5eaa8831cb8c',
        'v_1a3d32ec_5719_40d9_8275_eced8e90ff82',
        'v_d180f174_cffe_42a9_81bb_d4154e129d17',
        'v_797a2da9_e518_4e6d_930e_29d75f211db7',
        'v_c40021fb_866a_4f3a_a3ad_13c8c7d96f42',
        'v_1ad8b242_09f7_416d_87c6_10db7318648e',
        'v_7d6ef07f_a9e9_4f34_88f3_d26ac88dde55',
        'v_107b0bce_dc04_4bf4_bd03_7c046cbe71e9',
        'v_11acd3a9_3989_4c01_b9de_c927f15f09ea',
        'v_5080431d_08f0_4f38_b293_4d0ed9736e16',
        'v_fdc08234_89c5_4dd2_a57b_026bc07e86f0',
        'v_930585ec_bbe5_473b_acd4_ed6f3a2605d7',
        'v_4acb3d44_760b_47a3_bbde_a3624251f799',
        'v_4c23d348_b87a_4929_b929_2bc39c87a583',
        xdsc()
    },
};

-- 
v_5bd37bb6_9454_4388_b33d_291d4ccd20ce = vnr {
    nam = 'Return of Red Riding Hood, New Adventures',
    nosave = true,
    notes = '',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if (true) then         nlb:nlbwalk(v_5bd37bb6_9454_4388_b33d_291d4ccd20ce, v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_5bd37bb6_9454_4388_b33d_291d4ccd20ce_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_60e27336_12ef_4702_b1cb_d9b822a36fcc.preload then
            geomFuncNeedToCall = false;
            v_60e27336_12ef_4702_b1cb_d9b822a36fcc:preload(s);
        else
            vn:gshow(v_60e27336_12ef_4702_b1cb_d9b822a36fcc);
        end
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- Other games by NLB project
v_6104baf7_01b3_4e7b_9eba_1377f12009a7 = room {
    nam = "Other games by NLB project",
    nosave = true,
    notes = 'Other games by NLB project',
    bgimg = function(s)
        if (true) then
            return 'images/ourgamesbg.jpg';
        end
return nlb:std_bg();
    end,
    pic = function(s)
    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
        p("Thanks for playing this game!^"..
"If you liked this game, then probably you\'ll like our other games.");
    end,
    way = {
    },
    xdsc = function(s)
        p "^";
        p(nlb:alts_txt(s));
    end,
    wcns = {
    },
    alts = {
    },
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if ((_back2menu)) then     _back2menu =  false ;
    nlb:actf(_syscall_hud_default);
                if have(stead.deref(_back2menuObj)) then remove(stead.deref(_back2menuObj), inv()); end;
        nlb:nlbwalk(v_6104baf7_01b3_4e7b_9eba_1377f12009a7, v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8); 
        return false;
 end;
        vn:standard_renew();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_6104baf7_01b3_4e7b_9eba_1377f12009a7_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_standard.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
theme.win.geom(68, 70, 1704, 901);
theme.win.color('black', 'black', 'darkgreen');
theme.inv.color('black', 'black', 'darkgreen');

        s.snd(s);
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return vn:get_win_coords();
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
        s.nextsnd(s);
    end,
    sndout = function(s) end,
    obj = { 
        'v_76c5c7bf_0ce5_47a0_a945_254063ee11b9',
        'v_d9cc21f5_f95b_4300_8971_1733183e1ab9',
        'v_eb58dab3_3e56_427d_ae99_787b986dfe72',
        'v_66edebcb_50ca_4edb_89e3_bdd513cfcfd0',
        xdsc()
    },
};

-- 
v_a135a9ec_65be_4774_b2c5_14e06026385c = vnr {
    nam = 'Return of Red Riding Hood, New Adventures',
    nosave = true,
    notes = '',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if (true) then     _intro =  false ;
        nlb:nlbwalk(v_a135a9ec_65be_4774_b2c5_14e06026385c, v_61e7589b_f548_44d5_b3f3_fe1c7136c3c8); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a135a9ec_65be_4774_b2c5_14e06026385c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_3978214c_072b_44e9_92e9_a9749927b2c0.preload then
            geomFuncNeedToCall = false;
            v_3978214c_072b_44e9_92e9_a9749927b2c0:preload(s);
        else
            vn:gshow(v_3978214c_072b_44e9_92e9_a9749927b2c0);
        end
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- 
v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1 = vnr {
    nam = 'Return of Red Riding Hood, New Adventures',
    nosave = true,
    notes = '',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if (true) then         nlb:nlbwalk(v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1, v_a135a9ec_65be_4774_b2c5_14e06026385c); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b.preload then
            geomFuncNeedToCall = false;
            v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b:preload(s);
        else
            vn:gshow(v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b);
        end
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- 
v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc = vnr {
    nam = 'Return of Red Riding Hood, New Adventures',
    nosave = true,
    notes = '',
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        nlb:ways_chk(s);
        if (true) then         nlb:nlbwalk(v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc, v_5bd37bb6_9454_4388_b33d_291d4ccd20ce); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    theme_file = function(s)
        return 'theme_vn.lua';
    end,
    enter = function(s, f)
        nlb:theme_switch(s:theme_file());
        s.lasttext = nil;
        s.wastext = false;
        if not (f.autowired) then
_intro =  true ;
nlb:actf(_syscall_hidemenubtn);
        end;
        s:initf();
    end,
    initf = function(s)
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        local bg_img = s.bgimg(s);
        nlb:revive();
        nlb:ways_chk(s);
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf.preload then
            geomFuncNeedToCall = false;
            v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf:preload(s);
        else
            vn:gshow(v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf);
        end
        if v_04d2f69b_7b46_45ab_854d_dbb230454344.preload then
            geomFuncNeedToCall = false;
            v_04d2f69b_7b46_45ab_854d_dbb230454344:preload(s);
        else
            vn:gshow(v_04d2f69b_7b46_45ab_854d_dbb230454344);
        end
        if geomFuncNeedToCall then
            vn:auto_geom('dissolve', function() s.autos(s); end);
        end;
        return 0, 0, vn.scr_w, vn.scr_h;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

