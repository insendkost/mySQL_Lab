CREATE schema Football_League;
use Football_League;

create table Football_League
(FL_Name varchar(25) primary key)
engine=InnoDB;

create table Football_Club
(FL_Name varchar(25),
FC_Name varchar(25),
FC_President varchar(25),
FC_Mangaer varchar(25),
Points_In_League int,
primary key (FC_Name),
constraint FL_FC foreign key (FL_Name)
	references Football_League(FL_Name)
		on update cascade
		on delete no action
)engine=InnoDB;

CREATE TABLE Person (
Person_ID varchar(25) primary key,
Person_F_Name VARCHAR(25),
Person_L_Name VARCHAR(25),
Person_Gender VARCHAR(6),
Person_DOB DATE
)ENGINE = InnoDB;

create table Player
(P_ID varchar(25) unique not null,
P_Role varchar(25),
Goals int,
primary key (P_ID),
constraint Person_Player foreign key (P_ID)
	references Person(Person_ID)
		on update cascade
        on delete no action
)engine=InnoDB;

create table Referee
(REF_ID varchar(25) unique not null,
REF_Salary int,
FL_Name varchar(25),
primary key (REF_ID),
constraint Person_Ref foreign key (REF_ID)
	references Person(Person_ID)
		on update cascade
        on delete no action,
constraint REF_FL foreign key(FL_Name)
	references Football_League(FL_Name)
		on update cascade
		on delete no action
)engine=InnoDB;

create table Staff_Member
(SM_ID varchar(25) unique not null,
SM_Role varchar(25),
SM_Salary int,
FC_Name varchar(25),
primary key (SM_ID),
constraint Person_SM foreign key (SM_ID)
	references Person(Person_ID)
		on update cascade
        on delete no action,
constraint SM_FC foreign key(FC_Name)
	references Football_Club(FC_Name)
		on update cascade
		on delete no action
)engine=InnoDB;


create table Contract
(Contract_Serial_Number int auto_increment,
FC_Name varchar(25),
P_ID varchar(25),
Shirt_Number int,
Weekly_Salary int,
Bonus_Per_Goal int,
Date_Signed date,
Number_Of_Years_Signed int,
Contract_Sum int,
primary key (Contract_Serial_Number),
constraint Contract_FC foreign key(FC_Name) 
	references Football_Club(FC_Name)
		on update cascade
		on delete no action,
constraint Contract_Player foreign key(P_ID) 
	references Player(P_ID)
		on update cascade
		on delete no action
)engine=InnoDB;

create table Field
(F_Name varchar(25) primary key,
FC_Name varchar(25) unique not null,
F_Location varchar(25),
F_Max_Occupancy int,
constraint Field_For_Club foreign key (FC_Name)
	references Football_Club(FC_Name)
    		on update cascade
			on delete no action
)engine=InnoDB;

create table game
(Game_Serial_Number int auto_increment,
FC_Name1 varchar(25),
FC_Name2 varchar(25),
#REF_ID varchar(25),
F_Name varchar(25),
Game_Date date,
Game_Hour time,
Goals_Team1 int,
Goals_Team2 int,
primary key (Game_Serial_Number),
constraint FC_IN_GAME_1 foreign key (FC_Name1)
	references Football_Club(FC_Name)
		on update cascade
		on delete no action,
constraint FC_IN_GAME_2 foreign key (FC_Name2)
	references Football_Club(FC_Name)
		on update cascade
		on delete no action,
#constraint Game_Ref foreign key (REF_ID)
#	references Referee(REF_ID)
#		on update cascade
#		on delete no action,
constraint Game_Field foreign key(F_Name)
	references Field(F_Name)
    on update cascade
    on delete no action
)engine=InnoDB;

create table Referee_Games
(Game_Serial_Number int,
REF_ID varchar(25),
REF_Role varchar(25),
constraint Games_Judged foreign key (Game_Serial_Number)
	references game(Game_Serial_Number)
		on update cascade
		on delete no action,
constraint Referee_Judging foreign key (REF_ID)
	references Referee(REF_ID)
		on update cascade
		on delete no action
)engine=InnoDB;

insert into Football_League(FL_Name)
values ("La Liga");

insert into Football_Club (FL_Name,FC_Name,FC_President,FC_Mangaer,Points_In_League)
values ("La Liga","Real Madrid","Florentino Peres","Carlo Ancelotti",45),
("La Liga","Atletico Madrid","Enrique Sarso","Diego Simeone",43),
("La Liga","FC Barcelona","Joan La'porte","Xavi",39),
("La Liga","Sevilla","Jose Maria Del Nido","Yolen Loftgi",27),
("La Liga","Celta Vigo","Carlos Morinho","Eduardo Caodet",17);

insert into person (Person_ID,Person_F_Name,Person_L_Name,Person_Gender,Person_DOB)
values("111111","Lionel","Messi",'M',"1984-06-21"),
("222222","Gerard", "Pique",'M',"1982-05-01"),
("333333","Samuel","Umtiti","M","1970-10-18"),
("444444","Koke", "Merodio","M","1966-11-21"),
("555555","Hector","Herrera","M","1984-12-12"),
("666666","Jan","Oblak","M","1995-02-22"),
("777777","Dani","Carvajal","M","1995-02-20"),
("888888","Francisco","Isco","M","1991-04-04"),
("999999","Viera","Marcelo","M","1991-12-01"),
("000000","Eric","Lamala","M","1979-12-04"),
("121212","Fernando","De Silva","M","1978-07-13"),
("343434","Munir","El Hadadi","M","1965-12-22"),
("565656","Dennis","Suares","M","1984-06-21"),
("787878","Manuel","Nolito","M","1984-06-21"),
("123123","Hogo","Mayo","M","1984-06-21"),
("010101","Andreas","Iniesta","M","1970-04-01"),
("757575","Malang","Diedhiou","M","1990-02-01"),
("565657","Alireza","Faghani","M","1998-03-01"),
("151515","Alon","Yefet","M","1960-01-01"),
("636363","Liran","Liani","M","1997-03-02"),
("242424","Ariel","Grinfeld","W","1953-03-03"),
("789789","Ronen","Lev","M","1960-03-05"),
("456456","George","Firon","W","1990-04-04"),
("125125","Luna","Davai","W","1997-06-02"),
("636364","Mia","Rose","W","1974-04-08"),
("474747","Tay","Boey","M","1998-05-12"),
("585858","Rey","Kodi","M","1960-03-04"),
("696969","Munir","El yusof","M","1999-04-04"),
("737373","Nicolas","Cage","M","1997-06-06"),
("828282","Martin","Gonzo","M","1956-05-05"),
("919191","Winson","Charchil","M","1999-07-07"),
("616116","Luca","Kak","M","1998-01-01"),
("626262","Ted","Nork","W","2001-01-01"),
("646464","Maria","Izzabel","W","2005-03-03"),
("975975","Mel","Gibson","M","1996-03-03"),
("689689","Jack","Dave","M","2007-03-05");



