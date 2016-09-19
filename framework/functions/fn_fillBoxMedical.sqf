_box = _this select 0;

if (!isServer) exitWith {};

waitUntil {time > 0};

clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_box allowDamage false;

if (ace_medical_level > 1) then {
	_box addItemCargoGlobal ["ACE_elasticBandage", 100];
	_box addItemCargoGlobal ["ACE_quikclot", 100];
	_box addItemCargoGlobal ["ACE_morphine", 20];
	_box addItemCargoGlobal ["ACE_epinephrine", 20];
	_box addItemCargoGlobal ["ACE_atropine", 20];
	_box addItemCargoGlobal ["ACE_tourniquet", 20];
	_box addItemCargoGlobal ["ACE_personalAidKit", 20];
	_box addItemCargoGlobal ["ACE_salineIV_250", 20];	
} else {
	_box addItemCargoGlobal ["ACE_elasticBandage", 100];
	_box addItemCargoGlobal ["ACE_quikclot", 100];
	_box addItemCargoGlobal ["ACE_morphine", 20];
	_box addItemCargoGlobal ["ACE_epinephrine", 20];
	_box addItemCargoGlobal ["ACE_salineIV_250", 20];
};

[_box] spawn mf_fnc_dynamicItems;
