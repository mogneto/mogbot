local Discord = require('discordia')
local Client = Discord.Client()

Client:on('ready', function()
    print('mogbot esta pronto!')

    Client:setActivity({
        type = 2,
        name = "moghelp"
    })

end)

Client:on("messageCreate", function(Message)
    local rawContent = Message.content

    if (rawContent:lower() == 'moghelp') then
        Message:reply(string.format('Olá, %s' .. "! \nAqui está a lista de comandos:\n**moghelp** — este comando.\n**mogneto** — menciona meu mestre.\n**mogdica** — dá uma dica aleatória.\n**mogmcr** — receitas de itens do minecraft!", Message.author.mentionString))
    end

    if (rawContent:lower() == 'obrigado mogbot' or rawContent:lower() == 'obg mogbot' or rawContent:lower() == 'obrigado mogbot.' or rawContent:lower() == 'obg mogbot.' or rawContent:lower() == 'obrigado mogbot!' or rawContent:lower() == 'obg mogbot!' or rawContent:lower() == 'obg <@1078816076298719312>' or rawContent:lower() == 'obg <@1078816076298719312>.' or rawContent:lower() == 'obg <@1078816076298719312>!' or rawContent:lower() == 'obrigado <@1078816076298719312>' or rawContent:lower() == 'obrigado <@1078816076298719312>.' or rawContent:lower() == 'obrigado <@1078816076298719312>!') then
        Message:reply(string.format('Por nada, %s' .. "! :heart:", Message.author.mentionString))
    end

    if (rawContent:lower() == 'mogneto') then
        Message:reply(string.format('Te chamam, <@328026599599374336>.'))
    end

    if (rawContent:lower() == 'mogdica') then
        local sendRandomMessage = dofile("mogdicas.lua")
        sendRandomMessage(Message)
    end
    if (rawContent:lower() == 'mogmcr') then
        Message:reply(string.format('Oi, %s!\nAqui está uma lista com as receitas disponíveis.\nVocê pode ver a receita digitando o comando mostrado ao lado!\n**Arco** — `mogmcr bow`', Message.author.mentionString))
    end
    if (rawContent:lower() == 'mogmcr bow' or rawContent:lower() == 'mogmcrecipe bow') then
        local embed = {
            title = "Arco",
            description = "Aqui está a receita do Arco!",
            image = {
                url = "https://cdn.apexminecrafthosting.com/img/uploads/2017/03/09150629/image010-1.png"
            }
        }
        Message:reply {
            embed = embed
        }
    end
end)

local tokenFile = io.open("token.txt", "r")
local tokenStr = tokenFile:read('*a')
tokenFile:close()
Client:run('Bot ' .. tokenStr)