insert into Player (P_ID,P_Role,Goals)
values ("111111","RW",6),
("222222","CB",2),
("333333","ST",0),
("444444","CM",4),
("555555","RB",12),
("666666","GK",7),
("777777","LB",3),
("888888","CM",5),
("999999","LB",4),
("000000","RW",10),
("121212","ST",3),
("343434","CM",5),
("565656","CB",6),
("787878","RB",7),
("123123","ST",3),
("010101","CM",5);

insert into Referee (REF_ID,REF_Salary,FL_Name)
values ("757575",125,"La Liga"),
("565657",150,"La Liga"),
("151515",10,"La Liga"),
("636363",90,"La Liga"),
("242424",165,"La Liga");

insert into Staff_Member (SM_ID,SM_Salary,SM_Role,FC_Name)
values ("789789",75,"Dresser","Real Madrid"),
("456456",28,"Fitness Trainer","Real Madrid"),
("125125",46,"Dresser","Real Madrid"),
("636364",98,"Fitness Trainer","Atletico Madrid"),
("474747",38,"Fitness Trainer","Atletico Madrid"),
("585858",78,"Dresser","Atletico Madrid"),
("696969",76,"Fitness Trainer","FC Barcelona"),
("737373",24,"Fitness Trainer","FC Barcelona"),
("828282",35,"Dresser","FC Barcelona"),
("919191",75,"Dresser","Sevilla"),
("616116",80,"Fitness Trainer","Sevilla"),
("626262",90,"Fitness Trainer","Sevilla"),
("646464",26,"Dresser","Celta Vigo"),
("975975",34,"Fitness Trainer","Celta Vigo"),
("689689",105,"Fitness Trainer","Celta Vigo");

insert into Field (F_Name,FC_Name,F_Location,F_Max_Occupancy)
values ("Camp Nou","FC Barcelona","Barcelona",99534),
("Santiago Bernabeu","Real Madrid","Madrid",81044),
("Wanda Metropolitano","Atletico Madrid","Madrid",65456),
("Ramon Sanchez Pizjuan","Sevilla","Sevilla",43883),
("Estadio Municipal","Celta Vigo","Vigo",29000);

insert into Contract(FC_Name,P_ID,Shirt_Number,Weekly_Salary,Bonus_Per_Goal,Date_Signed,Number_Of_Years_Signed,Contract_Sum)
values ("FC Barcelona","111111",10,160,25,"2019-11-25",4,1000000),
("FC Barcelona","222222",25,120,30,"2018-01-01",5,600000),
("FC Barcelona","333333",7,140,10,"2021-10-01",4,75000),
("Atletico Madrid","444444",15,120,10,"2022-01-16",4,200000),
("Atletico Madrid","555555",26,150,15,"2022-01-01",4,500000),
("Atletico Madrid","666666",10,148,20,"2021-12-25",4,600000),
("Real Madrid","777777",9,220,70,"2018-01-01",5,900000),
("Real Madrid","888888",7,110,54,"2019-02-01",5,780000),
("Real Madrid","999999",25,80,20,"2020-03-01",5,65000),
("Sevilla","000000",9,110,15,"2021-01-01",4,110000),
("Sevilla","121212",15,90,10,"2021-01-01",4,120000),
("Sevilla","343434",10,25,0,"2022-03-01",5,250000),
("Celta Vigo","565656",9,120,25,"2020-01-01",5,300000),
("Celta Vigo","787878",7,110,10,"2020-02-01",5,15000),
("Celta Vigo","123123",34,15,0,"2020-08-01",5,25000);

insert into game(FC_Name1,FC_Name2,F_Name,Game_Date,Game_Hour,Goals_Team1,Goals_Team2)
values ("FC Barcelona","Real Madrid","Camp Nou","2019-06-15","21:00:00",2,3),
("FC Barcelona","Atletico Madrid","Wanda Metropolitano","2019-07-18","15:00:00",0,1),
("FC Barcelona","Sevilla","Camp Nou","2019-02-13","18:00:00",7,5),
("FC Barcelona","Celta Vigo","Estadio Municipal","2019-01-21","17:30:00",3,3),
("FC Barcelona","Real Madrid","Camp Nou","2019-05-12","20:00:00",2,1),
("Real Madrid","Atletico Madrid","Santiago Bernabeu","2019-01-10","21:30:00",0,1),
("Real Madrid","Sevilla","Ramon Sanchez Pizjuan","2019-02-13","13:00:00",4,5),
("Real Madrid","Celta Vigo","Santiago Bernabeu","2019-07-12","21:00:00",4,2),
("Atletico Madrid","Celta Vigo","Wanda Metropolitano","2019-04-14","10:00:00",1,1),
("Atletico Madrid","Sevilla","Wanda Metropolitano","2019-01-21","17:00:00",2,1),
("Celta Vigo","Sevilla","Estadio Municipal","2019-07-25","18:00:00",2,5),
("FC Barcelona","Real Madrid","Santiago Bernabeu","2022-08-24","21:00:00",null,null);

