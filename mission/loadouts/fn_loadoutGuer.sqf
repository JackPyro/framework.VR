//place all mission related stuff here
//do not overwrite this file when copying framework from mission to mission

private ["_basicMedicine", "_advancedMedicine", "_medicine", "_basicMedicMedicine", "_advancedMedicMedicine", "_medicMedicine"];
private ["_riflemanFashion", "_specFashion", "_leaderFashion", "_crewFashion", "_pilotFashion", "_medicMedicine"];
private ["_riflemanPrimary", "_specPrimary", "_glRifleWeapon", "_leaderPrimary", "_mgWeapon", "_handgunWeapon", "_leaderSecond", "_atLauncherWeapon", "_atMissileWeapon", "_aaMissileWeapon", "_binoculars"];
private ["_items", "_linkItems", "_boxItems", "_boxMedicine"];

_basicMedicine = [["ACE_fieldDressing", 20], ["ACE_morphine", 10], ["ACE_epinephrine", 2], ["ACE_bloodIV_250", 1]];
_advancedMedicine = [["ACE_fieldDressing", 10], ["ACE_quikclot", 10], ["ACE_morphine", 10], ["ACE_epinephrine", 2], ["ACE_tourniquet", 1], ["ACE_personalAidKit", 1], ["ACE_bloodIV_250", 1]];

_medicine = _basicMedicine;

_basicMedicMedicine = [["ACE_fieldDressing", 40], ["ACE_morphine", 20], ["ACE_epinephrine", 4], ["ACE_bloodIV_250", 2]];
_advancedMedicMedicine = [["ACE_fieldDressing", 20], ["ACE_quikclot", 20], ["ACE_morphine", 20], ["ACE_epinephrine", 4], ["ACE_tourniquet", 2], ["ACE_personalAidKit", 2], ["ACE_bloodIV_250", 2]];

_medicMedicine = _basicMedicMedicine;

private _uniform = "U_B_CombatUniform_mcam";
private _vest = "V_BandollierB_rgr";



_pilotFashion = [_uniform, _vest, "H_PilotHelmetHeli_B", "B_Kitbag_cbr", ""];
_crewFashion = [_uniform, _vest, "H_HelmetCrew_B", "B_Kitbag_cbr", ""];


_specPrimary = ["arifle_MXC_F", [], []];
_glRifleWeapon = ["arifle_MX_GL_F", [], ["optic_Aco"]];


private _uniforms = ["U_C_E_LooterJacket_01_F","U_I_L_Uniform_01_tshirt_olive_F", "CUP_U_O_CHDKZ_Bardak", "CUP_U_O_CHDKZ_Lopotev", "CUP_I_B_PMC_Unit_11", "U_C_Mechanic_01_F", "CUP_U_I_GUE_Anorak_02", "CUP_U_I_GUE_Anorak_01"];
private _vest = ["CFP_Alice_Vest", "CFP_Alice_Vest2", "SP_Bandolier1_Black", "CFP_Smersh_Olive", "CFP_UtilityJacket_EDRL", "CFP_UtilityJacket_EDRL", "CFP_UtilityJacket_PolygonDesert"];
private _face = ["G_Bandanna_oli", "G_Bandanna_shades", "G_Balaclava_blk", "rhs_scarf", "CUP_PMC_Facewrap_Black", "CUP_G_Scarf_Face_Blk", "T_HoodBlkBLK", "T_HoodBDU"];


private _czAmmo = ["CUP_1Rnd_B_CZ584_74Pellets","CUP_1Rnd_B_CZ584_74Slug"];


private _gun =  [
	["CUP_sgun_CZ584",[[selectRandom _czAmmo,15]],[]],
    ["hlc_rifle_M1903A1",[["hlc_5rnd_3006_1903",15]],[]],
    ["rhs_weap_makarov_pm",[["rhs_mag_9x18_8_57N181S",15]],[]]
];

_riflemanFashion = [selectRandom _uniforms,selectRandom _vest,"SP_Hood_Black","SP_Carryall_Black",selectRandom _face];
_riflemanPrimary = ["arifle_MX_F", [["30Rnd_65x39_caseless_mag", 15]], []];


_leaderFashion = [selectRandom _uniforms,selectRandom _vest,"rhs_altyn_novisor","CUP_B_AssaultPack_Black",selectRandom _face];
_leaderPrimary = ["CUP_sgun_CZ584",[[selectRandom _czAmmo,15]],[]];
_handgunWeapon = ["rhs_weap_makarov_pm",[["rhs_mag_9x18_8_57N181S",15]],[]],



