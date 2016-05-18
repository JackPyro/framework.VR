_vehicle = _this select 0;

[_vehicle] execVM "musicRadio\radioInit.sqf";

if (!isNil "mf_onlyPilotsCanFly") then {
	if (mf_onlyPilotsCanFly) then {
		if (_vehicle isKindOf "air") then {
			_vehicle addEventHandler ["ControlsShifted", {
				_veh = _this select 0;
				_unit = _this select 1;
				
				_className = tolower gettext (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");

				if (_className != "pilot") then {
					if ((getPosATL _veh) select 2 < 5) then {
						[[[_veh, _unit], {
							params ["_veh", "_unit"];
							
							_unit action ["SuspendVehicleControl", _veh];
							systemChat "Can take controls only when flying.";
						}], "BIS_fnc_spawn", _unit] call BIS_fnc_MP;
					};
				};
			}];
		};
	};
};

if (!isServer) exitWith {};

if (isClass (configFile >> "CfgPatches" >> "acre_main")) then {
	clearItemCargoGlobal _vehicle;
};