insert into Referee_Games(Game_Serial_Number,REF_ID,REF_Role)
values (1,"151515","Main Referee"),
(1,"565657","VAR"),
(1,"757575","Line Man"),
(2,"636363","Main Referee"),
(2,"242424","VAR"),
(2,"565657","Line Man"),
(3,"151515","Main Referee"),
(3,"636363","VAR"),
(3,"242424","Line Man"),
(4,"757575","Main Referee"),
(4,"242424","VAR"),
(4,"565657","Line Man"),
(5,"636363","Main Referee"),
(5,"242424","VAR"),
(5,"151515","Line Man"),
(6,"151515","Main Referee"),
(6,"242424","VAR"),
(6,"565657","Line Man"),
(7,"757575","Main Referee"),
(7,"242424","VAR"),
(7,"636363","Line Man"),
(8,"242424","Main Referee"),
(8,"565657","VAR"),
(8,"757575","Line Man"),
(9,"151515","Main Referee"),
(9,"757575","VAR"),
(9,"636363","Line Man"),
(10,"242424","Main Referee"),
(10,"636363","VAR"),
(10,"757575","Line Man"),
(11,"151515","Main Referee"),
(11,"242424","VAR"),
(11,"565657","Line Man");

#Ligue CEO Procedures & Functions
#1
DELIMITER $$
create procedure Football_League_Table (IN In_FL_Name varchar(25))
begin
	select *
	from Football_Club
    where Football_Club.FL_Name like In_FL_Name
    order by Football_Club.Points_In_League DESC;
END$$

#2
DELIMITER $$
create procedure Referees_Judged_Games (IN In_FL_Name varchar(25))
begin
	select Referee_Games.REF_ID,Referee.FL_Name,count(Referee_Games.REF_ID) as Games_Judged
    from Referee,Referee_Games,game,Football_Club
    where Referee_Games.REF_ID = Referee.REF_ID
    and Referee_Games.Game_Serial_Number = game.Game_Serial_Number
    and Football_Club.FC_Name = game.FC_Name1
    and Football_Club.FL_Name like In_FL_Name
    group by Referee_Games.REF_ID
    order by Games_Judged desc;
END$$

#3

DELIMITER $$
create procedure Most_Expensive_Contract (IN In_FL_Name varchar(25))
begin
	select Contract.Contract_Serial_Number,Contract.FC_Name,Contract.P_ID,Contract.Shirt_Number,Contract.Weekly_Salary,
    Contract.Bonus_Per_Goal,Contract.Date_Signed,Contract.Number_Of_Years_Signed,Contract.Contract_Sum 
    from Contract,Football_Club
    where Football_Club.FC_Name=Contract.FC_Name
		and Football_Club.FL_Name like In_FL_Name
		and Contract.Contract_sum in(select max(Contract_sum) from Contract);
END$$

#4

DELIMITER $$
create procedure Highest_Goal_Difference (IN In_FL_Name varchar(25))
begin
	select game.Game_Serial_Number,game.FC_Name1,game.FC_Name2,game.F_Name,game.Game_Date,game.Game_Hour,game.Goals_Team1,game.Goals_Team2,
    abs(Goals_Team1-Goals_Team2) as Goals_Diff 
    from game,Football_Club
    where  Football_Club.FC_Name=game.FC_Name1 
		and Football_Club.FL_Name like In_FL_Name 
		and abs(Goals_Team1-Goals_Team2) = (select max(abs(Goals_Team1-Goals_Team2))from game);
END$$

#5
DELIMITER $$
create procedure Most_Goals_Player (IN In_FL_Name varchar(25))
begin
	select player.P_ID,Person.Person_F_Name,Person.Person_L_Name,player.P_Role,player.Goals,
    contract.Contract_Serial_Number,Contract.FC_Name, Football_Club.FL_Name
    from Person,player,contract,Football_Club
    where player.P_ID = Person.Person_ID
		and contract.P_ID = player.P_ID 
		and Contract.FC_Name = Football_Club.FC_Name
		and Football_Club.FL_Name like In_FL_Name 
		and Goals = (select max(Goals) from player);
END$$

#6
DELIMITER $$
create procedure get_top_scorer_from_role(IN In_FL_Name varchar(25) , Player_Role varchar(25))
begin
	select player.P_ID,Person.Person_F_Name,Person.Person_L_Name,player.P_Role,player.Goals,Contract.FC_Name, Football_Club.FL_Name
    from Person,player,contract,Football_Club
    where player.P_ID = Person.Person_ID 
		and contract.P_ID = player.P_ID
        and Contract.FC_Name = Football_Club.FC_Name
		and player.P_Role like Player_Role
		and Football_Club.FL_Name like In_FL_Name
		and player.Goals = (select max(player.goals) from Player,contract,football_club 
							where Player.P_ID = contract.P_ID and football_club.FC_Name = contract.FC_Name
                            and football_club.FL_Name like In_FL_Name and player.P_Role = Player_Role);
END$$

#7
DELIMITER $$
create function avg_salary(In_FL_Name varchar(25) , SM_Rolee varchar(25))
returns int
deterministic
begin
	declare avg_salary int;
    select avg(Staff_Member.SM_Salary)
    into avg_salary
    from Staff_Member,Football_Club
    where SM_Role = SM_Rolee and Football_Club.FL_Name like In_FL_Name;
    return (avg_salary);
END$$

#8
DELIMITER $$
create procedure Ages_Of_League_Players(IN In_FL_Name varchar(25))
begin
	select Person.Person_ID, Person.Person_F_Name, Person.Person_L_Name, Person.Person_Gender,
	Person.Person_DOB,Player.P_Role,Player.Goals,year(current_date())-year(Person_DOB) as age 
    from Person,Player,contract,Football_Club
    where Person.Person_ID = Player.P_ID and Player.P_ID = contract.P_ID and Contract.FC_Name = football_club.FC_Name and football_club.FL_Name like In_FL_Name;
END$$

