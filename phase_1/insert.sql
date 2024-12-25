INSERT INTO items(type,price,weight)  
VALUES
("weapon",10,1),
("weapon",50,5),
("weapon",20,2),
("potion",5,0.5),
("potion",5,0.5),
("potion",12,0.3),
("potion",30,2),
("utility item",25,3),
("utility item",40,7),
("other",150,10);


INSERT INTO species(name,is_humanoid,is_wild)
VALUES
("Human",true,false),
("Elf",true,false),
("Orc",true,true),
("Dragon",false,true),
("Elemental",false,false),
("Ogre",true,true),
("Halfling",true,false),
("Dwarf",true,false),
("Centaur",false,false),
("Owlbear",false,true);

INSERT INTO classes(name,role,explanation,main_attribute)
VALUES
("Artificer","Support",
"Masters of invention,
 artificers use ingenuity and magic to unlock extraordinary capabilities in objects.
 They see magic as a complex system waiting to be decoded and then harnessed in their spells and inventions.",
 "INT"),
 
 
("Barbarian","Tank",
"Barbarians come alive in the chaos of combat.
 They can enter a berserk state where rage takes over,
 giving them superhuman strength and resilience. ",
"STR"),


("Bard","Support",
"Invoking magic through music, dance, and verse,
 Bards are expert at inspiring others,
 soothing hurts, disheartening foes, and creating illusions.",
 "CHR"),


("Cleric","Support",
"Clerics draw power from the realms of the gods and harness it to work miracles.
 Blessed by a deity, a pantheon, or another immortal entity,
 a Cleric can reach out to the divine magic of the Outer Planes",
"WIS"),


("Druid","Magic",
"Druids belong to ancient orders that call on the forces of nature.
 Harnessing the magic of animals, plants, and the four elements,
 Druids heal, transform into animals, and wield elemental destruction.",
"WIS"),

("Fighter","Damage",
"Fighters rule many battlefields. Questing knights,
 royal champions, elite soldiers, and hardened mercenaries—as Fighters,
 they all share an unparalleled prowess with weapons and armor. ",
"STR"),

("Monk","Damage","Monks use rigorous combat training and
 mental discipline to align themselves with the multiverse and focus their internal reservoirs of power.
 Different Monks conceptualize this power in various ways: as breath, energy..."
 ,"DEX"),


("Rogue","Damage",
"Rogues rely on cunning, stealth, and their foes’ vulnerabilities to get the upper hand in any situation.
 They have a knack for finding the solution to just about any problem.
 A few even learn magical tricks to supplement their other abilities.",
"DEX"),

("Wizard","Magic",
"Wizards are defined by their exhaustive study of magic’s inner workings.
 They cast spells of explosive fire, arcing lightning,
 subtle deception, and spectacular transformations",
"INT"),


("Paladin","Tank","Paladins are united by their oaths to stand against the forces of annihilation and corruption.
 Whether sworn before a god’s altar,in a sacred glade before nature spirits,
 or in a moment of desperation and grief, a Paladin’s oath is a powerful bond.",
 "STR");
 
 INSERT INTO skills(class_id,skill_name,level,explanation,type)
 VALUES
 (2,"Rage",1,
 "You can imbue yourself with a primal power called Rage,
 a force that grants you extraordinary might and resilience.
 You can enter it as a Bonus Action if you aren't wearing Heavy armor.",
 "Bonus Action"),
 
  (2,"Reckless Attack",5,
 "You can throw aside all concern for defense to attack with increased ferocity.
 When you make your first attack roll on your turn, you can decide to attack recklessly.",
 "Action"),

