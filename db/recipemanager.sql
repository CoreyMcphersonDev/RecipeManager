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
  `difficultyrating_id` int(11) NOT NULL AUTO_INCREMENT,
  `difficultyrating_sort_order` varchar(25) NOT NULL,
  PRIMARY KEY (`difficultyrating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.difficultyrating: ~3 rows (approximately)
/*!40000 ALTER TABLE `difficultyrating` DISABLE KEYS */;
REPLACE INTO `difficultyrating` (`difficultyrating_id`, `difficultyrating_sort_order`) VALUES
	(1, 'Easy'),
	(2, 'Medium'),
	(3, 'Hard');
/*!40000 ALTER TABLE `difficultyrating` ENABLE KEYS */;

-- Dumping structure for table recipewizard.foodartist
CREATE TABLE IF NOT EXISTS `foodartist` (
  `foodartist_id` int(11) NOT NULL COMMENT 'User id',
  `foodartist_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'user id created\r\n',
  `foodartist_username` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`foodartist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.foodartist: ~0 rows (approximately)
/*!40000 ALTER TABLE `foodartist` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodartist` ENABLE KEYS */;

-- Dumping structure for table recipewizard.ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `ingredient_id` int(11) NOT NULL COMMENT 'PK of ingredient',
  `ingredient_name` varchar(75) NOT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.ingredient: ~143 rows (approximately)
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
REPLACE INTO `ingredient` (`ingredient_id`, `ingredient_name`) VALUES
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
	(54, 'Brown Lentils'),
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
	(147, 'Vinegar, White');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;

-- Dumping structure for table recipewizard.mealhistory
CREATE TABLE IF NOT EXISTS `mealhistory` (
  `mealhistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) NOT NULL,
  `tasterating_id` int(11) NOT NULL,
  `meal_made_date` date NOT NULL,
  PRIMARY KEY (`mealhistory_id`),
  KEY `tasterating_meal_history_fk` (`tasterating_id`),
  KEY `recipe_meal_history_fk` (`recipe_id`),
  CONSTRAINT `recipe_meal_history_fk` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tasterating_meal_history_fk` FOREIGN KEY (`tasterating_id`) REFERENCES `tasterating` (`tasterating_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.mealhistory: ~0 rows (approximately)
/*!40000 ALTER TABLE `mealhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `mealhistory` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `recipe_id` int(11) NOT NULL COMMENT 'PK of recipe',
  `recipe_name` varchar(100) NOT NULL,
  `recipe_timetocook_minutes` int(11) NOT NULL DEFAULT 30,
  `recipe_timetoprep_minutes` int(11) NOT NULL DEFAULT 30,
  `totaltime` int(2) DEFAULT NULL,
  `Serves` int(2) DEFAULT NULL,
  `photo` longblob DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `recipe_instructions` longtext NOT NULL,
  `foodartist_id` int(11) DEFAULT NULL COMMENT 'User id',
  `recipecategory_id` int(11) NOT NULL,
  `recipecuisine_id` int(11) NOT NULL,
  `difficultyrating_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `recipecuisine_recipe_fk` (`recipecuisine_id`),
  KEY `difficutlyrating_recipe_fk` (`difficultyrating_id`),
  KEY `recipecategory_recipe_fk` (`recipecategory_id`),
  KEY `foodartist_recipe_fk` (`foodartist_id`),
  CONSTRAINT `difficutlyrating_recipe_fk` FOREIGN KEY (`difficultyrating_id`) REFERENCES `difficultyrating` (`difficultyrating_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foodartist_recipe_fk` FOREIGN KEY (`foodartist_id`) REFERENCES `foodartist` (`foodartist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipecategory_recipe_fk` FOREIGN KEY (`recipecategory_id`) REFERENCES `recipecategory` (`recipecategory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipecuisine_recipe_fk` FOREIGN KEY (`recipecuisine_id`) REFERENCES `recipecuisine` (`recipecuisine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipe: ~25 rows (approximately)
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
REPLACE INTO `recipe` (`recipe_id`, `recipe_name`, `recipe_timetocook_minutes`, `recipe_timetoprep_minutes`, `totaltime`, `Serves`, `photo`, `photo_path`, `recipe_instructions`, `foodartist_id`, `recipecategory_id`, `recipecuisine_id`, `difficultyrating_id`) VALUES
	(1, 'Pizza', 30, 30, 60, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 1, 2),
	(2, 'Crispy Mushroom, Spinach, and Avocado Quesadillas', 30, 30, 60, 4, NULL, NULL, 'In a large skillet over medium heat, heat oil until shimmering. Add chopped red onion and a dash of salt, stirring occasionally, until the onions are turning translucent. Add sliced mushrooms and cook, stirring occasionally, until tender and turning golden, about 6 minutes. Add half of the spinach mixture, let it wilt a little, and then add the second. Cook until spinach is wilted and the mixture is dry, 2 to 3 minutes or longer. Season with salt and pepper and a splash of lime juice. Remove from heat.', NULL, 1, 4, 1),
	(3, 'Burritos', 45, 30, 75, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 4, 1),
	(4, '"The BIG Salad"', 30, 30, 60, 2, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 1, 1),
	(5, 'Sweet Potato Black Bean, and Quinoa Chili', 45, 15, 60, 8, NULL, NULL, 'In large pot or dutch oven, heat oil over medium heat. Add onions, cook until soft and they start to turn brown (about 7 – 10 minutes). Add garlic, cook for another minute or so. Add the tomato paste, chili powder, cumin, oregano, garlic powder and onion powder, cook for 2 more minutes stirring constantly. Add tomatoes, liquids, beans and sweet potato, stir until combined. Add quinoa, bring to a boil, reduce heat, cover slightly ajar and cook for 30 – 40 minutes, stirring occasionally. Chili is ready when sweet potatoes are tender. Add additional water if chili is too thick for your liking.', NULL, 1, 1, 1),
	(6, 'Tofu Tikka Misala', 45, 15, 60, 6, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 1, 1),
	(7, 'Veggie Nachos', 15, 30, 45, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 1, 1),
	(8, 'French Tian with Bread Crumbs', 45, 30, 75, 4, NULL, NULL, 'Preheat oven to 375. Arrange eggplant and zucchini in a single layer on a baking sheet coated with cooking spray. Lightly coat vegetables with cooking spray. Bake at 375° for 15 minutes. Arrange half of eggplant in a single layer in an 11 x 7-inch glass or ceramic baking dish coated with cooking spray. Top with half of zucchini and half of tomato. Drizzle 2 1/4 teaspoons oil evenly over vegetables. Sprinkle vegetables evenly with 1/8 teaspoon salt and 1/8 teaspoon black pepper. Place bread in a food processor; process until coarse crumbs measure 2 cups. Add cheese and next 4 ingredients (through garlic) to processor; process until combined. Sprinkle 1 1/2 cups breadcrumb mixture evenly over tomato. Repeat layers with remaining eggplant, zucchini, tomatoes, oil, salt, pepper, and breadcrumb mixture. Pour broth over top. Bake at 375° for 1 hour or until vegetables are tender and topping is browned.', NULL, 1, 6, 2),
	(9, 'Thai Pineapple Fried Rice', 30, 30, 60, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 3, 2),
	(10, 'Vegan Alfredo', 10, 30, 40, 4, NULL, NULL, 'Add pasta to a large pot of boiling, well-salted water and cook according to package instructions. Drain and cover to prevent drying.', NULL, 1, 2, 2),
	(11, 'Curry Bowls', 10, 30, 40, 2, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 5, 1),
	(12, 'Chipotle Black Bean Tortilla Soup', 30, 20, 50, 8, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 4, 1),
	(13, 'Tofu Scramble', 15, 20, 35, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 2, 1, 1),
	(14, 'Sweet Potato and Black Bean Veggie Burgers', 30, 60, 90, 8, NULL, NULL, 'Roast the sweet potatoes: Preheat the oven to 400 degrees Fahrenheit. Slice the sweet potatoes down the center lengthwise. Place the sweet potatoes cut side down on a rimmed baking sheet. Roast until they yield to a gentle squeeze, 30 to 40 minutes or longer. Once the sweet potatoes are cool enough to handle, remove the skin (it should pull off easily) and roughly chop the insides. Set aside to cool completely.', NULL, 1, 1, 2),
	(15, 'Spicy Sweet Potato and Green Rice Burrito Bowls', 45, 20, 65, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 4, 1),
	(16, '1 Bowl Vegan Chocolate Cake', 30, 15, 45, 10, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 4, 1, 1),
	(17, 'Simple, Gluten-Free Apple Crisp', 50, 15, 65, 8, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 4, 1, 2),
	(18, 'Spicy Red Lentil Curry', 25, 10, 35, 2, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 5, 1),
	(19, 'Cashew-Less Vegan Queso', 15, 30, 45, 6, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 5, 1, 2),
	(20, 'New York Style Pizza Crust', 15, 60, 75, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 6, 1, 2),
	(21, 'Dinner Rolls', 15, 90, 105, 12, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 6, 1, 2),
	(22, 'Thai Green Curry with Spring Vegetables', 30, 15, 45, 4, NULL, NULL, 'To cook the rice, bring a large pot of water to boil. Add the rinsed rice and continue boiling for 30 minutes, reducing heat as necessary to prevent overflow. Remove from heat, drain the rice and return the rice to pot. Cover and let the rice rest for 10 minutes or longer, until you’re ready to serve.', NULL, 1, 3, 1),
	(23, 'Vegetarian West African Peanut Soup', 35, 10, 45, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 7, 1),
	(24, 'Quinoa Vegetable Soup with Kale', 45, 15, 60, 6, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 1, 1),
	(25, 'Curried Coconut Quinoa and Greens with Roasted Cauliflower', 30, 10, 40, 4, NULL, NULL, 'RECIPE_INSTRUCTIONS', NULL, 1, 5, 2);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipecategory
CREATE TABLE IF NOT EXISTS `recipecategory` (
  `recipecategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipecategory_name` varchar(25) NOT NULL,
  PRIMARY KEY (`recipecategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipecategory: ~5 rows (approximately)
/*!40000 ALTER TABLE `recipecategory` DISABLE KEYS */;
REPLACE INTO `recipecategory` (`recipecategory_id`, `recipecategory_name`) VALUES
	(1, 'Dinner'),
	(2, 'Breakfast'),
	(3, 'Lunch'),
	(4, 'Dessert'),
	(5, 'Snack'),
	(6, 'Bread');
/*!40000 ALTER TABLE `recipecategory` ENABLE KEYS */;

-- Dumping structure for table recipewizard.recipecuisine
CREATE TABLE IF NOT EXISTS `recipecuisine` (
  `recipecuisine_id` int(11) NOT NULL,
  `recipecuisine_name` varchar(50) NOT NULL,
  PRIMARY KEY (`recipecuisine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipecuisine: ~7 rows (approximately)
/*!40000 ALTER TABLE `recipecuisine` DISABLE KEYS */;
REPLACE INTO `recipecuisine` (`recipecuisine_id`, `recipecuisine_name`) VALUES
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
  `recipe_id` int(11) NOT NULL COMMENT 'PK of recipe',
  `ingredient_id` int(11) NOT NULL COMMENT 'PK of ingredient',
  `recipeingredient_amount` decimal(10,2) DEFAULT NULL,
  `unit_of_measure` varchar(100) DEFAULT NULL,
  `ingredient_note` varchar(100) DEFAULT NULL COMMENT 'For recipe + item specific instructions',
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_recipeingredient_fk` (`ingredient_id`,`unit_of_measure`),
  CONSTRAINT `ingredient_recipeingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recipe_recipeingredient_fk` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.recipeingredient: ~77 rows (approximately)
/*!40000 ALTER TABLE `recipeingredient` DISABLE KEYS */;
REPLACE INTO `recipeingredient` (`recipe_id`, `ingredient_id`, `recipeingredient_amount`, `unit_of_measure`, `ingredient_note`) VALUES
	(1, 4, 1.00, 'Piece', 'diced'),
	(1, 65, 0.00, 'Cup', 'per crust'),
	(1, 66, 1.00, 'Jar', 'to taste'),
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
	(5, 141, 0.25, 'tsp', 'TO TASTE'),
	(5, 142, 0.25, 'tsp', 'TO TASTE'),
	(8, 17, 1.00, 'Lb', 'cut diagonally into 1/4 inch thick slices'),
	(8, 19, 1.00, 'Lb', 'cut diagonally into 1/4 inch thick slices'),
	(8, 21, 1.00, 'Lb', 'cut diagonally into 1/4 inch thick slices'),
	(8, 22, 2.00, 'clove', 'minced'),
	(8, 33, 1.50, 'Tbsp', NULL),
	(8, 34, 0.75, 'tsp', NULL),
	(8, 38, 0.75, 'tsp', NULL),
	(8, 40, 1.50, 'tsp', NULL),
	(8, 42, 2.00, 'Cup', NULL),
	(8, 59, 0.25, 'Cup', NULL),
	(8, 82, 1.00, 'Cup', 'grated'),
	(8, 140, 2.00, 'tsp', NULL),
	(8, 143, 2.00, 'Tbsp', NULL),
	(10, 22, 4.00, 'clove', 'minced'),
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
	(14, 2, 0.50, 'piece', 'diced'),
	(14, 27, 1.50, 'Cup', 'sliced and roasted'),
	(14, 28, 0.50, 'Cup', 'chopped'),
	(14, 34, 0.50, 'tsp', 'null'),
	(14, 57, 1.00, 'Cup', 'cooked'),
	(14, 61, 1.00, 'tsp', 'null'),
	(14, 73, 15.00, 'Oz', 'rinsed and drained'),
	(14, 74, 1.00, 'tsp', 'null'),
	(14, 112, 1.00, 'Cup', 'cooked'),
	(14, 139, 2.00, 'tsp', 'null'),
	(22, 8, 2.00, 'Cups', 'roughly chopped'),
	(22, 22, 2.00, 'Cloves', 'chopped finely'),
	(22, 24, 3.00, 'pieces', 'peeled and sliced into 1/4 inch thick rounds'),
	(22, 33, 2.00, 'tsp', 'null'),
	(22, 34, 0.06, 'tsp', 'Pinch'),
	(22, 56, 2.00, 'Tbsp', 'null'),
	(22, 64, 14.00, 'Oz', 'Use full fat coconut milk for a richer curry'),
	(22, 70, 1.00, 'piece', 'diced'),
	(22, 71, 1.00, 'Cup', 'rinsed'),
	(22, 96, 1.50, 'tsp', 'tamari works as well'),
	(22, 107, 1.50, 'tsp', 'null'),
	(22, 113, 2.00, 'Tbsp', 'null');
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
	(4, 'Heavenly', 5),
	(5, 'I\'ll have what she\'s having!', 5);
/*!40000 ALTER TABLE `tasterating` ENABLE KEYS */;

-- Dumping structure for table recipewizard.unitofmeasure
CREATE TABLE IF NOT EXISTS `unitofmeasure` (
  `unit_of_measure` varchar(10) NOT NULL COMMENT 'Cups, teaspoons, tablespoons, etc',
  PRIMARY KEY (`unit_of_measure`),
  KEY `unit_of_measure` (`unit_of_measure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recipewizard.unitofmeasure: ~6 rows (approximately)
/*!40000 ALTER TABLE `unitofmeasure` DISABLE KEYS */;
REPLACE INTO `unitofmeasure` (`unit_of_measure`) VALUES
	('Clove'),
	('Cup'),
	('Lb'),
	('Oz'),
	('Tbsp'),
	('Tsp');
/*!40000 ALTER TABLE `unitofmeasure` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
