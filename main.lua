hauteurEcran = love.graphics.getHeight()
largeurEcran = love.graphics.getWidth()
padGauche = { x = 0, y = 0, largeur = 20, hauteur = 80}
padDroite = { x = largeurEcran-20, y = 0, largeur = 20, hauteur = 80}
balle = { x = 1, y = 1, largeur = 20, hauteur = 20, vitesse_x = 2, vitesse_y = 2}
vitessePads = 2
scoreJoueur1 = 0
scoreJoueur2 = 0

function remiseCentre()
    balle.x = largeurEcran/2 - balle.largeur/2
    balle.y = hauteurEcran/2 - balle.hauteur/2
end

function love.load()
    remiseCentre()
end

function love.update()
    balle.x = balle.x + balle.vitesse_x
    balle.y = balle.y + balle.vitesse_y

    if balle.y > hauteurEcran - balle.hauteur or balle.y < 0 then
        balle.vitesse_y = -balle.vitesse_y
    end
    if balle.x == padGauche.x + padGauche.largeur and padGauche.y < balle.y + balle.hauteur and padGauche.y + padGauche.hauteur > balle.y then
        balle.vitesse_x = -balle.vitesse_x
        balle.x = padGauche.x + padGauche.largeur
    end
    if balle.x + balle.largeur == padDroite.x and padDroite.y < balle.y + balle.hauteur and padDroite.y + padDroite.hauteur > balle.y then
        balle.vitesse_x = -balle.vitesse_x
        balle.x = largeurEcran - padDroite.largeur - balle.largeur
    end

    --Cas Game Over
    if balle.x < 0 then
        scoreJoueur2 = scoreJoueur2 +1
        remiseCentre()
    end
    if balle.x + balle.largeur > largeurEcran then
        scoreJoueur1 = scoreJoueur1 +1
        remiseCentre()
    end

    --Contrôles
    if love.keyboard.isDown("q") and padGauche.y < hauteurEcran - padGauche.hauteur then
        padGauche.y = padGauche.y + vitessePads
    end
    if love.keyboard.isDown("a") and padGauche.y > 0 then 
        padGauche.y = padGauche.y - vitessePads
    end 
    if love.keyboard.isDown("down") and padDroite.y < hauteurEcran - padDroite.hauteur then
        padDroite.y = padDroite.y + vitessePads
    end
    if love.keyboard.isDown("up") and padDroite.y > 0 then 
        padDroite.y = padDroite.y - vitessePads
    end  
end

function love.draw()
    local score = scoreJoueur1 .. " - " .. scoreJoueur2
    love.graphics.print(score, largeurEcran/2, 0)
    love.graphics.rectangle("fill", padGauche.x, padGauche.y, padGauche.largeur, padGauche.hauteur)
    love.graphics.rectangle("fill", largeurEcran/2 - 5, 0, 10, hauteurEcran)
    love.graphics.rectangle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)
end
