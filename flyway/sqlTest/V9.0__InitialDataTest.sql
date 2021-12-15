<<<<<<< HEAD
﻿INSERT INTO `User`
(`id`, `username`, `password`,  `firstname`, `lastname`, `email`,`au_creation_date`, `au_creation_user`, `au_active`)
VALUES
(1, 'Admin', '1234','Endika', 'Fernández Cuesta' ,'endika.fernandezcuesta@gmail.com',NOW(),0, 1);

INSERT INTO `Role`
(`id`, `name`, `au_creation_date`, `au_creation_user`, `au_active`)
VALUES
-- 'Administrator role that can CRUD users and assign them a role.'
(1, 'Admin',  NOW(), 1, 1),
-- 'Chef role that must be able to CRUD his recipes, only his recipes, not the recipes of other chefs.'
(2, 'Chef', NOW(), 1, 1),
-- 'User role that should be able to browse recipes, search recipes by keywords and add comments to recipes.'
=======
﻿INSERT INTO `User`
(`id`, `username`, `password`,  `firstname`, `lastname`, `email`,`au_creation_date`, `au_creation_user`, `au_active`)
VALUES
(1, 'Admin', '1234','Endika', 'Fernández Cuesta' ,'endika.fernandezcuesta@gmail.com',NOW(),0, 1);

INSERT INTO `Role`
(`id`, `name`, `au_creation_date`, `au_creation_user`, `au_active`)
VALUES
-- 'Administrator role that can CRUD users and assign them a role.'
(1, 'Admin',  NOW(), 1, 1),
-- 'Chef role that must be able to CRUD his recipes, only his recipes, not the recipes of other chefs.'
(2, 'Chef', NOW(), 1, 1),
-- 'User role that should be able to browse recipes, search recipes by keywords and add comments to recipes.'
>>>>>>> f5d3f5626389bc45fa95f4d47e08b5ba900b5157
(3, 'Rol',  NOW(), 1, 1);