-- Tested:

-- Save Krennan Aranas:
-- Aura definition to Area
DELETE FROM spell_area WHERE spell = 49416 AND area = 4757;
INSERT INTO spell_area (`spell`, `area`, `quest_start`, `quest_end`, `quest_start_status`, `quest_end_status`) 
VALUES (49416, 4757, 14293, 14294, 74, 64);
-- Greymane's Horse - 35905
--	Seat definition
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(35905, 35907, 1, 0, 35905 - 35907, 0, 0); -- 35905 - 35907
--	Set SmartAI and delete ScriptName
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='', `spell1`=68219, `unit_flags`=10 WHERE `entry` IN (35905);

-- King Genn Greymane - 35550

DELETE FROM `smart_scripts` WHERE `entryorguid`= 35550 AND `source_type`=0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= 35550 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(35550,0,0,0,1,0,100,0,30000,30000,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"King Genn Greymane - Out Of Combat - Say Text"),
(35550,0,1,0,19,0,100,0,14293,0,0,0,75,49416,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"King Genn Greymane - Accepted Quest - Add Aura 49416"),
(35550,0,2,1,61,0,100,0,0,0,0,0,11,68232,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"King Genn Greymane - Link - Cast 68232");