#9
DELIMITER $$
create procedure Expirement_Date_Of_League_Contracts(IN In_FL_Name varchar(25))
begin
	select contract.Contract_Serial_Number, contract.FC_Name, contract.P_ID, contract.Shirt_Number,contract.Weekly_Salary,
			contract.Bonus_Per_Goal, contract.Date_Signed, contract.Number_Of_Years_Signed, contract.Contract_Sum 
    ,Adddate(contract.Date_Signed,INTERVAL contract.NUMBER_OF_YEARS_SIGNED year) as Expire_Date,
    DateDiff(Adddate(contract.Date_Signed,INTERVAL contract.NUMBER_OF_YEARS_SIGNED year),current_date()) as Days_left_For_Contract
    from Contract,Football_Club
    where Contract.FC_Name = Football_Club.FC_Name and Football_Club.FL_Name like In_FL_Name
    order by Expire_Date ASC;
END$$

#10
DELIMITER $$
create procedure Max_Capacity_Field_In_League(IN In_FL_Name varchar(25))
begin
	select field.F_name,Field.FC_Name,Field.F_Location,field.F_Max_Occupancy
    from field,football_club
    where field.FC_Name = football_club.FC_Name and field.F_Max_Occupancy =
			(select max(field.F_Max_Occupancy) from field,football_club where football_club.FL_Name like In_FL_Name) and football_club.FL_Name like In_FL_Name;
END$$

#Team Manager Procedures & Functions
#1
DELIMITER $$
create function Goals_Games_Ratio(In_Fc_Name varchar(25))
returns float
deterministic
begin
	declare GoalsNum1 int;
	declare GoalsNum2 int;
    declare GamesNum1 int;
    declare GamesNum2 int;
    select sum(Goals_Team1) into GoalsNum1 from game where game.FC_Name1 like In_Fc_Name and isnull(Goals_Team1)=false;if isnull(GoalsNum1) then set GoalsNum1 = 0; end if;
	select sum(Goals_Team2) into GoalsNum2 from game where game.FC_Name2 like In_Fc_Name and isnull(Goals_Team2)=false;if isnull(GoalsNum2) then set GoalsNum2 = 0; end if;
    select count(FC_Name1) into GamesNum1 from game where game.FC_Name1 = In_Fc_Name and isnull(Goals_Team1)=false;if isnull(GamesNum1) then set GamesNum1 = 0; end if;
	select count(FC_Name2) into GamesNum2 from game where game.FC_Name2 = In_Fc_Name and isnull(Goals_Team2)=false;if isnull(GamesNum2) then set GamesNum2 = 0; end if;
	return ((GoalsNum1+GoalsNum2)/(GamesNum1+GamesNum2));
END$$

#2
DELIMITER $$
create procedure Team_Contracts_From_Highest (IN In_FC_Name varchar(25))
begin
	select Contract.Contract_Serial_Number,Contract.FC_Name,Contract.P_ID,Contract.Shirt_Number,Contract.Weekly_Salary,
    Contract.Bonus_Per_Goal,Contract.Date_Signed,Contract.Number_Of_Years_Signed,Contract.Contract_Sum 
    from Contract,Football_Club
    where Football_Club.FC_Name=Contract.FC_Name
		and Football_Club.FC_Name like In_FC_Name
		order by Contract.Contract_Sum desc;
END$$

#3
DELIMITER $$
create procedure Ages_Of_Team_Players(IN In_FC_Name varchar(25))
begin
	select Person.Person_ID, Person.Person_F_Name, Person.Person_L_Name, Person.Person_Gender, Person.Person_DOB,Player.P_Role,Player.Goals,year(current_date())-year(Person_DOB) as age 
    from Person,Player,contract,Football_Club
    where Person.Person_ID = Player.P_ID and Player.P_ID = contract.P_ID and Contract.FC_Name = football_club.FC_Name and football_club.FC_Name like In_FC_Name
    order by age asc;
END$$

#4
DELIMITER $$
create procedure Games_Team_Played(IN In_FC_Name varchar(25))
begin
	select game.Game_Serial_Number, game.FC_Name1, game.FC_Name2, game.F_Name, game.Game_Date, game.Game_Hour, game.Goals_Team1, game.Goals_Team2
    from game
    where (game.FC_Name1 = In_FC_Name or game.FC_Name2 = In_FC_Name) and isnull(Goals_Team1)=false and isnull(Goals_Team1)=false;
END$$

#5
DELIMITER $$
create procedure Games_Team_Will_Play(IN In_FC_Name varchar(25))
begin
	select game.Game_Serial_Number, game.FC_Name1, game.FC_Name2, game.F_Name, game.Game_Date, game.Game_Hour, game.Goals_Team1, game.Goals_Team2
    from game
    where (game.FC_Name1 = In_FC_Name or game.FC_Name2 = In_FC_Name) and isnull(Goals_Team1)=true and isnull(Goals_Team1)=true;
END$$

#6
DELIMITER $$
create procedure Bonus_For_Players(IN In_FC_Name varchar(25))
begin
	select player.P_ID ,person.Person_F_Name,person.Person_L_Name,player.P_Role,(player.goals * contract.Bonus_Per_Goal) as Bonus_To_Pay
    from player,contract,person
    where person.Person_ID = player.P_ID and player.P_ID = contract.P_ID and contract.FC_Name = In_FC_Name;
END$$

#7
DELIMITER $$
create procedure Expire_Dates_For_Team_Contracts(IN In_FC_Name varchar(25))
begin
	select contract.Contract_Serial_Number, contract.FC_Name, contract.P_ID,person.Person_F_Name,person.Person_L_Name,contract.Shirt_Number,
		contract.Weekly_Salary, contract.Bonus_Per_Goal, contract.Date_Signed,contract.Number_Of_Years_Signed, contract.Contract_Sum,
        Adddate(contract.Date_Signed,INTERVAL contract.NUMBER_OF_YEARS_SIGNED year) as Expire_Date,
        DateDiff(Adddate(contract.Date_Signed,INTERVAL contract.NUMBER_OF_YEARS_SIGNED year),current_date()) as Days_left_For_Contract
    from contract,person
    where person.Person_ID = contract.P_ID and contract.FC_Name = In_FC_Name
    order by Days_left_For_Contract ASC;
