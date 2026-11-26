# NEXUS Monitor — Perguntas e respostas

[English](FAQ.md) · [Voltar ao README](README.pt.md)

**Índice:** [Geral](#geral) · [Instalar, atualizar e desinstalar](#instalar-atualizar-e-desinstalar) · [Privacidade e segurança](#privacidade-e-segurança) · [Sensores e monitorização](#sensores-e-monitorização) · [Jogos e FPS](#jogos-e-fps) · [Otimizações](#otimizações) · [Discos (Deep Scan)](#discos-deep-scan) · [Telemóvel e rede](#telemóvel-e-rede) · [Stream Deck](#stream-deck) · [Quando algo corre mal](#quando-algo-corre-mal) · [Contribuir](#contribuir)

---

## Geral

**O que é o NEXUS Monitor?**
Uma app para Windows que mostra tudo o que se passa no PC em tempo real (processador, RAM, placa gráfica, temperaturas, ventoinhas, consumos, discos, rede, processos e FPS dos jogos) numa página no browser. Também otimiza o Windows para jogos, analisa os discos, tem overlay em jogo, plugin para a Stream Deck e acesso pelo telemóvel na rede de casa.

**É grátis?**
Sim. É código aberto com [licença MIT](LICENSE): podes usar, copiar, alterar e partilhar.

**Que versões do Windows suporta?**
Windows 10 e 11, 64 bits.

**Que línguas?**
Português, inglês, espanhol, francês e alemão. A app usa a língua que escolheres nas Opções; o instalador, o atualizador e o desinstalador usam a língua do Windows.

**Funciona com AMD e Intel, não só NVIDIA?**
A monitorização funciona com processadores e placas AMD, Intel e NVIDIA. Alguns controlos são só para NVIDIA (por exemplo o limite de energia da placa e o botão da NVIDIA App) e dizem-no no cartão.

**Deixa o PC ou os jogos mais lentos?**
Foi feito para ser leve. O cartão **RECURSOS DO NEXUS** no painel mostra exatamente quanto CPU, RAM e disco gasta a cada momento. As ferramentas mais pesadas (Deep Scan, teste de velocidade, teste de estabilidade) só correm quando carregas no botão delas.

**Porquê uma página no browser e não uma janela normal?**
Uma página fica igual no PC e no telemóvel, abre num 2.º monitor e não precisa de nada instalado a mais. Também a podes abrir numa janela própria (Opções → Geral → Painel numa janela) com o Edge, Chrome, Brave ou Vivaldi.

**Posso mudar o aspeto?**
Sim, em Opções → Aparência: 25 esquemas de cores, 7 estilos (Néon, Simples, Terminal antigo, Clássico, Vidro, Blocos, Elegante), combinações prontas e ajustes de letra, cantos, fundo e tamanho. Podes guardar os teus temas e partilhá-los num ficheiro.

## Instalar, atualizar e desinstalar

**Como instalo?**
Transfere o zip, botão direito → **Extrair tudo…**, abre a pasta e corre o **`INSTALL NEXUS.bat`**. Escolhe a pasta, os extras opcionais e aceita o pedido de administrador. Passos completos no [README](README.pt.md#instalar).

**Porque precisa de administrador?**
No modo **Completo**, o NEXUS lê temperaturas, ventoinhas e consumos (precisa de um driver de hardware) e aplica otimizações do Windows, que precisam de administrador. Arranca com o Windows já elevado, por isso só aceitas o pedido uma vez. O modo **Normal** não precisa de administrador, mas mostra menos sensores.

**Porque é um .bat e não um instalador normal?**
Para não haver nada escondido: o zip traz o código (pasta `codigo`) e o instalador compila-o no teu PC com o compilador de C# que vem com o Windows. Podes ler cada linha do que corre.

**O que é que o instalador descarrega?**
O LibreHardwareMonitor (sensores) e, se escolheres, o PresentMon (FPS dos jogos), o gdu (motor do Deep Scan) e o driver PawnIO (acesso ao hardware). Tudo open-source, descarregado das fontes oficiais.

**Como atualizo?**
O NEXUS procura versões novas ao abrir e de hora a hora, mostra o que muda e instala com um botão (confere o SHA-256 do download antes). À mão: corre o `UPDATE NEXUS.bat` do zip pequeno de atualização (serve se estiveres até 2 versões atrás) ou usa o zip completo.

**Posso desligar a procura de atualizações?**
Sim: Opções → Geral. Aí o NEXUS nunca contacta o GitHub sozinho.

**As definições ficam quando atualizo ou reinstalo?**
Ficam. Estão em `Documentos\NEXUS Monitor`, à parte da pasta do programa.

**Como desinstalo?**
No NEXUS: **Opções → Geral → Desinstalar**, ou botão direito no ícone junto ao relógio → **Desinstalar o NEXUS…**. Também em Definições do Windows → Aplicações, ou com o `UNINSTALL NEXUS.bat` na pasta do NEXUS. Mostra o que vai ser removido e pergunta antes de apagar; podes guardar as definições para uma reinstalação. Se quiseres o Windows exatamente como estava, carrega antes em **REPOR** na Performance.

**Posso mudar o NEXUS para outro disco?**
Sim: corre o instalador outra vez e escolhe a pasta nova. A cópia antiga é apagada e as definições ficam.

## Privacidade e segurança

**O NEXUS envia os meus dados para algum lado?**
Não. Não há contas, anúncios, telemetria nem servidores do NEXUS. Fica tudo no teu PC. As únicas ligações são as que pedes (teste de velocidade, notificações no telemóvel pelo ntfy, abrir jogos) e a verificação de atualizações neste repositório, que se pode desligar. Detalhes em [PRIVACIDADE.md](PRIVACIDADE.md).

**O antivírus diz que é perigoso. É seguro?**
Programas novos sem assinatura paga às vezes são marcados pela análise automática. O NEXUS é compilado no teu PC a partir do código que vem no zip, por isso podes confirmar. Se acontecer, comunica ao antivírus como falso positivo e diz-nos numa [issue](../../issues).

**Posso levar ban em jogos online?**
O NEXUS não mexe nos jogos: não lê nem altera a memória ou os ficheiros deles e não injeta nada. Os FPS vêm do registo de eventos do próprio Windows (PresentMon), o mesmo que as ferramentas da Microsoft e da Intel usam. O overlay é uma janela à parte, por cima. Alguns anti-cheats de kernel podem ser rígidos com drivers de monitorização de hardware; se um jogo se queixar, passa o NEXUS para o modo **Normal** (Opções → Geral), que não carrega o driver.

**Quem pode abrir o painel noutro aparelho?**
Só os aparelhos que aceitares no PC. O acesso pelo telemóvel está desligado até o ligares, usa uma chave secreta (código QR) e funciona na rede de casa. Podes criar uma chave nova quando quiseres, o que desliga todos os telemóveis. Também há um link só de leitura para mostrares o teu PC a alguém.

## Sensores e monitorização

**Não aparecem temperaturas ou ventoinhas.**
Confirma que o NEXUS está no modo **Completo** e a correr como administrador (Opções → Geral). Algumas placas-mãe não mostram certas ventoinhas e alguns portáteis escondem-nas de todo.

**Uma ventoinha aparece com 0 RPM.**
As ventoinhas que param com temperaturas baixas (modo 0 RPM) ficam escondidas enquanto estão a 0. Se uma ventoinha que estava a rodar parar, o NEXUS avisa (Avisos).

**O NEXUS controla as ventoinhas?**
Nas placas-mãe que deixam, sim (modo Completo): Performance → Hardware → Ventoinhas, com curvas e proteção para bombas de água.

**Onde fica o histórico e durante quanto tempo?**
No teu PC, em `Documentos\NEXUS Monitor`. O painel guarda o histórico recente e as sessões de jogo; o tempo de ecrã guarda 30 dias.

## Jogos e FPS

**Os FPS não aparecem.**
Os FPS precisam do PresentMon (opcional no instalador; podes juntá-lo depois correndo o instalador outra vez). Alguns jogos com anti-cheats muito rígidos bloqueiam o registo de eventos; nesses não há FPS.

**O que é o 1% low?**
Os FPS do 1% de frames mais lentos. Mostra os engasgos melhor do que a média.

**Qual a diferença entre um engasgo e FPS baixos?**
FPS baixos é o jogo todo lento. Um engasgo é um frame que demora muito mais do que os outros; sente-se como um soluço mesmo com FPS altos. Jogos → Engasgos conta-os por sessão e mostra os piores minutos.

**Como comparo antes e depois de mudar alguma coisa?**
Jogos → Medir FPS: faz uma medição chamada "antes", muda o que quiseres e faz outra chamada "depois". Início → Antes e depois de mudar peças faz o mesmo para upgrades.

**Posso abrir jogos pelo telemóvel?**
Sim, com o Controlo do PC ligado: Jogos → Abrir jogos pelo telemóvel (jogos da Steam e jogos que já jogaste).

**O NEXUS substitui o Razer Synapse ou o Logitech G HUB?**
Em grande parte, sim (exceto as luzes RGB): em Performance → Controlos mudas o DPI, os níveis de DPI, a taxa de envio, vês a bateria, o tempo até adormecer, a roda dos MX e mais. Só aparece o que o teu aparelho suporta. Se o Synapse ou o G HUB estiverem abertos, podem desfazer o que mudares.

**Como funciona o equalizador?**
Carrega em ATIVAR O EQUALIZADOR (Performance → Controlos). O NEXUS descarrega o motor do Equalizer APO (gratuito, código aberto, GPL), verifica-o por SHA-256, instala-o em silêncio e liga-o ele próprio aos teus aparelhos de som: sem janelas, atalhos no menu Iniciar, entrada na lista de programas nem verificador de atualizações. O Windows pede permissão uma vez e não é preciso reiniciar. "Remover o equalizador do PC" deixa o som do Windows exatamente como estava. Depois, em Performance → Controlos escolhes um ajuste pronto, mexes em 10 bandas ou, no modo avançado, em filtros. Para mais de 60 auscultadores conhecidos aparece uma correção do som feita para eles, com base no projeto AutoEq (licença MIT).

**As macros podem dar ban?**
Nos jogos com anti-cheat (Valorant, Fortnite, Apex, CoD…) o NEXUS desliga as macros e o turbo. Podes autorizar uma macro por tua conta, mas o risco é teu.

**O NEXUS vê o que escrevo?**
Só quando ligas as macros e atalhos, e só para reconhecer as teclas dos teus atalhos. Nada é guardado (exceto as macros que gravares) e nada sai do PC.

**O que é a rota para jogos? Parece o ExitLag.**
É parecida e é grátis: em Performance → Rede, o NEXUS pode passar o tráfego de um jogo pela rede da Cloudflare (Cloudflare WARP) quando isso baixa o ping. Está desligada até a ligares, pede autorização antes, e só o tráfego do jogo passa por lá.

**A rota pode desligar-me do servidor?**
Não. A rota nunca muda a meio de uma partida. Quando a Cloudflare é mais rápida, liga-se logo que abres o jogo da próxima vez, antes de entrares num servidor, e desliga-se quando o fechas. Os testes durante o jogo não tocam na ligação do jogo.

**A rota quebra a regra de nada sair do PC?**
É a única exceção e é opcional: só funciona depois de autorizares, e o tráfego desse jogo passa pela Cloudflare. A política de privacidade explica tudo. Podes retirar a autorização e desinstalar o WARP no mesmo cartão.

## Otimizações

**As otimizações podem estragar o Windows?**
Cada uma mostra o risco e o ganho estimado. O NEXUS guarda o valor original antes de mudar e **REPOR** volta exatamente ao que estava. Antes de aplicar é criado um ponto de restauro do Windows (no máximo um por dia).

**Quais devo aplicar?**
As marcadas como **RECOMENDADA** já vêm escolhidas e são seguras para o teu PC. Cada categoria mostra quanto do ganho estimado já está ativo e quanto falta.

**O que faz o botão da NVIDIA App?**
Desliga a NVIDIA App, o overlay dela, as entradas de arranque, o serviço e as tarefas. O driver e o Painel de Controlo NVIDIA ficam. "Manter desligada" volta a desligar sempre que o NEXUS arranca. Tudo reversível.

**O NEXUS faz overclock?**
Não. Pode baixar ou subir o limite de energia da placa dentro do que a NVIDIA permite, limitar FPS e mudar o plano de energia, mas não mexe em frequências nem voltagens.

## Discos (Deep Scan)

**O que há no Deep Scan?**
Quatro separadores: **Analisar** (mapa de um disco ou pasta, tipos de ficheiro, conteúdo das pastas e maiores ficheiros), **Limpar** (limpeza rápida, duplicados, espaço da Steam, espaço escondido), **Saúde** (saúde SMART com o motivo dos avisos, vida dos SSD, otimizar, velocidade, poupar o SSD) e **Programas** (desinstalar programas com os restos, programas esquecidos).

**Um disco aparece com aviso. O que faço?**
Primeiro faz cópia do que é importante. O Deep Scan → Saúde explica o motivo (falha prevista, setores trocados ou à espera, erros no cabo…) e o que fazer. "Falha prevista" ou setores à espera querem dizer que o disco deve ser substituído.

**A limpeza é segura?**
Só apaga o que o Windows e os programas voltam a criar (caches, temporários, registos antigos). Os duplicados e os restos de desinstalações vão para a Reciclagem, e as chaves do registo ficam guardadas numa cópia antes de serem apagadas.

## Telemóvel e rede

**Como abro o NEXUS no telemóvel?**
Opções → Telemóvel: liga o acesso e lê o código QR com um telemóvel na mesma rede. Depois aceita o telemóvel no PC. Podes pô-lo no ecrã principal como uma app.

**Funciona fora de casa?**
O painel só funciona na rede de casa. As notificações (avisos de temperatura, fim de um download ou de uma sessão de jogo…) chegam ao telemóvel em qualquer sítio pela app grátis ntfy.

**O que dá para fazer pelo telemóvel?**
Ver o painel, usar o telemóvel como comando do PC, abrir jogos, controlar a música e desligar o PC quando um download acabar. Mudar definições e apagar ficheiros só no PC.

## Stream Deck

**Como junto as teclas?**
O instalador oferece o plugin quando encontra a Stream Deck. Depois: corre o `INSTALL STREAM DECK ADDON.bat` na pasta do NEXUS. Na app Stream Deck, procura a categoria **NEXUS Monitor**.

**Depois de atualizar não aparecem as teclas novas.**
As atualizações refazem o plugin quando ele muda. Se as teclas continuarem antigas, corre o `INSTALL STREAM DECK ADDON.bat` na pasta do NEXUS e reabre a app Stream Deck.

## Quando algo corre mal

**Por onde começo?**
Performance → **🩺 Problemas** → **Primeiros socorros**: passo a passo para crashes, PC a desligar-se em jogo, temperaturas altas, FPS baixos, lag, ecrãs azuis, discos com aviso, PC lento e ventoinhas paradas.

**Como peço ajuda sem partilhar dados pessoais?**
Problemas → **Zip de suporte** cria um ficheiro com peças, discos, drivers, crashes e definições, com nomes, IPs, MACs e códigos trocados por `<...>`. Fica nas Transferências; nada é enviado sozinho.

**O NEXUS não abre ou a página não carrega.**
Vê o ícone junto ao relógio (ícones ocultos ^). Abre `http://localhost:8765` no browser. Se mesmo assim não der, corre o instalador outra vez: as definições ficam.

## Contribuir

**Encontrei um erro / tenho uma ideia.**
Abre uma [issue](../../issues/new/choose) com o modelo. Nos erros, diz a versão (fundo do painel), a versão do Windows e o que aconteceu; o zip de suporte ajuda muito.

**Posso alterar o código?**
Sim. O código está no zip e em cada versão em [`versoes/`](versoes). Tem licença MIT, por isso podes fazer fork e partilhar as tuas alterações.
