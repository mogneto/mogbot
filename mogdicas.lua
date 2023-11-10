local randomMessages = {
    [0] = "Ajeita a coluna <3",
    [1] = "Se inscreva lá: https://www.youtube.com/@mognetooficial !",
    [2] = "Cuidado!",
    [3] = "Beba água.",
    [4] = "Tente manter a calma :)",
    [5] = "Creepers têm medo de gatos.",
    [6] = "Já tomou banho hoje?",
    [7] = "Beber mel remove o envenenamento (no Minecraft).",
    [8] = "Você pode curar um Golem de Ferro com barras de ferro.",
    [9] = "Às vezes, pode estar difícil lidar com a vida. Com tudo *isso*. Quando isso acontecer, pense em mim. Pense no **mogbot**; e siga em frente de cabeça erguida.",
    [10] = "Mantenha o equilíbrio!",
    [11] = "Se a vida te der limões...",
    [12] = "Tente evitar gastos desnecessários, mas priorize ser feliz ;)",
    [13] = "Memorizar é bom, mas entender é ainda melhor.",
    [14] = "Acredite em si mesmo!",
    [15] = "Antes de sair de casa, veja a previsão do tempo.",
    [16] = "Escove os dentes 3 vezes ao dia, ou após cada refeição!",
    [17] = "Regular o sono pode ser o primeiro passo para uma vida mais saudável.",
    [18] = "Você pode usar o atalho Ctrl + Shift + Esc no Windows para abrir o Gerenciador de Tarefas.",
    [19] = "Sabia que o pé de acerola dá frutos quase o ano inteiro? Se tiver um quintal, considere plantar um! ;)",
    [20] = "A temporada de jacas começa em dezembro e vai até abril.",
    [21] = "'Procure acender uma vela em vez de amaldiçoar a escuridão'. Essa dica aqui eu tirei do google :p",
    [22] = "Não seja tóxico. Interprete como quiser.",
    [23] = "São necessárias 10 obsidianas para fazer um portal do Nether. Não se esqueça do isqueiro!",
    [24] = "Use o comando **mogmcr <item>** para descobrir como fazer o item em questão no minecraft. Já aviso que essa função ainda está em construção!",
    [25] = "O consumo exagerado de carne vermelha pode aumentar os níveis de colesterol e os riscos de doenças cardiovasculares."
}

local function sendRandomMessage(Message)
    local aleatorio = math.random(0, 25)
    Message:reply(randomMessages[aleatorio])
end

return sendRandomMessage