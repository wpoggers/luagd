spawnpoint = {x=0, y=0}
coordinates = {0, 0}
--[[decides the what tile should be at what coordinate. might become really big]]
worldMap=
{
  {
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  },{
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  },{
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  },{
    "path","path","path","path","path","path","path","path",
    "path","path","path","path","path","path","path","path"
  },{
    "path","path","path","path","path","path","path","path",
    "path","path","path","path","path","path","path","path"
  },{
    "path","path","path","path","path","path","path","path",
    "path","path","path","path","path","path","path","path"
  },{
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  },{
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  },{
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  },{
    "ground","ground","ground","ground","ground","ground","ground","ground",
    "ground","ground","ground","ground","ground","ground","ground","ground"
  }
}
function love.load()
  love.window.setMode(1024, 576, {resizable=true, vsync=0, minwidth = 640, minheight=576})
  visible = {{},{},{},{},{},{},{},{},{}}
  for ai=spawnpoint.y+1, 9+spawnpoint.y, 1 do
    for ho=spawnpoint.x+3, 19+spawnpoint.x, 1 do
      table.insert(visible[ai-spawnpoint.y], worldMap[ai][ho])
    end
  end
end
count = 0
function love.update(dt)
  
end

function love.draw()
  for a, i in ipairs(visible) do
    for h, o in ipairs(i) do
      love.graphics.draw(love.graphics.newImage("assets/"..o..".png"), (h-1)*64, (a-1)*64)
    end
  end
end
