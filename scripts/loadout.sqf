_unit = _this select 0;
_className = tolower gettext (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");

_loadoutArray = [];

waitUntil {!isNil "murshun_frameworkInit"};
waitUntil {!isNil "loadoutArray_west" and !isNil "loadoutArray_east" and !isNil "loadoutArray_guer" and !isNil "loadoutArray_civ"};

switch (side _unit) do {
case WEST: {
		_loadoutArray = loadoutArray_west;
	};
case EAST: {
		_loadoutArray = loadoutArray_east;
	};
case RESISTANCE: {
		_loadoutArray = loadoutArray_guer;
	};
case CIVILIAN: {
		_loadoutArray = loadoutArray_civ;
	};
};

if (count _loadoutArray == 3) then {
	removeAllAssignedItems _unit;
	removeAllWeapons _unit;
	removeBackpack _unit;
	removeAllItems _unit;
	removeGoggles _unit;
	removeUniform _unit;
	removeVest _unit;
	removeHeadgear _unit;

	_fallbackClassName = _className;
	
	_allClassesArray = [];

	{
		_allClassesArray = _allClassesArray + (_x select 0);
	} foreach (_loadoutArray select 0);

	if (!(_className in _allClassesArray)) then {
		if (!isMultiplayer) then {
			systemChat format ["Can't find loadout for %1, falling back to rifleman.", _className];
		};
		
		_fallbackClassName = "rifleman";
	};

	{
		if (_fallbackClassName in (_x select 0)) then {
			_fashionArray = _x select 1 select 0;
			_weaponsArray = _x select 1 select 1;

			if (count _fashionArray == 5) then {
				[_unit, _fashionArray select 0] call murshun_giveUniform_fnc;
				[_unit, _fashionArray select 1] call murshun_giveVest_fnc;
				[_unit, _fashionArray select 2] call murshun_giveHeadgear_fnc;
				[_unit, _fashionArray select 3] call murshun_giveBackpack_fnc;
				[_unit, _fashionArray select 4] call murshun_giveGoggles_fnc;
			};

			{
				[_unit, _x] call murshun_giveWeapon_fnc;
			} foreach _weaponsArray;
		};
	} foreach (_loadoutArray select 0);

	{
		if (count _x == 3) then {
			if (_fallbackClassName in (_x select 0) || "all units" in (_x select 0)) then {
				_itemsArray = _x select 1;
				_linkItemsArray = _x select 2;

				[_unit, _itemsArray] call murshun_giveItems_fnc;
				[_unit, _linkItemsArray] call murshun_giveLinkItems;
			};
		};
	} foreach (_loadoutArray select 1);
};
