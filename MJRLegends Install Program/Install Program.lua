version = "1.0.1"

--Main Programs
reactorProgram = "ry3JaxKM"
tubineProgram = "yXNyVhG1"
newFusionreactorProgram = "FiSZeFsC"
energyProgram = "RYN6uUf7"
thermalEvaporationProgram = "9txmi9Q4"

latestVerions = "fYgwe5qt"
selection = 0
menu = "mainmenu"

function addToCurrentVersions()
	if fs.exists("versions.txt") then
		fs.delete("versions.txt")
	end
	if fs.exists("currentVersions.txt") then
		fs.delete("currentVersions.txt")
	end
	
	shell.run("pastebin get ".. latestVerions .." versions.txt")
	local latestVersions = {}
	file = fs.open("versions.txt","r")
	listElement = file.readLine()
	while listElement do
		table.insert(latestVersions,listElement)
		listElement = file.readLine()
	end
	file.close()
	shell.run("rm versions.txt")
	local file = fs.open("currentVersions.txt","a")
	file.writeLine(latestVersions[tonumber(selection)])
	file.close()
end

function mainMenu()
	if selection == 0 then
		-- Main Menu
		term.clear()
		term.setBackgroundColor(colors.black)
		term.setTextColor(colors.blue)
		term.setCursorPos(1,1)
		term.write("Welcome to the Install Program! V" .. version)
		term.setTextColor(colors.cyan)
		term.setCursorPos(1,2)
		print("Enter a number for the program you want to install:")
		term.setTextColor(colors.white)
		print("1 - Reactor Management(BR/Monitor Edition)")
		print("2 - Turbine Management(BR/Monitor Edition)")
		print("3 - Fusion Reactor Management(Mekanism 9+)")
		print("4 - Energy Management")
		print("5 - Thermal Evaporation Display (Mekanism 9+)")
		term.setTextColor(colors.yellow)
		print("6 - Versions")
		term.setTextColor(colors.cyan)

		selection = read()
		term.setTextColor(colors.white)
	end
	--Choice depending on what the user types
	if selection == "1" then
		if fs.exists("startup") then
			fs.delete("startup")
		end
		shell.run("pastebin get " .. reactorProgram .. " startup")
		print("Installed!")
		print("Restart the computer using (Ctrl + R)!")
		addToCurrentVersions()
		return
	elseif selection == "2" then
		if fs.exists("startup") then
			fs.delete("startup")
		end
		shell.run("pastebin get " .. tubineProgram .. " startup")
		print("Installed!")
		print("Restart the computer using (Ctrl + R)!")
		addToCurrentVersions()
		return
	elseif selection == "3" then
		if fs.exists("startup") then
			fs.delete("startup")
		end
		shell.run("pastebin get " .. newFusionreactorProgram .. " startup")
		print("Installed!")
		print("Restart the computer using (Ctrl + R)!")
		addToCurrentVersions()
		return
	elseif selection == "4" then
		if fs.exists("startup") then
			fs.delete("startup")
		end
		shell.run("pastebin get " .. energyProgram .. " startup")
		print("Installed!")
		print("Restart the computer using (Ctrl + R)!")
		addToCurrentVersions()
		return
	elseif selection == "5" then
		if fs.exists("startup") then
			fs.delete("startup")
		end
		shell.run("pastebin get " .. thermalEvaporationProgram .. " startup")
		print("Installed!")
		print("Restart the computer using (Ctrl + R)!")
		addToCurrentVersions()
		return
	elseif selection == "6" then
		if fs.exists("versions.txt") then
			fs.delete("versions.txt")
		end
		
		--See Latest versions
		shell.run("pastebin get ".. latestVerions .." versions.txt")
		local latestVersions = {}
		file = fs.open("versions.txt","r")
		listElement = file.readLine()
		while listElement do
			table.insert(latestVersions,listElement)
			listElement = file.readLine()
		end
		file.close()
		term.clear()
		term.setTextColor(colors.blue)
		term.setCursorPos(1,1)
		term.write("Latest Versions")
		yLevel = 2
		for i,v in pairs(latestVersions) do
			if (yLevel % 2 == 0) then
				term.setTextColor(colors.yellow)
			else
				term.setTextColor(colors.lime)
			end
			term.setCursorPos(1,yLevel)
			term.write(v)
			yLevel = yLevel + 1
		end
		yLevel = yLevel - 1
		--See Current versions
		if fs.exists("currentVersions.txt") then
			yLevel = yLevel + 1
			term.setTextColor(colors.blue)
			term.setCursorPos(1,yLevel)
			term.write("Current Versions")
			yLevel = yLevel+1
			local currentVersions = {}
			file = fs.open("currentVersions.txt","r")
			listElement2 = file.readLine()
			while listElement2 do
				table.insert(currentVersions,listElement2)
				listElement2 = file.readLine()
			end
			file.close()
				
			for i,v in pairs(currentVersions) do
				term.setTextColor(colors.yellow)
				term.setCursorPos(1,yLevel)
				term.write(v)
				yLevel = yLevel + 1
			end
			print()
		end
		print()
		term.setTextColor(colors.blue)
		print("1 - Back to Main Menu")
		selection = 0
		selection = read()
		if selection == "1" then
			selection = 0
			mainMenu()
		end
	else
		print("Unknown Program!")
	end
end

if selection == 0 then
	mainMenu()
end
