function ink(hex)
	--convert hexadecimal (accepts 6 or 8 characters)
	local function convertHex(hex)
		local splitToRGB = {}

		if # hex < 6 then hex = hex .. string.rep("F", 6 - # hex) end --flesh out bad hexes

		for x = 1, # hex - 1, 2 do
			 table.insert(splitToRGB, tonumber(hex:sub(x, x + 1), 16)) --convert hexes to dec
			 if splitToRGB[# splitToRGB] < 0 then slpitToRGB[# splitToRGB] = 0 end --prevents negative values
		end
		return unpack(splitToRGB)
	end
	--predefined colours ("" works for white for convenience)
	if hex == "red" then
		hex = "FF3333FF"
	elseif hex == "green" then
		hex = "33FF33FF"
	elseif hex == "blue" then
		hex = "3333FFFF"
	elseif hex == "white" or hex == "" then
		hex = "FFFFFFFF"
	elseif hex == "black" then
		hex = "333333FF"
	end

	love.graphics.setColor(convertHex(hex))
end
