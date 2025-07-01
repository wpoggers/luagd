function love.load()
  ismini = false
  wavetrail = {}
  enteredp = 0
  levelspeed = 4
  player = {}
  player.x = 0
  player.y = 500
  gravity = 1
  player.costume1 = love.graphics.newImage("wave down.png")
  player.costume2 = love.graphics.newImage("wave up.png")
  player.costume3 = love.graphics.newImage("wave flat.png")
  use = false
  doflat = false
end

function updatetrail()
  for a=1, (400/levelspeed) - 1, 1 do
    wavetrail[a] = wavetrail[a+1]
  end
  wavetrail[400/levelspeed] = player.y + 30
end

function love.update(dt)
  if enteredp < (400/levelspeed) + 1 then
    wavetrail[enteredp] = player.y + 30
    player.x = player.x + levelspeed
    enteredp = enteredp + 1
  else
    updatetrail()
  end
  doflat = false
  use = love.keyboard.isDown("up") or love.keyboard.isDown("w")
  if use and player.y >= 0 then
    if not isMini then
      player.y = player.y - levelspeed*gravity
    else
      player.y = player.y - levelspeed*2*gravity
    end
  elseif player.y <= 500 then
    if not isMini then
      player.y = player.y + levelspeed * gravity
    else
      player.y = player.y + levelspeed*2*gravity
    end
  end
  if player.y > 499 or player.y < 1 then
    doflat = true
  end
end

function love.draw()
  if doflat then
    love.graphics.draw(player.costume3, player.x, player.y)
  else
    if use then
      love.graphics.draw(player.costume2, player.x, player.y)
    else
      love.graphics.draw(player.costume1, player.x, player.y)
    end
  end
  for a, b in ipairs(wavetrail) do
    love.graphics.circle("fill", a*levelspeed, b, 15)
  end
end