END$$

#8
DELIMITER $$
create procedure Staff_Members_In_Team(IN In_FC_Name varchar(25) , SM_Rolee varchar(25))
begin
	select * from staff_member
    where staff_member.FC_Name = In_FC_Name and staff_member.SM_Role = SM_Rolee
    order by staff_member.SM_Salary desc;
END$$

select * from game

#9
DELIMITER $$
create function What_Are_The_Chances(My_Fc_Name varchar(25),Enemy_Fc_Name varchar(25))
returns float
deterministic
begin
	declare GamesPlayedNum1 int;
    declare GamesPlayedNum2 int;
    declare GamesWinNum1 int;
    declare GamesWinNum2 int;
    declare GamesWin int;
    declare GamesPlayed int;
    declare chances float;
    select count(FC_Name1) into GamesPlayedNum1 from game where game.FC_Name1 = My_Fc_Name and game.FC_Name2 = Enemy_Fc_Name and isnull(Goals_Team1)=false;
    if isnull(GamesPlayedNum1) then set GamesPlayedNum1 = 0; end if;
    select count(FC_Name2) into GamesPlayedNum2 from game where game.FC_Name2 = My_Fc_Name and game.FC_Name1 = Enemy_Fc_Name and isnull(Goals_Team2)=false;
    if isnull(GamesPlayedNum2) then set GamesPlayedNum2 = 0; end if;
    select count(FC_Name1) into GamesWinNum1 from game where game.FC_Name1 = My_Fc_Name and game.FC_Name2 = Enemy_Fc_Name and isnull(Goals_Team1)=false and Goals_Team1>Goals_Team2;
    if isnull(GamesWinNum1) then set GamesWinNum1 = 0; end if;
	select count(FC_Name2) into GamesWinNum2 from game where game.FC_Name2 = My_Fc_Name and game.FC_Name1 = Enemy_Fc_Name and isnull(Goals_Team2)=false and Goals_Team1<Goals_Team2;
    if isnull(GamesWinNum2) then set GamesWinNum2 = 0; end if;
    set GamesWin = GamesWinNum1 + GamesWinNum2;
    set GamesPlayed = GamesPlayedNum1 + GamesPlayedNum2;
    if GamesPlayed = 0 
		then return null;
        else set chances = GamesWin/GamesPlayed;
        end if;
    set chances = chances * 100;
    if chances = 100
		then set chances = chances -0.0001;
        end if;
	if chances = 0
		then set chances = chances + 0.0001;
        end if;
	return (chances);
END$$

#10
DELIMITER $$
create function Out_Games_Won(My_Fc_Name varchar(25))
returns int
deterministic
begin
	declare Field_Name varchar(25);
    declare GamesWinNum1 int;
    declare GamesWinNum2 int;
    declare GamesWin int;
    set Field_Name = (select field.F_Name from field where field.FC_Name like My_Fc_Name);
    select count(game.FC_Name1) into GamesWinNum1 from game where game.FC_Name1 = My_Fc_Name and isnull(Goals_Team1)=false and game.F_Name != Field_Name and game.Goals_Team1>game.Goals_Team2;
    if isnull(GamesWinNum1) then set GamesWinNum1 = 0; end if;
	select count(game.FC_Name2) into GamesWinNum2 from game where game.FC_Name2 = My_Fc_Name and isnull(Goals_Team2)=false and game.F_Name != Field_Name and game.Goals_Team1<game.Goals_Team2;
    if isnull(GamesWinNum2) then set GamesWinNum2 = 0; end if;
    set GamesWin = GamesWinNum1 + GamesWinNum2;
    return (GamesWin);    
END$$

#Player Procedures & Functions
#1
DELIMITER $$
create procedure My_details (IN In_P_ID varchar(25))
begin
	select Person.Person_ID, Person.Person_F_Name, Person.Person_L_Name, Person.Person_Gender, Person.Person_DOB, Player.P_Role, Player.Goals
	from Person,Player
    where Person.Person_ID like In_P_ID and Player.P_ID = Person.Person_ID;
END$$

#2
DELIMITER $$
create procedure My_Contract (IN In_P_ID varchar(25))
begin
	select *
	from contract
    where contract.P_ID like In_P_ID;
END$$

#3
DELIMITER $$
create function Goals_To_be_On_Top_Team(In_P_ID varchar(25))
returns int
deterministic
begin
	declare MyTeam varchar(25);
	declare MaxGoalsInMyTeam int;
    declare MyGoals int;
	set MyTeam = (select FC_Name from contract where contract.P_ID = In_P_ID);
    set MaxGoalsInMyTeam = (select max(player.goals) from player,contract where player.p_ID = contract.P_ID and contract.FC_Name = MyTeam);
	set MyGoals = (select player.goals from player where player.p_ID like In_P_ID);
    return (MaxGoalsInMyTeam - MyGoals);
END$$

#4
DELIMITER $$
create function Goals_To_be_On_Top_League(In_P_ID varchar(25))
returns int
deterministic
begin
	declare MyTeam varchar(25);
    declare MyLeague varchar (25);
	declare MaxGoalsInMyLeague int;
    declare MyGoals int;
	set MyTeam = (select FC_Name from contract where contract.P_ID = In_P_ID);
    set MyLeague = (select FL_Name from Football_Club where FC_Name like MyTeam);
    set MaxGoalsInMyLeague = (select max(player.goals) from player,contract,Football_Club where player.p_ID = contract.P_ID
																							and contract.FC_Name = Football_Club.FC_Name
                                                                                            and Football_Club.FL_Name like MyLeague);
	set MyGoals = (select player.goals from player where player.p_ID like In_P_ID);
    return (MaxGoalsInMyLeague - MyGoals);
END$$

