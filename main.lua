hauteurEcran = love.graphics.getHeight()
largeurEcran = love.graphics.getWidth()
padGauche = { x = 0, y = 0, largeur = 20, hauteur = 80}
padDroite = { x = largeurEcran-20, y = 0, largeur = 20, hauteur = 80}
balle = { x = largeurEcran/2, y = hauteurEcran/2, largeur = 20, hauteur = 20, vitesse_x = 2, vitesse_y = 2}


function love.load()
    balle.x = balle.x - balle.largeur/2
    balle.y = balle.y - balle.hauteur/2
end

function love.update()
    balle.x = balle.x + balle.vitesse_x
    balle.y = balle.y + balle.vitesse_y

    if balle.y > hauteurEcran - balle.hauteur or balle.y < 0 then
        balle.vitesse_y = -balle.vitesse_y
    end
    if balle.x > largeurEcran - balle.largeur or balle.x < 0 then
        balle.vitesse_x = -balle.vitesse_x
    end

    if love.keyboard.isDown("down") and padGauche.y < hauteurEcran - padGauche.hauteur then
        padGauche.y = padGauche.y + 1
    end
    if love.keyboard.isDown("up") and padGauche.y > 0 then 
        padGauche.y = padGauche.y - 1
    end  
end

function love.draw()
    love.graphics.rectangle("fill", padGauche.x, padGauche.y, padGauche.largeur, padGauche.hauteur)
    love.graphics.rectangle("fill", padDroite.x, padDroite.y, padDroite.largeur, padDroite.hauteur)
    love.graphics.rectangle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)
end

