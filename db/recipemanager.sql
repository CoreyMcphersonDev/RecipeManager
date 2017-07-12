-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for recipewizard
CREATE DATABASE IF NOT EXISTS `recipewizard` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `recipewizard`;

-- Dumping structure for table recipewizard.difficultyrating
CREATE TABLE IF NOT EXISTS `difficultyrating` (
  `difficultyratingId` int(11) NOT NULL AUTO_INCREMENT,
  `difficultyRatingSortOrder` varchar(25) NOT NULL,
  PRIMARY KEY (`difficultyratingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.difficultyrating: ~3 rows (approximately)
/*!40000 ALTER TABLE `difficultyrating` DISABLE KEYS */;
REPLACE INTO `difficultyrating` (`difficultyratingId`, `difficultyRatingSortOrder`) VALUES
	(1, 'Easy'),
	(2, 'Medium'),
	(3, 'Hard');
/*!40000 ALTER TABLE `difficultyrating` ENABLE KEYS */;

-- Dumping structure for table recipewizard.foodartist
CREATE TABLE IF NOT EXISTS `foodartist` (
  `foodArtistId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'User id',
  `foodArtistUserName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `password` varbinary(50) NOT NULL,
  `salt` varbinary(50) NOT NULL,
  PRIMARY KEY (`foodArtistId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.foodartist: ~0 rows (approximately)
/*!40000 ALTER TABLE `foodartist` DISABLE KEYS */;
REPLACE INTO `foodartist` (`foodArtistId`, `foodArtistUserName`, `firstName`, `lastName`, `password`, `salt`) VALUES
	(1, 'coreycooks', 'corey', 'mcph', '�D<�]\0�X�aܧ0�n��hͬYJ�暑', 'j�A�n\0�0v2�q�'),
	(2, 'siggy', 'sigurd', 'siggurdsson', '�B~a#!�ȿ���c�}Zz��:Sl��e�', '�Q�t�+5.�pP!���'),
	(3, 'corey', 'corey', 'm', '� r�k����@� u����C4���J}�\\%', '$%圎.�\'8������'),
	(4, 'test', 'testy', 'mcghee', '����`��Ӛ�F�& �#\0��](���<�f��Q', '\'��d�@䵥��');
/*!40000 ALTER TABLE `foodartist` ENABLE KEYS */;

-- Dumping structure for table recipewizard.ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `ingredientId` int(11) NOT NULL COMMENT 'PK of ingredient',
  `ingredientName` varchar(75) NOT NULL,
  PRIMARY KEY (`ingredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.ingredient: ~143 rows (approximately)
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
REPLACE INTO `ingredient` (`ingredientId`, `ingredientName`) VALUES
	(1, 'Tofu'),
	(2, 'Onion, Red'),
	(3, 'Onion, Yellow'),
	(4, 'Bell Pepper, Green'),
	(5, 'Bell Pepper, Red'),
	(6, 'Bell Pepper, Yellow'),
	(7, 'Bell Pepper, Orange'),
	(8, 'Spinach'),
	(9, 'Mushroom, Cremini'),
	(10, 'Baby Portobello Mushroom'),
	(11, 'Avocado'),
	(12, 'Lime'),
	(13, 'Lettuce, Romaine'),
	(14, 'Lettuce, Iceberg'),
	(15, 'Lettuce, Green Leaf'),
	(16, 'Lettuce, Red Leaf'),
	(17, 'Tomato, Slicing'),
	(18, 'Tomato, Roma'),
	(19, 'Zucchini'),
	(20, 'Squash, Yellow'),
	(21, 'Eggplant'),
	(22, 'Garlic Clove'),
	(23, 'Kale'),
	(24, 'Carrot, Whole'),
	(25, 'Broccoli'),
	(26, 'Lemon'),
	(27, 'Sweet Potato'),
	(28, 'Cilantro'),
	(29, 'Potato, Red'),
	(30, 'Cabbage, Purple'),
	(31, 'Red Curry Paste'),
	(32, 'Banana'),
	(33, 'Olive Oil'),
	(34, 'Salt'),
	(35, 'Cheese, Jack'),
	(36, 'Cheddar Cheese'),
	(37, 'Tortilla'),
	(38, 'Black Pepper'),
	(39, 'Rosemary'),
	(40, 'Thyme'),
	(41, 'Cheese, Grated Parmigiano-Reggiano'),
	(42, 'Bread Crumbs'),
	(43, 'Linguini'),
	(44, 'Spaghetti'),
	(45, 'Fusilli'),
	(46, 'Almond Milk, Plain'),
	(47, 'Nutritional Yeast'),
	(48, 'Garlic Powder'),
	(49, 'Peas, Green'),
	(50, 'Red Pepper Flake'),
	(51, 'Tahini'),
	(52, 'Maple Syrup'),
	(53, 'Apple Cider Vinegar'),
	(54, 'Lentils, Brown'),
	(55, 'Lentils, Green'),
	(56, 'Green Curry Paste'),
	(57, 'Quinoa'),
	(58, 'Beans, Black'),
	(59, 'Vegetable Broth'),
	(60, 'Ground Cumin'),
	(61, 'Smoked Paprika'),
	(62, 'Sour Cream'),
	(63, 'Onion, Green'),
	(64, 'Coconut Milk'),
	(65, 'Mozzarella'),
	(66, 'Pizza Sauce'),
	(67, 'Olives, Black'),
	(68, 'Olives, Green'),
	(69, 'Banana Peppers'),
	(70, 'Onion, White'),
	(71, 'Rice, Brown'),
	(72, 'Jalapenos'),
	(73, 'Beans, Black'),
	(74, 'Chili Powder'),
	(75, 'Celery'),
	(76, 'Bay Leaves'),
	(77, 'Beans, Northern'),
	(78, 'Beans, Northern'),
	(79, 'Beans, Garbanzo'),
	(80, 'Beans, Garbanzo'),
	(81, 'Greens, Collard'),
	(82, 'Parmesan Cheese'),
	(83, 'Cauliflower'),
	(84, 'Coconut Oil'),
	(85, 'Cayenne Pepper'),
	(86, 'Ground Ginger'),
	(87, 'Ground Tumeric'),
	(88, 'Ground Cardamom'),
	(89, 'Arugula'),
	(90, 'Eggs'),
	(91, 'Pineapple'),
	(92, 'Pineapple'),
	(93, 'Cashews, Unsalted'),
	(94, 'Rice, White'),
	(95, 'Sriracha'),
	(96, 'Soy Sauce'),
	(97, 'Carrots, Diced'),
	(98, 'Tomato, Paste'),
	(99, 'Lentils, Red'),
	(100, 'Cornstarch'),
	(101, 'Salsa'),
	(102, 'Hot Sauce'),
	(103, 'Flour, All Purpose'),
	(104, 'Flour, Whole Wheat'),
	(105, 'Vital Wheat Gluten'),
	(106, 'Sugar, White'),
	(107, 'Sugar, Brown'),
	(108, 'Yeast'),
	(109, 'Cornmeal'),
	(110, 'Corn'),
	(111, 'Chips, Tortilla'),
	(112, 'Oats'),
	(113, 'Ginger'),
	(114, 'Asparagus'),
	(115, 'Peanut Butter'),
	(116, 'Peanuts'),
	(117, 'Apples'),
	(118, 'Honey'),
	(119, 'Cinnamon'),
	(120, 'Allspice'),
	(121, 'Walnuts'),
	(122, 'Yogurt'),
	(123, 'Applesauce, Unsweetened'),
	(124, 'Applesauce, Sweetened'),
	(125, 'Coffee'),
	(126, 'Vanilla'),
	(127, 'Cocoa Powder'),
	(128, 'Baking Soda'),
	(129, 'Baking Powder'),
	(130, 'Butter'),
	(131, 'Chocolate Chips'),
	(132, 'Curry Powder'),
	(133, 'Bread Crumbs'),
	(134, 'Italian Seasoning'),
	(135, 'Masala Spice'),
	(136, 'Beans, Kidney'),
	(137, 'Beans, Kidney'),
	(138, 'Tomato, Diced'),
	(139, 'Cumin'),
	(140, 'Oregano'),
	(141, 'Onion, Powder'),
	(142, 'Garlic, Powder'),
	(143, 'Parsley'),
	(144, 'Asparagus'),
	(145, 'Water'),
	(146, 'Vinegar, Rice'),
	(147, 'Vinegar, White'),
	(148, 'Vinegar, Sherry'),
	(149, 'Turmeric'),
	(150, 'Cardamom'),
	(151, 'Vinegar, Apple Cider'),
	(152, 'Sriracha'),
	(153, 'Sugar, Powdered'),
	(154, 'Almond Meal');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;

-- Dumping structure for table recipewizard.mealhistory
CREATE TABLE IF NOT EXISTS `mealhistory` (
  `mealHistoryId` int(11) NOT NULL AUTO_INCREMENT,
  `recipeId` int(11) NOT NULL,
  `foodArtistId` int(2) NOT NULL,
  `tasteratingId` int(11) NOT NULL,
  `mealMadeDate` date NOT NULL,
  PRIMARY KEY (`mealHistoryId`),
  KEY `tasterating_meal_history_fk` (`tasteratingId`),
  KEY `recipe_meal_history_fk` (`recipeId`),
  KEY `foodartist_foodartistId` (`foodArtistId`),
  CONSTRAINT `foodartist_foodartistId` FOREIGN KEY (`foodArtistId`) REFERENCES `foodartist` (`foodArtistId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_meal_history_fk` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`recipeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tasterating_meal_history_fk` FOREIGN KEY (`tasteratingId`) REFERENCES `tasterating` (`tasterating_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.mealhistory: ~100 rows (approximately)
/*!40000 ALTER TABLE `mealhistory` DISABLE KEYS */;
REPLACE INTO `mealhistory` (`mealHistoryId`, `recipeId`, `foodArtistId`, `tasteratingId`, `mealMadeDate`) VALUES
	(1, 2, 1, 3, '2017-01-01'),
	(2, 5, 1, 4, '2017-01-02'),
	(3, 5, 1, 4, '2017-01-03'),
	(4, 5, 1, 4, '2017-01-04'),
	(5, 5, 1, 4, '2017-01-05'),
	(6, 8, 1, 3, '2017-01-06'),
	(7, 8, 1, 3, '2017-01-07'),
	(8, 9, 1, 4, '2017-01-08'),
	(9, 10, 1, 4, '2017-01-09'),
	(10, 18, 1, 3, '2017-01-11'),
	(11, 13, 1, 4, '2017-01-12'),
	(12, 20, 1, 5, '2017-01-15'),
	(13, 12, 1, 4, '2017-01-17'),
	(14, 11, 1, 4, '2017-01-19'),
	(15, 16, 1, 5, '2017-01-23'),
	(16, 15, 1, 3, '2017-01-27'),
	(17, 13, 1, 4, '2017-01-30'),
	(18, 9, 1, 3, '2017-02-04'),
	(19, 23, 1, 4, '2017-02-06'),
	(20, 25, 1, 2, '2017-02-09'),
	(21, 14, 1, 4, '2017-02-12'),
	(22, 17, 1, 5, '2017-02-14'),
	(23, 10, 1, 5, '2017-02-14'),
	(24, 22, 1, 3, '2017-02-24'),
	(25, 15, 1, 3, '2017-02-26'),
	(26, 19, 1, 5, '2017-02-28'),
	(27, 13, 1, 4, '2017-03-05'),
	(28, 22, 1, 4, '2017-03-07'),
	(29, 12, 1, 4, '2017-03-09'),
	(30, 20, 1, 4, '2017-03-13'),
	(31, 24, 1, 5, '2017-03-15'),
	(32, 13, 1, 3, '2017-03-16'),
	(33, 8, 1, 4, '2017-03-19'),
	(34, 15, 1, 3, '2017-03-21'),
	(35, 2, 1, 4, '2017-03-27'),
	(36, 9, 1, 4, '2017-03-30'),
	(37, 14, 1, 3, '2017-04-02'),
	(38, 5, 1, 4, '2017-04-05'),
	(39, 11, 1, 3, '2017-04-06'),
	(40, 11, 1, 4, '2017-04-09'),
	(41, 2, 1, 4, '2017-04-12'),
	(42, 9, 1, 2, '2017-04-15'),
	(43, 5, 1, 5, '2017-04-16'),
	(44, 20, 1, 5, '2017-04-17'),
	(45, 19, 1, 5, '2017-04-19'),
	(46, 16, 1, 5, '2017-04-20'),
	(47, 20, 1, 4, '2017-04-21'),
	(48, 12, 1, 3, '2017-04-27'),
	(49, 22, 1, 4, '2017-04-29'),
	(50, 24, 1, 2, '2017-05-02'),
	(51, 2, 1, 3, '2017-05-03'),
	(52, 5, 1, 2, '2017-05-07'),
	(53, 15, 1, 3, '2017-05-08'),
	(54, 18, 1, 3, '2017-05-10'),
	(55, 10, 1, 3, '2017-05-11'),
	(56, 13, 1, 4, '2017-05-14'),
	(57, 22, 1, 4, '2017-05-17'),
	(58, 14, 1, 4, '2017-05-22'),
	(59, 25, 1, 3, '2017-05-25'),
	(60, 23, 1, 3, '2017-05-28'),
	(61, 10, 1, 4, '2017-05-31'),
	(62, 13, 1, 2, '2017-06-02'),
	(63, 12, 1, 2, '2017-06-05'),
	(64, 2, 1, 4, '2017-06-08'),
	(65, 8, 1, 4, '2017-06-11'),
	(66, 16, 1, 5, '2017-06-12'),
	(67, 25, 1, 5, '2017-06-15'),
	(68, 14, 1, 5, '2017-06-18'),
	(69, 19, 1, 5, '2017-07-04'),
	(70, 14, 1, 5, '2017-07-04'),
	(71, 2, 1, 4, '2017-07-08'),
	(72, 10, 1, 4, '2017-07-11'),
	(73, 23, 1, 3, '2017-07-15'),
	(74, 15, 1, 3, '2017-07-16'),
	(75, 22, 1, 4, '2017-07-17'),
	(76, 8, 1, 2, '2017-07-18'),
	(77, 9, 1, 4, '2017-07-19'),
	(78, 10, 1, 3, '2017-07-20'),
	(79, 9, 1, 4, '2017-07-21'),
	(80, 17, 1, 4, '2017-07-22'),
	(81, 11, 1, 3, '2017-07-23'),
	(82, 13, 1, 3, '2017-07-24'),
	(83, 14, 1, 4, '2017-07-25'),
	(84, 25, 1, 4, '2017-07-26'),
	(85, 2, 1, 4, '2017-07-27'),
	(86, 9, 1, 4, '2017-07-28'),
	(87, 22, 1, 4, '2017-07-29'),
	(88, 11, 1, 4, '2017-07-30'),
	(89, 15, 1, 4, '2017-07-31'),
	(90, 13, 1, 5, '2017-08-01'),
	(91, 23, 1, 2, '2017-08-02'),
	(92, 18, 1, 3, '2017-08-03'),
	(93, 20, 1, 5, '2017-08-04'),
	(94, 2, 1, 4, '2017-08-05'),
	(95, 13, 1, 4, '2017-08-06'),
	(96, 19, 1, 5, '2017-08-07'),
	(97, 22, 1, 4, '2017-08-08'),
	(98, 14, 1, 5, '2017-08-09'),
	(99, 2, 1, 4, '2017-08-10'),
	(100, 23, 1, 2, '2017-08-11');
/*!40000 ALTER TABLE `mealhistory` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `recipeId` int(11) NOT NULL COMMENT 'PK of recipe',
  `recipeName` varchar(100) NOT NULL,
  `recipeTimeCookMinutes` int(11) NOT NULL DEFAULT 30,
  `recipeTimePrepMinutes` int(11) NOT NULL DEFAULT 30,
  `totalTime` int(2) DEFAULT NULL,
  `serves` int(2) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `photoPath` varchar(255) DEFAULT NULL,
  `recipeInstructions` longtext NOT NULL,
  `recipeSource` varchar(100) DEFAULT NULL,
  `foodArtistId` int(11) DEFAULT NULL COMMENT 'User id',
  `recipecategory_id` int(11) NOT NULL,
  `recipecuisine_id` int(11) NOT NULL,
  `difficultyrating_id` int(11) NOT NULL,
  PRIMARY KEY (`recipeId`),
  KEY `recipecuisine_recipe_fk` (`recipecuisine_id`),
  KEY `difficutlyrating_recipe_fk` (`difficultyrating_id`),
  KEY `recipecategory_recipe_fk` (`recipecategory_id`),
  KEY `foodartist_recipe_fk` (`foodArtistId`),
  CONSTRAINT `difficutlyrating_recipe_fk` FOREIGN KEY (`difficultyrating_id`) REFERENCES `difficultyrating` (`difficultyratingId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foodartist_recipe_fk` FOREIGN KEY (`foodArtistId`) REFERENCES `foodartist` (`foodArtistId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipecategory_recipe_fk` FOREIGN KEY (`recipecategory_id`) REFERENCES `recipecategory` (`recipeCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipecuisine_recipe_fk` FOREIGN KEY (`recipecuisine_id`) REFERENCES `recipecuisine` (`recipeCuisineId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipe: ~20 rows (approximately)
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
REPLACE INTO `recipe` (`recipeId`, `recipeName`, `recipeTimeCookMinutes`, `recipeTimePrepMinutes`, `totalTime`, `serves`, `photo`, `photoPath`, `recipeInstructions`, `recipeSource`, `foodArtistId`, `recipecategory_id`, `recipecuisine_id`, `difficultyrating_id`) VALUES
	(2, 'Crispy Mushroom, Spinach, and Avocado Quesadillas', 30, 30, 60, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\CrispyMushroomSpinachAvocadoQuesadillasMain', 'In a large skillet over medium heat, heat oil until shimmering. Add chopped red onion and a dash of salt, stirring occasionally, until the onions are turning translucent. Add sliced mushrooms and cook, stirring occasionally, until tender and turning golden, about 6 minutes. Add half of the spinach mixture, let it wilt a little, and then add the second. Cook until spinach is wilted and the mixture is dry, 2 to 3 minutes or longer. Season with salt and pepper and a splash of lime juice. Remove from heat.', 'http://cookieandkate.com/2013/crispy-mushroom-spinach-and-avocado-quesadillas/', 1, 1, 4, 1),
	(5, 'Sweet Potato Black Bean, and Quinoa Chili', 45, 15, 60, 8, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\SweetPotatoBlackBeanQuinoaChiliMain', 'In large pot or dutch oven, heat oil over medium heat. Add onions, cook until soft and they start to turn brown (about 7 – 10 minutes). Add garlic, cook for another minute or so. Add the tomato paste, chili powder, cumin, oregano, garlic powder and onion powder, cook for 2 more minutes stirring constantly. Add tomatoes, liquids, beans and sweet potato, stir until combined. Add quinoa, bring to a boil, reduce heat, cover slightly ajar and cook for 30 – 40 minutes, stirring occasionally. Chili is ready when sweet potatoes are tender. Add additional water if chili is too thick for your liking.', 'http://www.theroastedroot.net/sweet-potato-black-bean-quinoa-chili/', 1, 1, 1, 1),
	(8, 'French Tian with Bread Crumbs', 45, 30, 75, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\FrenchTianwithBreadCrumbsMain', 'Preheat oven to 375. Arrange eggplant and zucchini in a single layer on a baking sheet coated with cooking spray. Lightly coat vegetables with cooking spray. Bake at 375° for 15 minutes. Arrange half of eggplant in a single layer in an 11 x 7-inch glass or ceramic baking dish coated with cooking spray. Top with half of zucchini and half of tomato. Drizzle 2 1/4 teaspoons oil evenly over vegetables. Sprinkle vegetables evenly with 1/8 teaspoon salt and 1/8 teaspoon black pepper. Place bread in a food processor; process until coarse crumbs measure 2 cups. Add cheese and next 4 ingredients (through garlic) to processor; process until combined. Sprinkle 1 1/2 cups breadcrumb mixture evenly over tomato. Repeat layers with remaining eggplant, zucchini, tomatoes, oil, salt, pepper, and breadcrumb mixture. Pour broth over top. Bake at 375° for 1 hour or until vegetables are tender and topping is browned.', 'http://www.myrecipes.com/recipe/eggplant-zucchini-tomato-tian', 1, 1, 6, 2),
	(9, 'Thai Pineapple Fried Rice', 30, 30, 60, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\ThaiPineappleFriedRiceMain', 'Heat a large wok, cast iron skillet or non-stick frying pan over medium-high heat and place an empty serving bowl nearby. Once the pan is hot enough that a drop of water sizzles on contact, add 1 teaspoon oil. Pour in the eggs and cook, stirring frequently, until the eggs are scrambled and lightly set, about 30 seconds to 1 minute. Transfer the eggs to the empty bowl. Wipe out the pan if necessary with a paper towel (be careful, it’s hot!).', 'http://cookieandkate.com/2015/thai-pineapple-fried-rice-recipe/', 1, 1, 3, 2),
	(10, 'Vegan Alfredo', 10, 30, 40, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\VeganAlfredoMain', 'Add pasta to a large pot of boiling, well-salted water and cook according to package instructions. Drain and cover to prevent drying.', 'https://minimalistbaker.com/30-minute-vegan-alfredo-vegan-gf/', 1, 1, 2, 2),
	(11, 'Curry Bowls', 10, 30, 40, 2, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\CurryBowlMain', 'Preheat oven to 375 degrees F (190 C) and line a large baking sheet with parchment paper.', 'https://minimalistbaker.com/curry-roasted-vegetable-lentil-kale-salad/', 1, 1, 5, 1),
	(12, 'Vegetarian Tortilla Soup', 30, 20, 50, 8, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\VegetarianTortillaSoupMain', 'Spray large nonstick saucepan with vegetable oil spray. Add onion and garlic; cover and cook over medium-low heat until almost tender, stirring often, about 5 minutes. Stir in tomato paste, cumin and chili powder. Add broth and 2 tablespoons cilantro; bring to boil. Reduce heat; cover and simmer until flavors blend, about 15 minutes. (Can be made 1 day ahead. Cover; chill. Bring to simmer before continuing.)', 'http://cookieandkate.com/2013/vegetarian-tortilla-soup/', 1, 1, 4, 1),
	(13, 'Tofu Scramble', 15, 20, 35, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\TofuScrambleMain', 'Pat tofu dry and roll in a clean, absorbent towel with something heavy on top, such as a cast-iron skillet, for 15 minutes.', 'https://minimalistbaker.com/southwest-tofu-scramble/', 1, 2, 1, 1),
	(14, 'Sweet Potato and Black Bean Veggie Burgers', 30, 60, 90, 8, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\SweetPotatoBlackBeanVeggieBurgersMain', 'Roast the sweet potatoes: Preheat the oven to 400 degrees Fahrenheit. Slice the sweet potatoes down the center lengthwise. Place the sweet potatoes cut side down on a rimmed baking sheet. Roast until they yield to a gentle squeeze, 30 to 40 minutes or longer. Once the sweet potatoes are cool enough to handle, remove the skin (it should pull off easily) and roughly chop the insides. Set aside to cool completely.', 'http://cookieandkate.com/2013/sweet-potato-black-bean-veggie-burgers/', 1, 1, 1, 2),
	(15, 'Spicy Sweet Potato and Green Rice Burrito Bowls', 45, 20, 65, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\SpicySweetPotatoGreenRiceBurritoBowlsMain', 'Preheat oven to 425 degrees Fahrenheit. Line one large, rimmed baking sheet and one smaller sheet with parchment paper. Place the spinach, cilantro, jalapeño, shallot, garlic, salt and ½ cup of the vegetable broth in a food processor or blender. Blend until smooth.', 'http://cookieandkate.com/2015/vegan-sweet-potato-green-rice-burrito-bowls/', 1, 1, 4, 1),
	(16, '1 Bowl Vegan Chocolate Cake', 30, 15, 45, 10, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\OneBowlVeganChocolateCakeMain', 'Preheat oven to 350 degrees F (176 C) and lightly spray 2 8-inch round cake pans or 1 large rectangular pan with nonstick spray (see notes for cooking times for different size pans). Dust with cocoa powder, shake out the excess and set aside.', 'https://minimalistbaker.com/one-bowl-vegan-chocolate-cake/', 1, 4, 1, 1),
	(17, 'Simple Apple Crisp', 50, 15, 65, 8, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\SimpleAppleCrispMain', 'Preheat oven to 375 degrees F (190 C) and lightly grease a 9x9 baking dish.', 'http://cookieandkate.com/2014/healthy-gluten-free-apple-crisp/', 1, 4, 1, 2),
	(18, 'Spicy Red Lentil Curry', 25, 10, 35, 2, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\SpicyRedLentilCurryMain', 'Thoroughly rinse lentils in a fine mesh strainer and set aside. If serving with brown rice, cook at this time using this method from Saveur.', 'https://minimalistbaker.com/spicy-red-lentil-curry/', 1, 1, 5, 1),
	(19, 'Cashew-Less Vegan Queso', 15, 30, 45, 6, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\CashewlessVeganQuesoMain', 'Slice your eggplant into thin rounds just under 1/2 inch (not quite 1/4 inch). Then sprinkle both sides of the flesh with a little sea salt and arrange in a colander to help draw out some of the moisture and bitterness. Let set for 10-15 minutes. Then rinse with cool water and thoroughly pat dry between two clean towels.', 'https://minimalistbaker.com/cashew-less-vegan-queso/', 1, 5, 1, 2),
	(20, 'New York Style Pizza Crust', 15, 60, 75, 8, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images', 'Combine water and sugar in small bowl; stir to dissolve sugar.', 'http://www.food.com/recipe/new-york-style-pizza-crust-15194', 1, 6, 1, 2),
	(21, 'Dinner Rolls', 15, 90, 105, 12, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images', 'In a large bowl combine warm water with yeast and 1 teaspoon sugar. Set aside for 5-10 minutes.', NULL, 1, 6, 1, 2),
	(22, 'Thai Green Curry with Spring Vegetables', 30, 15, 45, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\ThaiGreenCurrySpringVegetablesMain', 'To cook the rice, bring a large pot of water to boil. Add the rinsed rice and continue boiling for 30 minutes, reducing heat as necessary to prevent overflow. Remove from heat, drain the rice and return the rice to pot. Cover and let the rice rest for 10 minutes or longer, until you’re ready to serve.', 'http://cookieandkate.com/2015/thai-green-curry-with-spring-vegetables/', 1, 1, 3, 1),
	(23, 'Vegetarian West African Peanut Soup', 35, 10, 45, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\VegetarianWestAfricanPeanutSoupMain', 'In a medium Dutch oven or stock pot, bring the broth to a boil. Add the onion, ginger, garlic and salt. Cook on medium-low heat for 20 minutes.', 'http://cookieandkate.com/2013/west-african-peanut-soup/', 1, 1, 7, 1),
	(24, 'Quinoa Vegetable Soup with Kale', 45, 15, 60, 6, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\QuinoaVegetableSoupWithKaleMain', 'Warm the olive oil in a large Dutch oven or pot over medium heat. Once the oil is shimmering, add the chopped onion, carrot, celery, seasonal vegetables and a pinch of salt. Cook, stirring often, until the onion has softened and is turning translucent, about 6 to 8 minutes.', 'http://cookieandkate.com/2015/quinoa-vegetable-soup-recipe/', 1, 1, 1, 1),
	(25, 'Curried Coconut Quinoa and Greens with Roasted Cauliflower', 30, 10, 40, 4, NULL, 'C:\\Users\\corey\\RecipeManager\\public\\images\\CurriedCoconutQuinoaGreensRoastedCauliflowerMain', 'Roast the cauliflower: Preheat oven to 425 degrees Fahrenheit. Toss the cauliflower florets with coconut oil, cayenne pepper and a light sprinkle of sea salt. Roast for 25 to 30 minutes on the middle rack, turning halfway, until the cauliflower is tender and golden on the edges.', 'http://cookieandkate.com/2014/curried-coconut-quinoa-greens-roasted-cauliflower/', 1, 1, 5, 2);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipecategory
CREATE TABLE IF NOT EXISTS `recipecategory` (
  `recipeCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `recipeCategoryName` varchar(25) NOT NULL,
  PRIMARY KEY (`recipeCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipecategory: ~5 rows (approximately)
/*!40000 ALTER TABLE `recipecategory` DISABLE KEYS */;
REPLACE INTO `recipecategory` (`recipeCategoryId`, `recipeCategoryName`) VALUES
	(1, 'Dinner'),
	(2, 'Breakfast'),
	(3, 'Lunch'),
	(4, 'Dessert'),
	(5, 'Snack'),
	(6, 'Bread');
/*!40000 ALTER TABLE `recipecategory` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipecuisine
CREATE TABLE IF NOT EXISTS `recipecuisine` (
  `recipeCuisineId` int(11) NOT NULL,
  `recipeCuisineName` varchar(50) NOT NULL,
  PRIMARY KEY (`recipeCuisineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipecuisine: ~7 rows (approximately)
/*!40000 ALTER TABLE `recipecuisine` DISABLE KEYS */;
REPLACE INTO `recipecuisine` (`recipeCuisineId`, `recipeCuisineName`) VALUES
	(1, 'American'),
	(2, 'Italian'),
	(3, 'Thai'),
	(4, 'Mexican'),
	(5, 'Indian'),
	(6, 'French'),
	(7, 'African');
/*!40000 ALTER TABLE `recipecuisine` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipeingredient
CREATE TABLE IF NOT EXISTS `recipeingredient` (
  `recipeId` int(11) NOT NULL COMMENT 'PK of recipe',
  `ingredientId` int(11) NOT NULL COMMENT 'PK of ingredient',
  `recipeIngredientAmount` decimal(10,2) DEFAULT NULL,
  `unitMeasure` varchar(100) DEFAULT NULL,
  `ingredientNote` varchar(100) DEFAULT NULL COMMENT 'For recipe + item specific instructions',
  PRIMARY KEY (`recipeId`,`ingredientId`),
  KEY `ingredient_recipeingredient_fk` (`ingredientId`,`unitMeasure`),
  CONSTRAINT `ingredient_recipeingredient_fk` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_recipeingredient_fk` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`recipeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipeingredient: ~238 rows (approximately)
/*!40000 ALTER TABLE `recipeingredient` DISABLE KEYS */;
REPLACE INTO `recipeingredient` (`recipeId`, `ingredientId`, `recipeIngredientAmount`, `unitMeasure`, `ingredientNote`) VALUES
	(2, 2, 1.00, 'Piece', 'chopped'),
	(2, 8, 6.00, 'Oz', 'roughly chopped'),
	(2, 9, 8.00, 'Oz', 'thinly sliced'),
	(2, 11, 2.00, 'Piece', 'thinly sliced'),
	(2, 12, 0.50, 'Piece', 'to serve'),
	(2, 33, 1.00, 'Tbsp', NULL),
	(2, 34, 0.06, 'tsp', 'to taste'),
	(2, 35, 2.50, 'Cup', 'shredded'),
	(2, 37, 8.00, 'Piece', 'to taste'),
	(2, 101, 1.00, 'Cup', 'to serve'),
	(5, 11, 1.00, 'Piece', 'thinly sliced, to serve'),
	(5, 22, 6.00, 'Clove', 'minced'),
	(5, 27, 1.00, 'Piece', 'diced'),
	(5, 28, 0.50, 'Cup', 'to serve'),
	(5, 33, 1.00, 'Tbsp', NULL),
	(5, 34, 0.06, 'tsp', 'to taste'),
	(5, 57, 1.00, 'Cup', NULL),
	(5, 59, 4.00, 'Cup', NULL),
	(5, 70, 1.00, 'Piece', 'Diced'),
	(5, 73, 15.00, 'Oz', 'drained and rinsed'),
	(5, 74, 1.50, 'Tbsp', NULL),
	(5, 98, 6.00, 'Oz', NULL),
	(5, 136, 15.00, 'Oz', 'drained and rinsed'),
	(5, 138, 15.00, 'Oz', NULL),
	(5, 139, 1.00, 'Tbsp', NULL),
	(5, 140, 1.00, 'tsp', NULL),
	(5, 141, 0.25, 'tsp', 'to taste'),
	(5, 142, 0.25, 'tsp', 'to taste'),
	(8, 17, 1.00, 'Lb', 'cut diagonally into 1/4 inch thick slices'),
	(8, 19, 1.00, 'Lb', 'cut diagonally into 1/4 inch thick slices'),
	(8, 21, 1.00, 'Lb', 'cut diagonally into 1/4 inch thick slices'),
	(8, 22, 2.00, 'Clove', 'minced'),
	(8, 33, 1.50, 'Tbsp', NULL),
	(8, 34, 0.75, 'tsp', NULL),
	(8, 38, 0.75, 'tsp', NULL),
	(8, 40, 1.50, 'tsp', NULL),
	(8, 42, 2.00, 'Cup', NULL),
	(8, 59, 0.25, 'Cup', NULL),
	(8, 82, 1.00, 'Cup', 'grated'),
	(8, 140, 2.00, 'tsp', NULL),
	(8, 143, 2.00, 'Tbsp', NULL),
	(9, 5, 1.00, 'Piece', 'large pepper, diced '),
	(9, 12, 1.00, 'Piece', 'for serving'),
	(9, 22, 2.00, 'Clove', 'pressed or minced '),
	(9, 28, 0.25, 'Cup', 'chopped, for serving'),
	(9, 34, 0.25, 'tsp', 'to taste'),
	(9, 63, 0.50, 'Cup', 'thinly sliced'),
	(9, 71, 2.00, 'Cup', 'cooked and chilled'),
	(9, 84, 2.00, 'Tbsp', 'substitute olive oil'),
	(9, 90, 2.00, 'Piece', 'beaten with a dash of salt'),
	(9, 91, 1.50, 'Cup', 'chopped, fresh is best!'),
	(9, 93, 0.50, 'Cup', 'chopped'),
	(9, 96, 1.00, 'Tbsp', 'low sodium preferred'),
	(9, 152, 2.00, 'tsp', 'to taste'),
	(10, 22, 4.00, 'Clove', 'minced'),
	(10, 33, 3.00, 'Tbsp', NULL),
	(10, 34, 0.06, 'tsp', 'to taste'),
	(10, 38, 0.50, 'tsp', 'to taste'),
	(10, 43, 8.00, 'Oz', 'Up to 10 oz'),
	(10, 46, 2.00, 'Cup', NULL),
	(10, 47, 5.00, 'Tbsp', '4 - 6 Tbsp'),
	(10, 48, 0.50, 'tsp', NULL),
	(10, 49, 1.00, 'Cup', NULL),
	(10, 82, 0.25, 'Cup', NULL),
	(10, 103, 4.00, 'Tbsp', NULL),
	(11, 5, 1.50, 'Cup', 'sliced'),
	(11, 23, 4.00, 'Cup', 'stems removed, roughly chopped'),
	(11, 24, 2.00, 'Cup', 'cut into bite-sized pieces'),
	(11, 25, 1.00, 'Piece', ''),
	(11, 26, 4.00, 'Tbsp', 'juice'),
	(11, 51, 3.00, 'Tbsp', ''),
	(11, 52, 2.00, 'Tbsp', ''),
	(11, 55, 1.00, 'Cup', 'cooked, substitute red or brown lentils'),
	(11, 56, 2.00, 'Tbsp', ''),
	(11, 84, 2.00, 'Tbsp', 'substitute olive oil'),
	(11, 132, 1.00, 'tsp', ''),
	(11, 145, 4.00, 'tsp', 'to thin curry dressing'),
	(11, 151, 0.50, 'tsp', ''),
	(12, 3, 0.75, 'Cup', 'chopped'),
	(12, 17, 1.50, 'Cup', 'chopped'),
	(12, 19, 1.00, 'Piece', 'chopped'),
	(12, 22, 2.00, 'Clove', 'minced'),
	(12, 28, 4.00, 'Tbsp', 'chopped'),
	(12, 37, 4.00, 'Piece', '6 inch diameter corn preffered, cut into 1/2 inch wide strips'),
	(12, 59, 4.00, 'Cup', ''),
	(12, 73, 15.00, 'Oz', 'drained and rinsed'),
	(12, 74, 0.75, 'tsp', ''),
	(12, 98, 1.00, 'Tbsp', ''),
	(12, 139, 1.00, 'tsp', ''),
	(13, 1, 8.00, 'Oz', 'extra-firm'),
	(13, 2, 0.25, 'Piece', 'thinly sliced'),
	(13, 5, 0.50, 'Piece', 'thinly sliced'),
	(13, 23, 2.00, 'Bunch', 'loosely chopped'),
	(13, 28, 0.25, 'Cup', 'for serving'),
	(13, 33, 2.00, 'Tbsp', ''),
	(13, 34, 0.50, 'tsp', ''),
	(13, 48, 0.50, 'tsp', ''),
	(13, 74, 0.25, 'tsp', ''),
	(13, 101, 0.50, 'Cup', 'for serving'),
	(13, 139, 0.50, 'tsp', ''),
	(13, 145, 0.25, 'tsp', 'for thinning the sauce'),
	(14, 2, 0.50, 'Piece', 'diced'),
	(14, 27, 1.50, 'Cup', 'sliced and roasted'),
	(14, 28, 0.50, 'Cup', 'chopped'),
	(14, 34, 0.50, 'tsp', ''),
	(14, 57, 1.00, 'Cup', 'cooked'),
	(14, 61, 1.00, 'tsp', ''),
	(14, 73, 15.00, 'Oz', 'rinsed and drained'),
	(14, 74, 1.00, 'tsp', ''),
	(14, 112, 1.00, 'Cup', 'cooked'),
	(14, 139, 2.00, 'tsp', ''),
	(15, 8, 1.50, 'Cup', 'lightly packed'),
	(15, 11, 1.00, 'Piece', 'for serving'),
	(15, 22, 1.00, 'Clove', 'peeled, roughly chopped'),
	(15, 27, 2.00, 'Lb', 'peeled, sliced into 1 inch thick chunks'),
	(15, 28, 0.50, 'Cup', 'lightly packed'),
	(15, 33, 3.00, 'Tbsp', ''),
	(15, 34, 0.25, 'tsp', 'to taste'),
	(15, 59, 3.00, 'Cup', ''),
	(15, 61, 0.50, 'tsp', ''),
	(15, 71, 1.50, 'Cup', 'long grain'),
	(15, 73, 30.00, 'Oz', 'Or 3 cups cooked w/ cooking liquid'),
	(15, 74, 0.50, 'tsp', ''),
	(15, 139, 2.00, 'tsp', ''),
	(15, 148, 1.00, 'tsp', 'substitute lime juice'),
	(16, 34, 0.25, 'tsp', ''),
	(16, 46, 2.25, 'Cup', ''),
	(16, 84, 0.66, 'Cup', 'melted, substitute canola oil'),
	(16, 104, 2.00, 'Cup', 'substitute unbleached all purpose flour'),
	(16, 106, 1.33, 'Cup', ''),
	(16, 123, 1.25, 'Cup', ''),
	(16, 125, 0.50, 'Cup', 'substitute almond milk'),
	(16, 126, 4.00, 'tsp', ''),
	(16, 127, 1.50, 'Cup', ''),
	(16, 128, 2.00, 'tsp', ''),
	(16, 129, 1.00, 'tsp', ''),
	(16, 130, 1.00, 'Cup', 'softened'),
	(16, 131, 0.25, 'Cup', 'semi-sweet, melted and slightly cooled'),
	(16, 151, 2.00, 'tsp', ''),
	(17, 26, 0.25, 'tsp', 'dash'),
	(17, 100, 1.00, 'Tbsp', ''),
	(17, 101, 0.50, 'Cup', 'for serving'),
	(17, 103, 0.25, 'Cup', 'packed'),
	(17, 106, 0.33, 'Cup', '1/3rd Cup'),
	(17, 107, 0.33, 'Cup', 'packed'),
	(17, 112, 0.50, 'Cup', ''),
	(17, 117, 6.00, 'Cup', 'peeled, cored, and chopped - use a variety of sweet and tart for the best results'),
	(17, 119, 0.50, 'tsp', 'heaping'),
	(17, 130, 0.33, 'Cup', ''),
	(17, 154, 0.25, 'Cup', ''),
	(18, 22, 1.50, 'Tbsp', 'minced'),
	(18, 24, 0.50, 'Cup', 'diced'),
	(18, 28, 0.25, 'Cup', 'for serving'),
	(18, 31, 3.00, 'Tbsp', 'diced'),
	(18, 59, 2.00, 'Cup', ''),
	(18, 71, 1.50, 'Cup', 'for serving'),
	(18, 84, 2.00, 'Tbsp', ''),
	(18, 98, 6.00, 'Oz', ''),
	(18, 99, 1.00, 'Cup', 'thoroughly rinsed and drained'),
	(18, 107, 1.50, 'Tbsp', ''),
	(18, 113, 1.00, 'tsp', ''),
	(18, 145, 1.00, 'Cup', ''),
	(18, 149, 0.50, 'tsp', 'more to taste'),
	(19, 21, 1.00, 'Piece', '7-9 rounds, 1/4 inch thick (roughly half medium eggplant)'),
	(19, 22, 0.25, 'tsp', 'finely minced'),
	(19, 46, 2.00, 'Cup', 'make sure to use unsweetened almond milk!'),
	(19, 47, 3.00, 'Tbsp', ''),
	(19, 74, 1.00, 'tsp', ''),
	(19, 100, 2.00, 'tsp', 'optional for thickening'),
	(19, 101, 0.25, 'Cup', 'add more or less depending on flavor and thickness'),
	(19, 139, 1.00, 'tsp', ''),
	(20, 34, 1.00, 'tsp', ''),
	(20, 103, 3.50, 'Cup', 'bread flour is preferred'),
	(20, 106, 2.00, 'tsp', ''),
	(20, 108, 2.25, 'tsp', 'dry active yeast'),
	(20, 109, 2.00, 'Tbsp', 'for lining pans while baking pizza'),
	(20, 145, 1.33, 'Cup', 'warm, 110 - 115 degrees F'),
	(21, 33, 2.00, 'Tbsp', ''),
	(21, 34, 1.00, 'Tbsp', ''),
	(21, 107, 0.25, 'Cup', ''),
	(21, 108, 1.00, 'Tbsp', 'active dry yeast'),
	(21, 145, 1.00, 'Cup', 'warm (not above 110 degrees F)'),
	(22, 8, 2.00, 'Cup', 'roughly chopped'),
	(22, 22, 2.00, 'Clove', 'chopped finely'),
	(22, 24, 3.00, 'Piece', 'peeled and sliced into 1/4 inch thick rounds'),
	(22, 33, 2.00, 'tsp', ''),
	(22, 34, 0.06, 'tsp', 'Pinch'),
	(22, 56, 2.00, 'Tbsp', ''),
	(22, 64, 14.00, 'Oz', 'Use full fat coconut milk for a richer curry'),
	(22, 70, 1.00, 'Piece', 'diced'),
	(22, 71, 1.00, 'Cup', 'rinsed'),
	(22, 96, 1.50, 'tsp', 'tamari works as well'),
	(22, 107, 1.50, 'tsp', ''),
	(22, 113, 2.00, 'Tbsp', ''),
	(23, 2, 1.00, 'Piece', 'medium onion, chopped'),
	(23, 22, 4.00, 'Clove', 'null'),
	(23, 23, 1.00, 'Bunch', 'ribs removed and leaves chopped into 1 inch strips'),
	(23, 34, 1.00, 'tsp', ''),
	(23, 59, 6.00, 'Cup', ''),
	(23, 98, 0.50, 'Cup', ''),
	(23, 113, 2.00, 'Tbsp', ''),
	(23, 115, 0.75, 'Cup', 'unsalted, chunky or smooth'),
	(23, 116, 0.25, 'Cup', 'chopped, for garnish'),
	(24, 3, 1.00, 'Piece', 'chopped'),
	(24, 17, 28.00, 'Oz', 'drained'),
	(24, 19, 1.00, 'Cup', 'chopped'),
	(24, 20, 1.00, 'Cup', 'chopped'),
	(24, 22, 6.00, 'Clove', 'minced'),
	(24, 23, 1.00, 'Bunch', 'ribs removed, roughly chopped'),
	(24, 24, 3.00, 'Piece', 'small carrots, peeled and chopped'),
	(24, 26, 1.00, 'tsp', 'juice'),
	(24, 27, 1.00, 'Cup', 'chopped'),
	(24, 33, 3.00, 'Tbsp', ''),
	(24, 34, 1.00, 'tsp', ''),
	(24, 38, 0.25, 'tsp', 'to taste'),
	(24, 40, 0.50, 'tsp', ''),
	(24, 50, 1.00, 'tsp', 'to taste'),
	(24, 57, 1.00, 'Cup', 'rinsed'),
	(24, 59, 4.00, 'Cup', ''),
	(24, 75, 2.00, 'Piece', 'chopped'),
	(24, 76, 2.00, 'Piece', 'remove before serving'),
	(24, 77, 15.00, 'Oz', 'rinsed and drained (substitute chick peas)'),
	(24, 145, 2.00, 'Cup', ''),
	(25, 3, 1.00, 'Piece', 'medium, chopped'),
	(25, 8, 4.00, 'Cup', 'substitute arugula, chard, or kale'),
	(25, 34, 1.00, 'tsp', ''),
	(25, 57, 1.00, 'Cup', ''),
	(25, 63, 2.00, 'Piece', 'for serving'),
	(25, 64, 14.00, 'Oz', ''),
	(25, 83, 1.00, 'Head', 'cut into bite-sized florets'),
	(25, 84, 4.00, 'Tbsp', 'melted (substitute olive oil)'),
	(25, 85, 0.25, 'tsp', ''),
	(25, 86, 1.00, 'tsp', ''),
	(25, 132, 0.50, 'tsp', 'your choice of curry powder'),
	(25, 145, 0.50, 'Cup', ''),
	(25, 149, 1.00, 'tsp', ''),
	(25, 150, 0.50, 'tsp', ''),
	(25, 151, 1.00, 'Tbsp', '');
/*!40000 ALTER TABLE `recipeingredient` ENABLE KEYS */;

-- Dumping structure for table recipewizard.tasterating
CREATE TABLE IF NOT EXISTS `tasterating` (
  `tasterating_id` int(11) NOT NULL,
  `tasterating_name` varchar(50) NOT NULL,
  `tasterating_sort_order` int(11) NOT NULL,
  PRIMARY KEY (`tasterating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.tasterating: ~4 rows (approximately)
/*!40000 ALTER TABLE `tasterating` DISABLE KEYS */;
REPLACE INTO `tasterating` (`tasterating_id`, `tasterating_name`, `tasterating_sort_order`) VALUES
	(1, 'Meh', 1),
	(2, 'Fair', 2),
	(3, 'Tempting', 3),
	(4, 'Heavenly', 4),
	(5, 'I\'ll have what she\'s having!', 5);
/*!40000 ALTER TABLE `tasterating` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
