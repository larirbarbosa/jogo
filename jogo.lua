-- title:   phanton
-- author:  lARI.
-- desc:    exmplo do meu primeiro jogo.
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua
--PARAMETROS DO GAME
game = {
	width = 240,
	height = 136,
	state = true,
	menu = true,
	
	print_msg = function(msg,pos)--funcao mensagem game over
	if pos == "titulo" or
	pos == nil
	 then
	vert_pos = game.height-6
	else
	ver_pos = game.height + 2
	end
	
	local width_msg = print(msg, 0, -6)-- edicao do texto
	print(
	msg,
	(game.width - width_msg)//2,
	(vert_pos)//2
	)
	end,
	
	-- funcao para entrar no game
	btn_menu = function ()
	if btn(5) then -- Z = 4, X = 5, A = 6, S = 7
	game.menu = false
	end
	end
}

-- PARAMETROS DO HEROI
hero = {
	x = game.width / 10,
	y = game.height / 2,
	width = 10,
	height = 10,
	color = 11,
	direction = 0,
	sprite = 2,
	speed = 2,
	draw = function ()
	spr(
		hero.sprite,
		hero.x,
		hero.y,
	 0, 
		1, 
		hero.direction, 
		0
		)
		end,
		
		move = function ()
	
	if btn (0)and hero.y > 0 
 then hero.y = hero.y - hero.speed hero.sprite = 1 end
 if btn (1)and hero.y + hero.height < game.height 
 then hero.y = hero.y + hero.speed hero.sprite = 2 end
 if btn (2)and hero.x > 0 
 then hero.x = hero.x - hero.speed hero.sprite = 0 hero.direction = 1 end
 if btn (3)and hero.x + hero.width < game.width 
 then hero.x = hero.x + hero.speed hero.sprite = 0 hero.direction = 0 end
	end
}

--PARAMETROS INIMIGO 
enemy = {
	x = game.width / 10 * 9,
	y = game.height / 2,
	width = 10,
	height = 10,
	color = 11,
	direction = 0,
	sprite = 5,
	speed = 1,
	draw = function ()
	spr(
		enemy.sprite,
		enemy.x,
		enemy.y,
	 0, 
		1, 
		enemy.direction, 
		0
		)
	end,
	
	move = function ()
	if enemy.x > hero.x then enemy.x = enemy.x - enemy.speed end
	if enemy.x < hero.x then enemy.x = enemy.x + enemy.speed end
	if enemy.y > hero.y then enemy.y = enemy.y - enemy.speed end
	if enemy.y < hero.y then enemy.y = enemy.y + enemy.speed end
	
	end

}

-- 0: pra baixo
-- 1: pra cima
-- 2: pra esquerda
-- 3: pra direita

function TIC ()
 cls(0)
 if game.menu then
 game.print_msg('VAHAHAAIII!')
 game.print_msg ('Pressione X para jogar.', 'subttulo' )
 game.btn_menu()
 else
 
 if hero.x == enemy.x
 and hero.y == enemy.y
 then game.state = false
 end
 
	if game.state then
	hero.move()
	enemy.move()
	hero.draw()
	enemy.draw()
	else
	
	game.print_msg('Perdeu Trouxa!')
	end

end
	
end