_TlFashion = [selectRandom _uniforms,selectRandom _vest,"CUP_H_PMC_Beanie_Winter","CFP_RPGPack_White",selectRandom _face];
_TlPrimary = ["CUP_sgun_CZ584",[[selectRandom _czAmmo,15]],[]];
_Tlhandgun = ["rhs_weap_makarov_pm",[["rhs_mag_9x18_8_57N181S",15]],[]],



private _mgMag = "";
_mgWeapon = ["arifle_MX_SW_F", [], ["bipod_01_F_snd"]];
private _mgMags = ["", [[_mgMag, 7]], []];


_leaderSecond = _handgunWeapon;

private _atLauncher = "launch_NLAW_F";

_atLauncherWeapon = [_atLauncher, [], []];
_atMissileWeapon = ["launch_B_Titan_short_F", [], []];
_aaMissileWeapon = ["launch_B_Titan_F", [], []];

_binoculars = ["Binocular", [], []];

private _additionGrenade = "SmokeShellRed";
private _fragGrenade = "rhs_mag_rgn";

_items = [["ACE_EarPlugs", 1], [_additionGrenade, 4], ["ACE_CableTie", 2]];
_linkItems = ["ItemMap", "ItemCompass", "ItemWatch"];

_boxItems = [
    ["ToolKit", 10],
    ["ACE_wirecutter", 2],
    ["ACE_SpareBarrel", 10],
    ["ACE_CableTie", 80],
    ["ACE_Clacker", 10],
    ["murshun_cigs_cigpack", 40],
    ["murshun_cigs_matches", 40],
    [_atLauncher, 20],
    [_additionGrenade, 200],
    [_fragGrenade, 80],
    ["DemoCharge_Remote_Mag", 20],
    ["SatchelCharge_Remote_Mag", 4]
]; //content for boxes

_boxMedicine = _medicine apply {[_x select 0, (_x select 1) * 60]};

private _identity = [
    "", //face
    "" //voice
]; //identity, ai only

private _loadoutArray = [
    [
        [
            ["officer", "squad leader"],
            [
                _leaderFashion,
                [_leaderPrimary, _leaderSecond, _binoculars]
            ]
        ],
		[
            ["combat life saver"],
            [
                _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["engineer"],
            [
                _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["team leader"],
            [

                _TlFashion,
                [_TlPrimary, _Tlhandgun, _binoculars]
            ]
        ],        
        [
            ["rifleman"],
            [
                _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
		[
            ["missile specialist (at)" ],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["missile specialist (aa)"],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["autorifleman"],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["rifleman (at)"],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["pilot", "helicopter pilot"],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
        [
            ["crewman", "helicopter crew"],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ],
		
        [
            ["grenadier"],
            [
                 _riflemanFashion,
                [selectRandom _gun]
            ]
        ]
    ], //equipment per class
    [
        [
            ["all"],
            [["ACRE_PRC343", 1]],
            []
        ],
        [
            ["officer", "squad leader", "team leader", "pilot", "crewman"],
            [["ACRE_PRC152", 1]],            
            []
        ],
        [
            ["all"],
            _items + _medicine, //items
            _linkItems //link items
        ],
        [
            ["officer", "squad leader", "team leader"],
            [["murshun_cigs_lighter", 1]],
            []
        ],
        [
            ["combat life saver"],
            _medicMedicine,
            []
        ],
        [
            ["engineer"],
            [["ACE_M26_Clacker", 1], ["ACE_DefusalKit", 1], ["DemoCharge_Remote_Mag", 2]],
            []
        ],
        [
            ["missile specialist (at)"],
            [],
            []
        ],
        [
            ["missile specialist (aa)"],
            [],
            []
        ],
        [
            ["autorifleman"],
            [],
            []
        ],
        [
            ["rifleman (at)"],
            [],
            []
        ],
        [
            ["pilot", "helicopter pilot", "crewman", "helicopter crew"],
            [["ToolKit", 1]],
            ["ItemGPS"]
        ],
        [
            ["grenadier"],
            [],
            []
        ],
        [
            ["rifleman"],
            [["murshun_cigs_cigpack", 1],
             ["murshun_cigs_matches", 1]],
            []
        ]
    ], //personal items per class
    _boxItems + _boxMedicine,
    _identity
];

//output of the function, do not remove or change
_loadoutArray
