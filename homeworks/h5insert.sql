use waughjm;

insert into player values
('Bukayo Saka', '22', 'RW', '7', 'ENG'),
('Gabriel Martinelli', '22', 'LW', '11', 'BRA'),
('William Saliba', '22', 'CB', '2', 'FRA'),
('Aaron Ramsdale', '25', 'GK', '1', 'ENG');

insert into team values
('Arsenal FC', 'Mikel Arteta', 'The Emirates', '433');

insert into fanbase values
('Gunners', '60000', 'Premium', 'Positive');

insert into finance values
(1, 'Income', 100000, '2024-02-17'),
(2, 'Expense', 50000, '2024-02-18');

insert into feedback values
(1, 'Positive');

insert into player_position values
('RW', '', '', 'X', ''),
('LW', '', '', 'X', ''),
('CB', 'X', '', '', ''),
('GK', '', '', '', 'X');

insert into formation values
('433', '4-3-3', 'Balanced');

insert into plays_for values
('Bukayo Saka', 'Arsenal FC'),
('Gabriel Martinelli', 'Arsenal FC'),
('William Saliba', 'Arsenal FC'),
('Aaron Ramsdale', 'Arsenal FC');

select * from player;
select * from team;
select * from fanbase;
select * from finance;
select * from feedback;
select * from player_position;
select * from formation;
select * from plays_for;


