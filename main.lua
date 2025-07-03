spawnpoint = {x=128, y=128}
playerSpeed = 4
coordinates = {x=1, y=1}
coordinates.x = spawnpoint.x
coordinates.y = spawnpoint.y
coordinates.microscale = {x=coordinates.x*64, y=coordinates.y*64}
--[[
  All textures should be 64*64 and should go in the assets folder. in the worldMap table, place    type the name of the file, minus the .png. for example, johnpork.png would be "johnpork"
  To easily edit the map, go and visit my scratch project:https://scratch.mit.edu/projects/1150260935/. 
]]
worldMap={{}}
for column=1, 256, 1 do
  table.insert(worldMap, {})
  for row=1, 256, 1 do
    table.insert(worldMap[column], "ground")
  end
end
function replaceList()
  visible = {{},{},{},{},{},{},{},{},{},{}}
  for ai=coordinates.y+1, 10+coordinates.y, 1 do
    for ho=coordinates.x+3, 19+coordinates.x, 1 do
      table.insert(visible[ai-coordinates.y], worldMap[ai][ho])
    end
  end
end

function love.load()
  love.window.setMode(1024, 576, {resizable=true, vsync=0, minwidth = 640, minheight=576})
  visible = {{},{},{},{},{},{},{},{},{}}
  for ai=spawnpoint.y+1, 9+spawnpoint.y, 1 do
    for ho=spawnpoint.x+3, 19+spawnpoint.x, 1 do
      table.insert(visible[ai-spawnpoint.y], worldMap[ai][ho])
    end
  end
end

function love.update(dt)
  if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
    coordinates.microscale.y = coordinates.microscale.y - playerSpeed
  end
  if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
    coordinates.microscale.y = coordinates.microscale.y + playerSpeed
  end
  if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
    coordinates.microscale.x = coordinates.microscale.x - playerSpeed
  end
  if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
    coordinates.microscale.x = coordinates.microscale.x + playerSpeed
  end
  coordinates.x = math.floor(coordinates.microscale.x/64)
  coordinates.y = math.floor(coordinates.microscale.y/64)
  replaceList()
end

function love.draw()
  for a, i in ipairs(visible) do
    for h, o in ipairs(i) do
      love.graphics.draw(love.graphics.newImage("assets/"..o..".png"), (h-1)*64-math.fmod(coordinates.microscale.x, 64), (a-1)*64-math.fmod(coordinates.microscale.y, 64))
    end
  end
end
