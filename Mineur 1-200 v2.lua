-- MAGIC-HEADER --

-------------------------------------------------------------
--			    Script réalisé par @Lucide#6139			   --
-------------------------------------------------------------
--				 POWER-LEVELING MINEUR V2              --
-------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
-- [FR] Le script doit-il afficher tous les messages dans la console ? (Surcharge au bout d'un moment) true : oui | false : non
-- [ENG] Does the script have to write everything in console ? (May overstack) true : yes | false : no
--------------------------------------------------------------------------------------------------------------------------

msgUpdate = false

--------------------------------------------------------------------------------------------------------------------------
-- [FR] Est-ce que le bot doit vendre les ressources récoltees ? true : oui | false : non
-- [ENG] Does the bot have to sell harvested resources ? true : yes | false : no
--------------------------------------------------------------------------------------------------------------------------

sellingMode = true

--------------------------------------------------------------------------------------------------------------------------
-- [FR] Est-ce que le bot doit donner ses ressources récoltées au bot banque ? true: oui | false : non
-- Attention, sellingMode doit être sur false.
-- Remplacez 0 par l'identifiant de votre bot banque.

-- [ENG] Does the bot have to give its harvested resources to the bot bank? true: yes | false: no
-- Warning, sellingMode must be on false.
-- Replace 0 by the ID of your bank bot.
--------------------------------------------------------------------------------------------------------------------------

botBank = false
	IDBotBank_Bonta = 0

--------------------------------------------------------------------------------------------------------------------------
-- [FR] Ceci est la liste de tous les objets à vendre dans ce script.
-- Veillez à modifier la valeur ["Minimum Price"] par le prix minimum pour vendre, en fonction de votre serveur.

-- [ENG] This is the list of all the items for sale in this script.
-- Be sure to change the value ["Minimum Price"] by the minimum price to sell, depending on your server.
--------------------------------------------------------------------------------------------------------------------------
items = {
	{
		["id"] = 312,
		["Name"] = "Fer",
		["Minimum Price"] = 3500,
	},
	{
		["id"] = 441,
		["Name"] = "Cuivre",
		["Minimum Price"] = 3000,
	},
	{
		["id"] = 442,
		["Name"] = "Bronze",
		["Minimum Price"] = 3500,
	},
	{
		["id"] = 443,
		["Name"] = "Kobalte",
		["Minimum Price"] = 8000,
	},
	{
		["id"] = 445,
		["Name"] = "Manganèse",
		["Minimum Price"] = 4500,
	},
	{
		["id"] = 444,
		["Name"] = "Etain",
		["Minimum Price"] = 50000,
	},
	{
		["id"] = 7032,
		["Name"] = "Silicate",
		["Minimum Price"] = 20000,
	},
	{
		["id"] = 350,
		["Name"] = "Argent",
		["Minimum Price"] = 45000,
	},
	{
		["id"] = 446,
		["Name"] = "Bauxite",
		["Minimum Price"] = 18000,
	},
	{
		["id"] = 313,
		["Name"] = "Or",
		["Minimum Price"] = 80000,
	},
	{
		["id"] = 7033,
		["Name"] = "Dolomite",
		["Minimum Price"] = 60000,
	},
	{
		["id"] = 11110,
		["Name"] = "Obsidienne",
		["Minimum Price"] = 400000,
	},
}
--------------------------------------------------------------------------------------------------------------------------

-- BEGIN-DECODE --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-- END-DECODE --