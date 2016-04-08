//@file Version: 1.1
//@file Name: gearLevel2.sqf
//@file Author: Cael817, based of something i found

if (((getPlayerUID player) in call gearLevel1)) then {

player setVariable ["cmoney", (player getVariable "cmoney") + 1500, true];

removeAllWeapons player;
removeUniform player;
removeallitems player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
clearMagazineCargo player;

player addBackpack "B_FieldPack_cbr";
player forceAddUniform "U_BG_Guerilla2_1";
player addVest "";	
player linkItem "ItemGPS";
player addweapon "Binoculars";
player addMagazines ["HandGrenade",1];
player addMagazines ["SmokeShell", 1];
player addItem "Medikit";
player addGoggles "";
player addHeadgear "H_MilCap_blue";

player addMagazines ["16Rnd_9x21_Mag", 3];
player addWeapon "hgun_P07_F";
player addhandGunItem "";
player addhandGunItem "muzzle_snds_L";

player addMagazines ["30Rnd_556x45_Stanag",3];
player addWeapon "arifle_Mk20C_plain_F";
player addPrimaryWeaponItem "optic_Aco_smg";
player addPrimaryWeaponItem "";
player addPrimaryWeaponItem "";
player selectWeapon "arifle_Mk20C_plain_F";

player addMagazines ["Titan_AA",1];
player addWeapon "launch_Titan_F";
player setObjectTextureGlobal [0, "client\images\vehicleTextures\camo_pank.jpg"];

};