#5
DELIMITER $$
create function Goals_To_be_On_Top_League_And_Role(In_P_ID varchar(25))
returns int
deterministic
begin
	declare MyTeam varchar(25);
    declare MyLeague varchar (25);
    declare MyRole varchar(25);
	declare MaxGoalsInMyLeague int;
    declare MyGoals int;
	set MyTeam = (select FC_Name from contract where contract.P_ID = In_P_ID);
    set MyLeague = (select FL_Name from Football_Club where FC_Name like MyTeam);
    set MyRole = (select player.P_Role from player where P_ID = In_P_ID);
    set MaxGoalsInMyLeague = (select max(player.goals) from player,contract,Football_Club where player.p_ID = contract.P_ID
																							and contract.FC_Name = Football_Club.FC_Name
                                                                                            and Football_Club.FL_Name like MyLeague
                                                                                            and player.P_Role like MyRole);
	set MyGoals = (select player.goals from player where player.p_ID like In_P_ID);
    return (MaxGoalsInMyLeague - MyGoals) + 1; # +1 for taking advantage
END$$

#6
DELIMITER $$
create function Give_Me_My_Bonus (In_P_ID varchar(25))
returns int
deterministic
begin
	declare MyGoalBonus int;
    declare MyNumberOfGoals int;
    set MyGoalBonus = (select contract.Bonus_Per_Goal from contract where contract.P_ID = In_P_ID);
    set MyNumberOfGoals = (select player.Goals from player where P_ID = In_P_ID);
    return (MyGoalBonus*MyNumberOfGoals);
END$$

#7 
DELIMITER $$
create function Age_At_The_End_Of_Contract(In_P_ID varchar(25))
returns int
deterministic
begin
	declare myAge int;
    declare timeOfContract int;
    declare yearsInContract int;
    set myAge = (select timestampdiff(year,(select person.Person_DOB from person where person.Person_ID like In_P_ID) ,curdate()));
	set timeOfContract = (select contract.Number_Of_Years_Signed from contract where contract.P_ID = In_P_ID);
	set yearsInContract = (select timestampdiff(year,(select contract.Date_Signed from contract where P_ID like In_P_ID),curdate()));
    return (myAge - yearsInContract + timeOfContract);
end$$

#8 
DELIMITER $$
create function Show_Same_Roles_In_My_Team(In_P_ID varchar(25))
returns int
deterministic
begin
	declare counter int;
    declare currRole varchar(25);
    declare MyTeam varchar(25);
    set MyTeam = (select contract.FC_Name from contract where contract.P_ID like In_P_ID);
    set currRole = (select player.P_Role from player where player.P_ID = In_P_ID);
    set counter = (select count(P_Role) from player,contract where contract.P_ID = player.P_ID and player.P_Role = currRole and contract.FC_Name = MyTeam);
return counter-1; #Less the player who use
end$$

#9 
DELIMITER $$
create function My_Total_Income(In_P_ID varchar(25))
returns int
deterministic 
begin
	declare WeeklySalary int;
    declare YearsSigned int;
    declare WeeksInYear int;
    set WeeksInYear = 52; # ~ 1 year = 52 weeks ~
    set WeeklySalary = (select contract.Weekly_Salary from contract where contract.P_ID = In_P_ID);
    set YearsSigned = (select contract.Number_Of_Years_Signed from contract where contract.P_ID = In_P_ID);
    return WeeklySalary*WeeksInYear*YearsSigned;
end$$

#10
DELIMITER $$
create procedure Top_Salary_Player_From_My_Role (IN In_P_ID varchar(25))
begin
	select player.P_ID,person.Person_F_Name,person.Person_L_Name, player.P_Role,player.Goals,contract.Weekly_Salary, 
			contract.Weekly_Salary-(select contract.weekly_Salary from contract where P_ID = In_P_ID) as Difference
    from person,player,contract 
    where person.Person_ID = player.P_ID
    and player.P_ID = contract.P_ID 
    and player.P_Role = (select P_Role from player where P_ID like In_P_ID) 
    and contract.Weekly_Salary = (select max(contract.Weekly_Salary) 
									from player,contract 
                                    where player.P_ID = contract.P_ID 
                                    and player.P_Role = (select P_Role from player where P_ID like In_P_ID));
END$$

#Triggers for Person
create table Person_Log(
Person_ID varchar(25),
old_Person_F_Name VARCHAR(25),
new_Person_F_Name VARCHAR(25),
old_Person_L_Name VARCHAR(25),
new_Person_L_Name VARCHAR(25),
old_Person_Gender VARCHAR(6),
new_Person_Gender VARCHAR(6),
old_Person_DOB DATE,
new_Person_DOB DATE
)engine=InnoDB

#INSERT Person

delimiter $
CREATE TRIGGER Perosn_Insert AFTER INSERT ON Person
FOR EACH ROW
BEGIN
 INSERT INTO Person_Log VALUES(new.Person_ID,"NULL",new.Person_F_Name,"NULL",new.Person_L_Name,"NULL",new.Person_Gender,"0000-00-00",new.Person_DOB ,now(), 'insert');
END$
   
delimiter ;

#Delete Person

delimiter $
CREATE TRIGGER Person_Delete AFTER DELETE ON Person
FOR EACH ROW
BEGIN
 INSERT INTO Player_Log VALUES(old.Person_ID,old.Person_F_Name,"NULL",old.Person_L_Name,"NULL",old.Person_Gender,"NULL",old.Person_DOB,"0000-00-00" ,now(), 'delete');
END$
   
delimiter ;

#Update Person

delimiter $
CREATE TRIGGER Person_Update AFTER Update ON Person
FOR EACH ROW
BEGIN
 INSERT INTO Person_Log VALUES(old.Person_ID,old.Person_F_Name,new.Person_F_Name,old.Person_L_Name,new.Person_L_Name,old.Person_Gender,new.Person_Gender,old.Person_DOB,now(), 'update');
END$
   
delimiter ;

#Triggers for Player

create table player_log
(P_ID varchar(25),
old_P_Role varchar(25),
new_P_Role varchar(25),
old_Goals int,
new_Goals int,
command_ts timestamp,
command varchar(25)
)engine=InnoDB;

#INSERT PLAYER

