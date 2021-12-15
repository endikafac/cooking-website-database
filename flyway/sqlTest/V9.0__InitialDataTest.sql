
/*
INSERT INTO `User`
(`id`, `username`, `password`,  `firstname`, `lastname`, `email`,`au_creation_date`, `au_creation_user`, `au_active`)
VALUES
(1, 'Admin', '1234','Endika', 'Fernández Cuesta' ,'endika.fernandezcuesta@gmail.com',NOW(),1, 1);

INSERT INTO `Role`
(`id`, `name`, `au_creation_date`, `au_creation_user`, `au_active`)
VALUES
-- 'Administrator role that can CRUD users and assign them a role.'
(1, 'ROLE_ADMIN',  NOW(), 1, 1),
-- 'Chef role that must be able to CRUD his recipes, only his recipes, not the recipes of other chefs.'
(2, 'ROLE_CHEF', NOW(), 1, 1),
-- 'User role that should be able to browse recipes, search recipes by keywords and add comments to recipes.'
(3, 'ROLE_USER',  NOW(), 1, 1);
*/