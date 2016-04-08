//@file Version: 1.1
//@file Name: gearLevel5.sqf
//@file Author: Cael817, based of something i found

if (((getPlayerUID player) in call gearLevel5)) then {

player setVariable ["cmoney", (player getVariable "cmoney") + 20000, true];

removeAllWeapons player;
//removeUniform player;
//removeallitems player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
clearMagazineCargo player;

player addBackpack "B_Carryall_mcamo";
player addUniform "U_B_CombatUniform_mcam";
player addVest "V_PlateCarrierGL_rgr";	
player linkItem "NVGoggles";
player linkItem "ItemGPS";
player addweapon "Laserdesignator";
player addMagazines ["Laserbatteries",1];
player addMagazines ["DemoCharge_Remote_Mag",2];
player addMagazines ["MiniGrenade",2];
player addItem "Medikit";
player addItem "optic_Aco_smg";
player addGoggles "";
player addHeadgear "H_Booniehat_tan";

player addMagazines ["11Rnd_45ACP_Mag", 3];
player addWeapon "hgun_Pistol_heavy_01_F";
player addhandGunItem "optic_MRD";
player addhandGunItem "muzzle_snds_acp";

player addMagazines ["20Rnd_762x51_Mag", 10];
player addWeapon "srifle_EBR_F";
player addPrimaryWeaponItem "optic_tws";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "muzzle_snds_B";
player selectWeapon "srifle_EBR_F";

player addMagazines ["Titan_AA",2];
player addWeapon "launch_Titan_F";
};