delimiter $
CREATE TRIGGER Player_Insert AFTER INSERT ON Player
FOR EACH ROW
BEGIN
 INSERT INTO Player_Log VALUES(new.P_ID,"NULL",new.P_Role,0,new.Goals ,now(), 'insert');
END$
   
delimiter ;

#Delete player

delimiter $
CREATE TRIGGER Player_Delete AFTER DELETE ON Player
FOR EACH ROW
BEGIN
 INSERT INTO Player_Log VALUES(old.P_ID,old.P_Role,"NULL",old.Goals, -1 ,now(), 'delete');
END$
   
delimiter ;

#update player

delimiter $
CREATE TRIGGER Player_Update AFTER Update ON Player
FOR EACH ROW
BEGIN
 INSERT INTO Player_Log VALUES(old.P_IDold.P_Role,new.P_Role,old.Goals,new.Goals ,now(), 'update');
END$
   
delimiter ;

#Triggers for football club

create table FC_log
(old_FL_Name varchar(25),
new_FL_Name varchar(25),
old_FC_Name varchar(25),
new_FC_Name varchar(25),
old_FC_President varchar(25),
new_FC_President varchar(25),
old_FC_Mangaer varchar(25),
new_FC_Mangaer varchar(25),
old_Points_In_League int,
new_Points_In_League int,
command_ts timestamp,
command varchar(25)
)engine=InnoDB;

#INSERT Football_Club

delimiter $
CREATE TRIGGER Football_Club_Insert AFTER INSERT ON Football_Club
FOR EACH ROW
BEGIN
 INSERT INTO FC_Log VALUES("NULL",new.FL_Name,"NULL",new.FC_Name,"NULL",new.FC_President,"NULL",new.FC_Mangaer,null,new.Points_In_League ,now(), 'insert');
END$
   
delimiter ;

#Delete Football_Club

delimiter $
CREATE TRIGGER Football_Club_Delete AFTER DELETE ON Football_Club
FOR EACH ROW
BEGIN
 INSERT INTO FC_Log VALUES(old.FL_Name,"NULL",old.FC_Name,"NULL",old.FC_President,"NULL",old.FC_Mangaer,"NULL",old.Points_In_League ,null,now(), 'delete');
END$
   
delimiter ;

#update Football_Club

delimiter $
CREATE TRIGGER Football_Club_Update AFTER Update ON Football_Club
FOR EACH ROW
BEGIN
 INSERT INTO FC_Log VALUES(old.FL_Name,new.FL_Name,old.FC_Name,new.FC_Name,old.FC_President,new.FC_President,old.FC_Mangaer,new.FC_Mangaer,old.Points_In_League ,new.Points_In_League,now(), 'update');
END$
   
delimiter ;

#Triggers for contract

create table Contracts_log
(Contract_Serial_Number int,
FC_Name varchar(25),
P_ID varchar(25),
old_Shirt_Number int,
new_Shirt_Number int,
old_Weekly_Salary int,
new_Weekly_Salary int,
old_Bonus_Per_Goal int,
new_Bonus_Per_Goal int,
Date_Signed date,
old_Number_Of_Years_Signed int,
new_Number_Of_Years_Signed int,
old_Contract_Sum int,
new_Contract_Sum int,
command_ts timestamp,
command varchar(25)
)engine=InnoDB;

#INSERT Contract

delimiter $
CREATE TRIGGER Contract_Insert AFTER INSERT ON Contract
FOR EACH ROW
BEGIN
 INSERT INTO Contracts_log VALUES(new.Contract_Serial_Number,new.FC_Name,new.P_ID,0,new.Shirt_Number,0,new.Weekly_Salary,0,new.Bonus_Per_Goal,new.Date_Signed,0,new.Number_Of_Years_Signed,0,new.Contract_Sum, now(), 'insert');
END$
   
delimiter ;

#Delete Contract

delimiter $
CREATE TRIGGER Contract_Delete AFTER DELETE ON Contract
FOR EACH ROW
BEGIN
 INSERT INTO Contracts_log VALUES(old.Contract_Serial_Number,old.FC_Name,old.P_ID,old.Shirt_Number,0,old.Weekly_Salary,0,old.Bonus_Per_Goal,0,old.Date_Signed,old.Number_Of_Years_Signed,0,old.Contract_Sum,0, now(), 'delete');
END$
   
delimiter ;

#update Contract

delimiter $
CREATE TRIGGER Contract_Update AFTER Update ON Contract
FOR EACH ROW
BEGIN
 INSERT INTO Contracts_log VALUES(new.Contract_Serial_Number,new.FC_Name,new.P_ID,old.Shirt_Number,new.Shirt_Number,old.Weekly_Salary,new.Weekly_Salary,old.Bonus_Per_Goal,new.Bonus_Per_Goal,
									new.Date_Signed,old.Number_Of_Years_Signed,new.Number_Of_Years_Signed,old.Contract_Sum,new.Contract_Sum, now(), 'update');
END$
   
delimiter ;

#Triggers for game

create table Game_Log
(Game_Serial_Number int,
old_FC_Name1 varchar(25),
new_FC_Name1 varchar(25),
old_FC_Name2 varchar(25),
new_FC_Name2 varchar(25),
old_REF_ID varchar(25),
new_REF_ID varchar(25),
old_F_Name varchar(25),
new_F_Name varchar(25),
old_Game_Date date,
new_Game_Date date,
olds_Game_Hour time,
new_Game_Hour time,
old_Goals_Team1 int,
new_Goals_Team1 int,
old_Goals_Team2 int,
new_Goals_Team2 int,
command_ts timestamp,
command varchar(25)
)engine=InnoDB;

#INSERT game

delimiter $
CREATE TRIGGER game_Insert AFTER INSERT ON game
FOR EACH ROW
BEGIN
 INSERT INTO game_log VALUES(new.Game_Serial_Number,"NULL",new.FC_Name1,"NULL",new.FC_Name2,"NULL",new.F_Name,"0000-00-00",new.Game_Date,"00:00:00",new.Game_Hour,null,new.Goals_Team1,null,new.Goals_Team2, now(), 'insert');
