_obj = _this select 0;

waitUntil {!isNil "murshun_frameworkInit"};

if (isServer) then {
	_obj allowDamage false;
};

_action = ["murshun_framework_reviveEveryone", "Revive Everyone (At Base)", "", {
	[] spawn murshun_framework_revivePlayers_fnc;
}, {(tolower gettext (configFile >> "cfgVehicles" >> typeOf player >> "displayName") == "officer") || (tolower gettext (configFile >> "cfgVehicles" >> typeOf player >> "displayName") == "squad leader")}] call ace_interact_menu_fnc_createAction;
[_obj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;