(9,"Thunderwave",1,
 "You can throw aside all concern for defense to attack with increased ferocity.
 When you make your first attack roll on your turn, you can decide to attack recklessly.",
 "Spell"),
 
 (9,"Wish",9,
 "Wish is the mightiest spell a mortal can cast. By simply speaking aloud, you can alter reality itself.",
 "Spell"),
 
 (5,"Beast Bond",1,
 "You establish a telepathic link with one beast you touch that is friendly to you or charmed by you.",
 "Spell"),
 
 (5,"Wild Shape",2,
 "The power of nature allows you to assume the form of an animal." ,
 "Bonus Action"),
 
  (8,"Cunning Action",2,
 "Your quick thinking and agility allow you to move and act quickly.
 On your turn, you can take one of the following actions as a Bonus Action: Dash, Disengage, or Hide." ,
 "Bonus Action"),
 
  (8,"Steady Aim",3,
 "As a Bonus Action, you give yourself Advantage on your next attack roll on the current turn.
 You can use this feature only if you haven't moved during this turn,
 and after you use it, your Speed is 0 until the end of the current turn." ,
 "Bonus Action"),
 
 (7,"Unarmed Strike",1,
 "Instead of using a weapon to make a melee attack, you can use a punch, kick, head-butt, or similar forceful blow.",
 "Bonus Action"),
 
 (3,"Bardic Inspiration",1,
 "You can supernaturally inspire others through words, music, or dance.
 This inspiration is represented by your Bardic Inspiration die, which is a d6" ,
 "Bonus Action");



INSERT INTO Diety(name,alignment) 
Values
("Tyr","LG"),
("Seldarine","LN"), 
("Bahgtru","LE"), 
("Asgorath","TN"), 
("Ao","TN"), 
("Vaprak","CE"), 
("Yondalla","LG"), 
("Moradin", "LG"), 
("Skerrit","TN"),
("Malar","CE"); 


INSERT INTO players(background,name,str,dex,con,int_,wis,chr,aligment,class_id,species_id,diety_id)
Values
("Acolyte","Kyloo Rowley",10,14,12,14,8,17,"TN",3,1,1),
("Criminal","Ithrenwen",8,17,12,14,10,14,"CN",8,2,5),
("Artisan","Umolau Aedin",8,14,14,17,12,10,"TN",9,1,5),
("Soldier","Gorbalcm",17,14,14,8,12,10,"CE",2,3,3),
("Noble","Atonii",14,10,14,8,15,14,"NG",4,7,1),
("Street Kid","Mirime Sekath",13,15,16,8,13,10,"TN",6,2,2),
("Inventor","Cai Hammel",13,8,14,17,13,10,"TN",1,1,8),
("Weaponsmith","Turval Rantholth",15,9,13,10,14,14,"LG",10,8,8),
("Escapee","Mendry Buddenaus",12,17,14,8,14,10,"CN",7,1,5),
("Folk Hero","Tossi of the Badgers",8,15,14,12,15,11,"CN",5,7,10);

INSERT INTO NPC(name,faction,str,dex,con,int_,wis,chr,type,aligment,class_id,species_id,diety_id)
Values
("Johannes Handsome","Free Artists",10,14,12,14,8,17,"Neutral","TN",3,1,1),
("Lara Dorren","Dark Brotherhood",8,17,12,14,10,14,"Enemy","CN",8,2,5),
("Alberic Red","School of the Phoenix",8,14,14,17,12,10,"Friend","TN",9,1,5),
("Wurzak the Great Green Prophet","SQL Boyzz",17,14,14,8,12,10,"Enemy","CE",2,3,3),
("Theria the Healer",Null,14,10,14,8,15,14,"Friend","NG",4,7,1),
("Khajiit Dovah","Guild of Thieves",13,15,16,8,13,10,"Enemy","TN",6,2,2),
("Tora Brown","Hidden Workshop",13,8,14,17,13,10,"Neutral","TN",1,1,8),
("Durin The First","Khazadom",15,9,13,10,14,14,"Neutral","LG",10,8,8),
("Dhalai Camel","Temple of Ao",12,17,14,8,14,10,"Neutral","CN",7,1,5),
("Halsin","Druid Cove",8,15,14,12,15,11,"Friend","CN",5,7,10);


INSERT INTO Item_Player(player_id,items_id)
VALUES
(1,1),
(1,2),
(2,5),
(3,10),
(4,9),
(5,3),
(6,3),
(2,7),
(8,4),
(10,1);


INSERT INTO Item_Npc(npc_id,items_id)
VALUES
(1,1),
(1,2),
(2,5),
(3,10),
(4,9),
(5,3),
(6,3),
(2,7),
(8,4),
(10,1);

INSERT INTO Species_Diety(species_id,diety_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);






