
local HideElementsTable = {
	
	["DarkRP_HUD"]				= true,
	["DarkRP_ArrestedHUD"]		= false,
	["DarkRP_EntityDisplay"] 	= false,
	["DarkRP_ZombieInfo"] 		= true,
	["DarkRP_LocalPlayerHUD"] 	= true,
	["DarkRP_Hungermod"] 		= true,
	["DarkRP_Agenda"] 			= true,
	-- Sandbox
	["CHudHealth"]				= true,
	["CHudBattery"]				= true,
	["CHudSuitPower"]			= true,

}

surface.CreateFont( "CarteDit",
{
	font = "TargetID", 
	size = 25,
	weight = 250,
	antialias = true,
	strikeout = true,
	additive = true,
} )

hook.Add("HUDPaint","Hudliferpsimple",function()
local health = LocalPlayer():Health() -- Ca regarde la vie du joueurs
if health < 0 then health = 0 elseif health > 100 then health = 100 end -- check
local food = LocalPlayer():getDarkRPVar("Energy") -- Ca regarde la faim du joueurs
draw.RoundedBox(0, 23, ScrH() - 83, 177, 22, Color(0, 0, 0, 150)) -- RoundedBox = Le font
draw.RoundedBox(0, 27.7, ScrH() - 80, health * 1.7, 15, Color(255, 100, 62, 255))
draw.RoundedBox(0, 23, ScrH() - 59, 177, 22, Color(0, 0, 0, 150))
draw.RoundedBox(0, 27.7, ScrH() - 56, food * 1.7, 15, Color(1, 142, 8, 255))
end) -- ferme la function


local function HideElements( element )
	if HideElementsTable[ element ] then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )
