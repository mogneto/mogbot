local Discord = require('discordia')
local Client = Discord.Client()
local items = require("items")

Client:on('ready', function()
    print('mogbot esta pronto!')

    Client:setActivity({
        type = 2,
        name = "moghelp"
    })

end)

-- Primeira mensagem
Client:on("guildCreate", function(guild)
    guild.systemChannel:send("Oi! Obrigado por me adicionar ao seu servidor!\nPara saber como funciono, digite **moghelp**!")
end)

-- Abaixo os comandos do bot.
Client:on("messageCreate", function(Message)
    local rawContent = Message.content
    local isComponentInteraction = Message.interaction and Message.interaction.isMessageComponent and Message.interaction.isMessageComponent()

-- listagem de comandos
    if (rawContent:lower() == 'moghelp') then
        Message:reply(string.format('Olá, %s' .. "! \nAqui está a lista de comandos:\n**moghelp** — este comando.\n**mogneto** — menciona meu mestre.\n**mogdica** — dá uma dica aleatória.\n**mogmcr** — receitas de itens do minecraft!", Message.author.mentionString))
    end
-- agradecimento
    if (rawContent:lower() == 'obrigado mogbot' or rawContent:lower() == 'obg mogbot' or rawContent:lower() == 'obrigado mogbot.' or rawContent:lower() == 'obg mogbot.' or rawContent:lower() == 'obrigado mogbot!' or rawContent:lower() == 'obg mogbot!' or rawContent:lower() == 'obg <@1078816076298719312>' or rawContent:lower() == 'obg <@1078816076298719312>.' or rawContent:lower() == 'obg <@1078816076298719312>!' or rawContent:lower() == 'obrigado <@1078816076298719312>' or rawContent:lower() == 'obrigado <@1078816076298719312>.' or rawContent:lower() == 'obrigado <@1078816076298719312>!') then
        Message:reply(string.format('Por nada, %s' .. "! :heart:", Message.author.mentionString))
    end
-- mencionar mogneto
    if (rawContent:lower() == 'mogneto') then
        Message:reply(string.format('Te chamam, <@328026599599374336>.'))
    end
-- mogdicas
    if (rawContent:lower() == 'mogdica') then
        local sendRandomMessage = dofile("mogdicas.lua")
        sendRandomMessage(Message)
    end
-- minecraft recipes
    if rawContent:lower():sub(1, 7) == "mogmcr " then -- check if the message starts with "mogmcr"
        local itemName = rawContent:lower():sub(8) -- extract the item name from the message
        local item = items[itemName] -- look up the item in the table
        if item then -- if the item exists, show its image
        local embed = {
            title = itemName,
            description = "Aqui está a receita do item:",
            image = {
            url = item
            }
        }
        Message.channel:send{embed = embed}
        else -- if the item doesn't exist, show an error message
        Message.channel:send("Desculpe, não tenho registros desse item... :(")
        end
    end
end)

local tokenFile = io.open("token.txt", "r")
local tokenStr = tokenFile:read('*a')
tokenFile:close()
Client:run('Bot ' .. tokenStr)