END$
   
delimiter ;

#Delete game

delimiter $
CREATE TRIGGER game_Delete AFTER DELETE ON game
FOR EACH ROW
BEGIN
 INSERT INTO game_log VALUES(old.Game_Serial_Number,old.FC_Name1,"NULL",old.FC_Name2,"NULL",old.F_Name,"NULL",old.Game_Date,"0000-00-00",old.Game_Hour,"00:00:00",old.Goals_Team1,-1,old.Goals_Team2,-1, now(), 'delete');
END$
   
delimiter ;

#update game

delimiter $
CREATE TRIGGER game_Update AFTER Update ON game
FOR EACH ROW
BEGIN
 INSERT INTO game_log VALUES(old.Game_Serial_Number,old.FC_Name1,new.FC_Name1,old.FC_Name2,new.FC_Name2,old.F_Name,new.F_Name,
 old.Game_Date,new.Game_Date,old.Game_Hour,new.Game_Hour,old.Goals_Team1,new.Goals_Team1,old.Goals_Team2,new.Goals_Team2, now(), 'update');
END$
   
delimiter ;

#Triggers for referee

create table Referee_Log
(REF_ID varchar(25),
old_REF_Salary int,
new_REF_Salary int,
old_FL_Name varchar(25),
new_FL_Name varchar(25),
command_ts timestamp,
command varchar(25)
)engine=InnoDB;

#INSERT Referee

delimiter $
CREATE TRIGGER Referee_Insert AFTER INSERT ON Referee
FOR EACH ROW
BEGIN
 INSERT INTO Referee_log VALUES(new.REF_ID,null,new.REF_Salary,"NULL",new.FL_Name, now(), 'insert');
END$
   
delimiter ;

#Delete Referee

delimiter $
CREATE TRIGGER Referee_Delete AFTER DELETE ON Referee
FOR EACH ROW
BEGIN
 INSERT INTO Referee_log VALUES(old.REF_ID,old.REF_Salary,null,old.FL_Name,"NULL", now(), 'delete');
END$
   
delimiter ;

#update Referee

delimiter $
CREATE TRIGGER Referee_Update AFTER Update ON Referee
FOR EACH ROW
BEGIN
 INSERT INTO Referee_log VALUES(new.REF_ID,old.REF_Salary,new.REF_Salary,old.FL_Name,new.FL_Name, now(), 'update');
END$
   
delimiter ;

#Triggers for Field

create table Field_Log
(old_F_Name varchar(25),
new_F_Name varchar(25),
old_FC_Name varchar(25),
new_FC_Name varchar(25),
old_F_Location varchar(25),
new_F_Location varchar(25),
old_F_Max_Occupancy int,
new_F_Max_Occupancy int,
command_ts timestamp,
command varchar(25)
)engine=InnoDB;

#INSERT Field

delimiter $
CREATE TRIGGER Field_Insert AFTER INSERT ON Field
FOR EACH ROW
BEGIN
 INSERT INTO Field_log VALUES("NULL",new.F_Name,"NULL",new.FC_Name,"NULL",new.F_Location,null,new.F_Max_Occupancy,now(),'insert');
END$
   
delimiter ;

#Delete Field

delimiter $
CREATE TRIGGER Field_Delete AFTER DELETE ON Field
FOR EACH ROW
BEGIN
 INSERT INTO Field_log VALUES(old.F_Name,"NULL",old.FC_Name,"NULL",old.F_Location,"NULL",old.F_Max_Occupancy,null,now(),'delete');
END$
   
delimiter ;

#update Field

delimiter $
CREATE TRIGGER Field_Update AFTER Update ON Field
FOR EACH ROW
BEGIN
 INSERT INTO Field_log VALUES(old.F_Name,new.F_Name,old.FC_Name,new.FC_Name,old.F_Location,new.F_Location,old.F_Max_Occupancy,new.F_Max_Occupancy,now(),'update');
END$
   
delimiter ;

#checks

#For Check only - player
insert into player values ("012012","ST",12);
delete from Player where P_ID="012012";
update Player
set P_Role = "CM"
where P_ID="012012";

#For Check Only - Field
insert into Field values ("San Mames","Atletic Bilabao","Bilbao",53289);
delete from Field where F_Name="San Mames";
update Field
set F_Max_Occupancy = 53290
where F_Name= 'San Mames';

#For Check Only -Referee
insert into Referee values ("089089",120,"La Liga");
update Referee
set REF_Name = "Xavi Alonso" , REF_Salary = 125
where REF_ID="089089";
delete from Referee where REF_ID="089089";

#For check only - Game
insert into game (FC_Name1,FC_Name2,F_Name,Game_Date,Game_Hour,Goals_Team1,Goals_Team2) values ("FC Barcelona","Atletico Madrid","Wanda Metropolitano","2020-06-18","16:00:00",5,3);
delete from game where Game_Serial_Number=12;
update game
set F_Name = "Wanda Metropolitano" , Game_Hour = "17:00:00"
where Game_Serial_Number=13;

#For Check Only - contract
insert into Contract (FC_Name,P_ID,Shirt_Number,Weekly_Salary,Bonus_Per_Goal,Date_Signed,Number_Of_Years_Signed,Contract_Sum) values ("FC Barcelona","012012",10,160,25,"2019-11-25",4,1000000);
delete from Contract where Contract_Serial_Number=16;
update Contract
set Bonus_Per_Goal = 36 , Number_Of_Years_Signed = 5
where Contract_Serial_Number=16;

#For check only - football club
insert into Football_Club values ("La liga","Atletic Bilabao","Ronen Dror","Yosi Benayun",14);
delete from Football_Club where FC_Name="Atletic Bilabao";
update Football_Club
set FC_President = "Yoav Eliasi" , FC_Mangaer = "Benet"
where FC_Name="Atletic Bilabao";

#Select tables for checks
select * from football_league;
select * from football_club;
select * from field;
select * from person;
select * from player;
select * from referee;
select * from staff_member;
select * from contract;
select * from game;
select * from referee_Games;