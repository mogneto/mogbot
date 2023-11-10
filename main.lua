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

-- Abaixo os comandos do bot dentro de um servidor.
Client:on("messageCreate", function(Message)
    local rawContent = Message.content
    local isComponentInteraction = Message.interaction and Message.interaction.isMessageComponent and Message.interaction.isMessageComponent()

-- Listagem de comandos (comando help)
    if (rawContent:lower() == 'moghelp') then
        if Message.guild then
            Message:reply(string.format('Te mandei no privado, %s' .. "!", Message.author.mentionString))
        end
        Message.author:send(string.format('Opa, %s' .. "! \nAqui está a lista de comandos:\n**moghelp** — este comando.\n**mogdica** — dá uma dica aleatória.\n**mogmcr** — receitas de itens do minecraft!", Message.author.mentionString))
    end
-- Agradecimento
    if (rawContent:lower() == 'obrigado mogbot' or rawContent:lower() == 'obg mogbot' or rawContent:lower() == 'obrigado mogbot.' or rawContent:lower() == 'obg mogbot.' or rawContent:lower() == 'obrigado mogbot!' or rawContent:lower() == 'obg mogbot!' or rawContent:lower() == 'obg <@1078816076298719312>' or rawContent:lower() == 'obg <@1078816076298719312>.' or rawContent:lower() == 'obg <@1078816076298719312>!' or rawContent:lower() == 'obrigado <@1078816076298719312>' or rawContent:lower() == 'obrigado <@1078816076298719312>.' or rawContent:lower() == 'obrigado <@1078816076298719312>!' or rawContent:lower() == 'obrigada <@1078816076298719312>' or rawContent:lower() == 'obrigada <@1078816076298719312>!' or rawContent:lower() == 'obrigada <@1078816076298719312>.' or rawContent:lower() == 'obrigada mogbot' or rawContent:lower() == 'obrigada mogbot.' or rawContent:lower() == 'obrigada mogbot!') then
        Message:reply(string.format('Por nada, %s' .. "! :heart:", Message.author.mentionString))
    end
-- Mencionar mogneto
--[[   if rawContent:lower() == "mogneto" then
        local guild = Message.guild
        local member = guild:getMember("328026599599374336")
        if guild then
            if member then
                Message.channel:send("Te chamam, " .. member.mentionString .. ".")
            else
                Message.channel:send("Meu mestre não está neste servidor.")
            end
        else
            Message.author:send("Não consigo mencionar meu mestre porque não estou em nenhum servidor.")
        end
    end --]]
-- Mogdicas
    if (rawContent:lower() == 'mogdica') then
        local sendRandomMessage = dofile("mogdicas.lua")
        sendRandomMessage(Message)
    end
-- Minecraft recipes
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
    if (rawContent:lower() == 'mogmcr') then
        local itemsList = ''
        local sortedKeys = {}
        for item, link in pairs(items) do
            table.insert(sortedKeys, item)
        end
        table.sort(sortedKeys)
        for i, item in ipairs(sortedKeys) do
            itemsList = itemsList .. '`mogmcr ' .. item .. '`' .. '\n'
        end
        if Message.guild then
            Message:reply(string.format('Te mandei a lista no privado, %s' .. "!", Message.author.mentionString))
        end
        Message.author:send('Aqui está a lista de itens:\n\n' .. itemsList)
    end
-- comandos apenas para Mog
-- Olá
    if Message.author.id == '328026599599374336' then
        if (rawContent:lower() == 'oi mogbot!') then
        Message:reply(string.format('Oi mestre!'))
        end
    else
        if (rawContent:lower() == 'oi mogbot!') then
            Message:reply(string.format('Oi, %s!', Message.author.mentionString))
        end
    end
    if Message.author.id == '328026599599374336' then
        if rawContent:lower() == 'mogbot encerrar expediente' then
        Message.channel:send('Mogbot encerrando expediente, adeus pessoal! :heart:')
        client:stop() -- Turn off the bot
        end
    else
        if rawContent:lower() == 'mogbot encerrar expediente' then
            Message:reply(string.format('Desculpe, %s,' .. "mas apenas meu mestre pode fazer isso.", Message.author.mentionString))
        end
    end
end)

local tokenFile = io.open("token.txt", "r")
local tokenStr = tokenFile:read('*a')
tokenFile:close()
Client:run('Bot ' .. tokenStr)