create table Items(

	items_id int PRIMARY KEY AUTO_INCREMENT,
    type ENUM("weapon","potion","utility item","other") DEFAULT "other",
    price float,
    weight float
    
);

create table Diety(

	diety_id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    alignment ENUM("LG","LN","LE",
				   "NG","TN","NE",
                   "CG","CN","CE")
    
);

create table Species(

	species_id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50),
    is_humanoid bool,
    is_wild bool

);


create table Classes(

	class_id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    role VARCHAR(20),
    explanation VARCHAR(250),
    main_attribute ENUM("STR","DEX","CON","INT","WIS","CHR")
    
);



create table Skills(
	
    
    class_id int,
	skill_name varchar(50),
    
    level int UNSIGNED, 
    explanation varchar(250),
    type ENUM("Spell","Action","Bonus Action"),
    
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    PRIMARY KEY(class_id,skill_name)
    
);

create table NPC (

	npc_id int PRIMARY KEY AUTO_INCREMENT,
    faction varchar(250),
    
    name varchar(50),
    wis int,
    int_ int,
    con int,
    chr int,
    dex int,
    str int,
    type ENUM("Friend","Enemy","Neutral"), 
    aligment ENUM("LG","LN","LE",
				   "NG","TN","NE",
                   "CG","CN","CE"),
    
    class_id int,
    species_id int,
    diety_id int,
    
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (species_id) REFERENCES Species(species_id),
    FOREIGN KEY (diety_id) REFERENCES Diety(diety_id)

);

create table Players(

	player_id int PRIMARY KEY AUTO_INCREMENT,
    background varchar(20),
    
    name varchar(50),
    wis int,
    int_ int,
    con int,
    chr int,
    dex int,
    str int,
    aligment ENUM("LG","LN","LE",
				   "NG","TN","NE",
                   "CG","CN","CE"),
    
    class_id int,
    species_id int,
    diety_id int,
    
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (species_id) REFERENCES Species(species_id),
    FOREIGN KEY (diety_id) REFERENCES Diety(diety_id)

);

create table Item_NPC(
	
    npc_id int,
    items_id int,
    PRIMARY KEY(npc_id,items_id),
    FOREIGN KEY (npc_id) REFERENCES NPC(npc_id),
    FOREIGN KEY (items_id) REFERENCES Items(items_id)

);

create table Item_Player(
	
    player_id int,
    items_id int,
    PRIMARY KEY(player_id,items_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (items_id) REFERENCES Items(items_id)

);

CREATE TABLE Species_Diety (

    species_id INT,
    diety_id INT,
    PRIMARY KEY (species_id, diety_id),
    FOREIGN KEY (species_id) REFERENCES Species(species_id),
    FOREIGN KEY (diety_id) REFERENCES Diety(diety_id)

);
